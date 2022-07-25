@Timeout(Duration(hours: 1))
import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:icure_dart_sdk/api.dart' as base_api;
import 'package:crypton/crypton.dart';
import 'package:icure_medical_device_dart_sdk/api.dart';
import 'package:icure_medical_device_dart_sdk/utils/net_utils.dart';
import 'package:pointycastle/export.dart' as pointy;
import "package:test/test.dart";
import 'package:uuid/uuid.dart';
import 'package:uuid/uuid_util.dart';

import '../utils/test_utils.dart';
import '../utils/test_utils_backend.dart';

const int DB_PORT = 15984;
const int AS_PORT = 16044;
const adminHash = "{R0DLKxxRDxdtpfY542gOUZbvWkfv1KWO9QOi9yvr/2c=}39a484cbf9057072623177422172e8a173bd826d68a2b12fa8e36ff94a44a0d7";

void main() {
  final Uuid uuid = Uuid();
  final userLogin = "hcp-${uuid.v4(options: {'rng': UuidUtil.cryptoRNG})}-delegate";

  // final TestBackend backend = DockerTestBackend.getInstance(DB_PORT, AS_PORT, "icure", "icure", "admin", "admin");
  final TestBackend backend = RemoteTestBackend.getInstance(Platform.environment["KRAKEN_USR"]!, Platform.environment["KRAKEN_PWD"]!);
  HealthcareProfessional? delegateHcp;
  String hcpPrivateKey = "";
  MedTechApi? api;

  HealthcareElement getHealthElementDto() => HealthcareElement(note: 'Premature optimization is the root of all evil');

  Patient getPatient() => Patient(firstName: 'John', lastName: 'Doe', note: 'Premature optimization is the root of all evil');

  setUpAll(() async {
    await backend.init();

    final client = base_api.ApiClient.basic(backend.iCureURL, backend.iCureUser, backend.iCurePwd);
    final hcpKeys = generateRandomPrivateAndPublicKeyPair();
    final initialHcp = await base_api.HealthcarePartyApi(client).createHealthcareParty(
        new base_api.HealthcarePartyDto(id: uuid.v4(), publicKey: hcpKeys.item2, firstName: "test", lastName: "test")
    );
    assert(initialHcp != null);
    final tmpUserLogin = "hcp-${uuid.v4(options: {'rng': UuidUtil.cryptoRNG})}-delegate";
    final user = await base_api.UserApi(client).createUser(
        new base_api.UserDto(
            id: "user-${uuid.v4(options: {'rng': UuidUtil.cryptoRNG})}-hcp",
            login: tmpUserLogin,
            status: base_api.UserDtoStatusEnum.ACTIVE,
            passwordHash: adminHash,
            healthcarePartyId: initialHcp!.id
        )
    );

    expect(user != null, true);

    final initialApi = await MedTechApiBuilder.newBuilder()
        .withICureBasePath(backend.iCureURL)
        .withUserName(tmpUserLogin)
        .withPassword("admin")
        .addKeyPair(initialHcp.id, hcpKeys.item1.keyFromHexString())
        .build();

    final professionalKeys = generateRandomPrivateAndPublicKeyPair();
    hcpPrivateKey = professionalKeys.item1;
    final hcpToAdd = new HealthcareProfessional(
      firstName: "Svlad",
      lastName: "Cjelli",
      systemMetaData: new SystemMetaDataOwner(
        publicKey: professionalKeys.item2
      )
    );

    delegateHcp = await initialApi.healthcareProfessionalApi.createOrModifyHealthcareProfessional(hcpToAdd);

    final hcpUser = await initialApi.userApi.createOrModifyUser(
        new User(
            id: uuid.v4(options: {'rng': UuidUtil.cryptoRNG}),
            login: userLogin,
            status: UserStatus.ACTIVE,
            passwordHash: adminHash,
            healthcarePartyId: delegateHcp!.id
        )
    );

    api = await MedTechApiBuilder.newBuilder()
        .withICureBasePath(backend.iCureURL)
        .withUserName(userLogin)
        .withPassword("admin")
        .addKeyPair(delegateHcp!.id!, hcpPrivateKey.keyFromHexString())
        .build();

    print("Successfully set up test backend!");
  });

  group('tests for PatientApi', () {
    test('test createPatient', () async {
      // Init
      expect(api != null, true);
      final Patient patient = getPatient();
      final userKeyPair = generateRandomPrivateAndPublicKeyPair();
      patient.systemMetaData = SystemMetaDataOwnerEncrypted(publicKey: userKeyPair.item2);

      // When
      final Patient? createdPatient = await api!.patientApi.createOrModifyPatient(patient);

      // Then
      expect(createdPatient!.id != null, true);
      expect(createdPatient.firstName, patient.firstName);
      expect(createdPatient.lastName, patient.lastName);
      expect(createdPatient.note, patient.note);
    });

    test('test getPatient', () async {
      // Init
      expect(api != null, true);
      final Patient patient = getPatient();

      // When
      final Patient? createdPatient = await api!.patientApi.createOrModifyPatient(patient);
      final Patient? gotPatient = await api!.patientApi.getPatient(createdPatient!.id!);

      // Then
      expect(createdPatient.id, gotPatient!.id);
      expect(createdPatient.firstName, gotPatient.firstName);
      expect(createdPatient.lastName, gotPatient.lastName);
      expect(createdPatient.note, gotPatient.note);
    });

    test('test filterPatient', () async {
      // Init
      expect(api != null, true);

      // When
      var patients = (await api!.patientApi.filterPatients(PatientByHcPartyFilter(
                  healthcarePartyId: (await api!.userApi.getLoggedUser())!.healthcarePartyId!)))
              ?.rows ??
          [];

      expect(patients.length == 2, true);

      // Then
    });

    test('test createPatient with crypto', () async {
      // Init
      expect(api != null, true);
      final userKeyPair = generateRandomPrivateAndPublicKeyPair();

      final Patient patient = Patient(
          firstName: 'John',
          lastName: 'Doe',
          systemMetaData: new SystemMetaDataOwnerEncrypted(
            publicKey: userKeyPair.item2
          )
      );

      // When
      final Patient? createdPatient = await api!.patientApi.createOrModifyPatient(patient);
      var idUser = uuid.v4(options: {'rng': UuidUtil.cryptoRNG});
      final User? createdUser = await api!.userApi
          .createOrModifyUser(
          new User(
              id: idUser,
              login: idUser.substring(0, 8),
              patientId: createdPatient!.id,
              passwordHash: adminHash
          )
      );

      final delegatedPatient = await api!.patientApi.giveAccessTo(createdPatient, createdPatient.id!);

      var patMedtechApi = await MedTechApiBuilder.newBuilder()
          .withICureBasePath(backend.iCureURL)
          .withUserName(createdUser!.login!)
          .withPassword("admin")
          .addKeyPair(delegatedPatient.id!, userKeyPair.item1.keyFromHexString())
          .build();

      delegatedPatient.note = "Secret";
      final modPat = (await patMedtechApi.patientApi.createOrModifyPatient(delegatedPatient))!;

      patMedtechApi.crypto.clearCachesFor(modPat.id!);
      api!.crypto.clearCachesFor(modPat.id!);

      // Then
      expect(modPat.id, delegatedPatient.id);
      expect(modPat.firstName, delegatedPatient.firstName);
      expect(modPat.lastName, delegatedPatient.lastName);
      expect(modPat.note, delegatedPatient.note);

      // Init
      final HealthcareElement hE = getHealthElementDto();
      final createdHealthElement = await patMedtechApi.healthcareElementApi.createOrModifyHealthcareElement(modPat.id!, hE);

      final filteredHealthElement =
          await patMedtechApi.healthcareElementApi.filterHealthcareElement(HealthcareElementByIdsFilter(ids: {createdHealthElement!.id!}));

      assert(filteredHealthElement!.rows.length == 1);
    });
  });

  /*
  test("Sharing delegation patient to HCP", () async {
    final hcpApi = await TestUtils.medtechApi(credsFilePath: ".hkCredentials", hcpId: "171f186a-7a2a-40f0-b842-b486428c771b");
    final patApi = await TestUtils.medtechApi(credsFilePath: ".hkPatientCredentials", hcpId: "a37e0a71-07d2-4414-9b2b-2120ae9a16fc");

    final currentUser = await patApi.userApi.getLoggedUser();
    final currentHcp = await hcpApi.userApi.getLoggedUser();

    final currentPatient = await patApi.patientApi.getPatient(currentUser!.patientId!);

    final delegatedPatient = await patApi.patientApi.giveAccessTo(currentPatient!, currentHcp!.healthcarePartyId!);
    assert(delegatedPatient.systemMetaData!.delegations.containsKey(currentHcp.healthcarePartyId!));
    assert(delegatedPatient.systemMetaData!.encryptionKeys.containsKey(currentHcp.healthcarePartyId!));

    final hcpCurrentPatient = await hcpApi.patientApi.getPatient(currentUser.patientId!);
    assert(hcpCurrentPatient != null);
  });

  test('Update patient lastname and first name', () async {
    // Init
    final patApi = await TestUtils.medtechApi(credsFilePath: ".hkPatientCredentials", hcpId: "a37e0a71-07d2-4414-9b2b-2120ae9a16fc");
    final patUser = await patApi.userApi.getLoggedUser();
    final patient = await patApi.patientApi.getPatient(patUser!.dataOwnerId()!);

    print("BEFORE CHANGE :");
    print("First name: ${patient!.firstName}");
    print("Last name: ${patient.lastName}");
    print("---");

    // When
    patient.lastName = uuid.v4(options: {'rng': UuidUtil.cryptoRNG}).substring(0, 8);
    patient.firstName = uuid.v4(options: {'rng': UuidUtil.cryptoRNG}).substring(0, 8);

    final updatedPatient = await patApi.patientApi.createOrModifyPatient(patient);
    final gotPatient = await patApi.patientApi.getPatient(patUser.dataOwnerId()!);

    // Then
    print("AFTER CHANGE :");
    print("First name: ${updatedPatient!.firstName}");
    print("Last name: ${updatedPatient.lastName}");
    print("---");

    expect(updatedPatient.firstName, equals(patient.firstName));
    expect(updatedPatient.lastName, equals(patient.lastName));

    print("AFTER GET :");
    print("First name: ${gotPatient!.firstName}");
    print("Last name: ${gotPatient.lastName}");
    print("---");

    expect(updatedPatient.lastName, equals(gotPatient.lastName));
    expect(updatedPatient.firstName, equals(gotPatient.firstName));
  });

  test("Test eRSA encryption/decryption", () async {
    var fileUri = Uri.file("test/resources/keys/a5af2d04-6ecc-44e8-8c93-38b9748d8d62-icc-priv.2048.key", windows: false);
    var keyFile = File.fromUri(fileUri);
    final privateKey = (await keyFile.readAsString(encoding: utf8)).trim().keyFromHexString();

    final keyPair = RSAKeypair(RSAPrivateKey.fromString(base64.encoder.convert(privateKey)));
    final publicKey = RSAPublicKey.fromString(base64.encoder.convert("xxx".fromHexString()));
    final encryptorForDelegate = pointy.OAEPEncoding(pointy.RSAEngine())
      ..init(true, pointy.PublicKeyParameter<pointy.RSAPublicKey>(publicKey.asPointyCastle));

    final aesKey = Uint8List.fromList(List<int>.generate(32, (i) => random.nextInt(256)));

    final encrypted = encryptorForDelegate.process(aesKey).toHexString();
    final decryptor = pointy.OAEPEncoding(pointy.RSAEngine())
      ..init(false, pointy.PrivateKeyParameter<pointy.RSAPrivateKey>(keyPair.privateKey.asPointyCastle));
    final decrypted = decryptor.process(encrypted.fromHexString());

    var aesKeyText = aesKey.toHexString();
    var decryptedText = decrypted.toHexString();

    final privateKeyAsHex =
        base64Decode(keyPair.privateKey.toPEM().replaceAllMapped(RegExp(r'-----.+?-----'), (match) => '').replaceAll('\n', '')).toHexString();
    final publicKeyAsHex =
        base64Decode(keyPair.publicKey.toPEM().replaceAllMapped(RegExp(r'-----.+?-----'), (match) => '').replaceAll('\n', '')).toHexString();

    assert(aesKeyText == decryptedText);
  });

  test("Test eRSA encryption/decryption", () async {
    var fileUri = Uri.file("test/resources/keys/a5af2d04-6ecc-44e8-8c93-38b9748d8d62-icc-priv.2048.key", windows: false);
    var keyFile = File.fromUri(fileUri);
    final privateKey = (await keyFile.readAsString(encoding: utf8)).trim().keyFromHexString();

    final keyPair = RSAKeypair(RSAPrivateKey.fromString(base64.encoder.convert(privateKey)));
    final publicKey = RSAPublicKey.fromString(base64.encoder.convert("xxx".fromHexString()));
    final encryptorForDelegate = pointy.OAEPEncoding(pointy.RSAEngine())
      ..init(true, pointy.PublicKeyParameter<pointy.RSAPublicKey>(publicKey.asPointyCastle));

    final aesKey = Uint8List.fromList(List<int>.generate(32, (i) => random.nextInt(256)));

    final encrypted = encryptorForDelegate.process(aesKey).toHexString();
    final decryptor = pointy.OAEPEncoding(pointy.RSAEngine())
      ..init(false, pointy.PrivateKeyParameter<pointy.RSAPrivateKey>(keyPair.privateKey.asPointyCastle));
    final decrypted = decryptor.process(encrypted.fromHexString());

    var aesKeyText = aesKey.toHexString();
    var decryptedText = decrypted.toHexString();

    final privateKeyAsHex =
        base64Decode(keyPair.privateKey.toPEM().replaceAllMapped(RegExp(r'-----.+?-----'), (match) => '').replaceAll('\n', '')).toHexString();
    final publicKeyAsHex =
        base64Decode(keyPair.publicKey.toPEM().replaceAllMapped(RegExp(r'-----.+?-----'), (match) => '').replaceAll('\n', '')).toHexString();

    assert(aesKeyText == decryptedText);
  });

   */
}
