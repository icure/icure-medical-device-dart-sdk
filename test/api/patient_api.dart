@Timeout(Duration(hours: 1))
import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:crypton/crypton.dart';
import 'package:icure_medical_device_dart_sdk/api.dart';
import 'package:pointycastle/export.dart' as pointy;
import "package:test/test.dart";
import 'package:uuid/uuid.dart';
import 'package:uuid/uuid_util.dart';

final Uuid uuid = Uuid();

Future<MedTechApi> createPatientWithUserAndApi(MedTechApi initialApi) async {
  final userKeyPair = generateRandomPrivateAndPublicKeyPair();

  final Patient patient = Patient(
      firstName: 'Dirk',
      lastName: 'Gently',
      systemMetaData: new SystemMetaDataOwnerEncrypted(
          publicKey: userKeyPair.item2
      )
  );

  // When
  final Patient? createdPatient = await initialApi.patientApi.createOrModifyPatient(patient);
  var idUser = uuid.v4(options: {'rng': UuidUtil.cryptoRNG});
  final User? createdUser = await initialApi.userApi
      .createOrModifyUser(
      new User(
          id: idUser,
          login: idUser.substring(0, 8),
          patientId: createdPatient!.id,
      )
  );

  final token = await initialApi.userApi.createToken(createdUser!.id!);

  await initialApi.patientApi.giveAccessTo(createdPatient, createdPatient.id!);

  return await MedTechApiBuilder.newBuilder()
      .withICureBasePath(Platform.environment["ICURE_DART_TEST_URL"]!)
      .withUserName(createdUser.login!)
      .withPassword(token!)
      .addKeyPair(createdPatient.id!, userKeyPair.item1.keyFromHexString())
      .build();

}

Future<MedTechApi> createHCPWithUserAndApi(MedTechApi initialApi) async {
  final userKeyPair = generateRandomPrivateAndPublicKeyPair();

  final HealthcareProfessional hcp = HealthcareProfessional(
      firstName: 'Amanda',
      lastName: 'Green',
      systemMetaData: new SystemMetaDataOwner(
          publicKey: userKeyPair.item2
      )
  );

  // When
  final HealthcareProfessional? createdHCP = await initialApi.healthcareProfessionalApi.createOrModifyHealthcareProfessional(hcp);
  var idUser = uuid.v4(options: {'rng': UuidUtil.cryptoRNG});
  final User? createdUser = await initialApi.userApi
      .createOrModifyUser(
      new User(
          id: idUser,
          login: idUser.substring(0, 8),
          healthcarePartyId: createdHCP!.id,
      )
  );

  final token = await initialApi.userApi.createToken(createdUser!.id!);

  return await MedTechApiBuilder.newBuilder()
      .withICureBasePath(Platform.environment["ICURE_DART_TEST_URL"]!)
      .withUserName(createdUser.login!)
      .withPassword(token!)
      .addKeyPair(createdHCP.id!, userKeyPair.item1.keyFromHexString())
      .build();
}

void main() {
  
  MedTechApi? api;

  HealthcareElement getHealthElementDto() => HealthcareElement(note: 'Premature optimization is the root of all evil');

  Patient getPatient() => Patient(firstName: 'John', lastName: 'Doe', note: 'Premature optimization is the root of all evil');

  setUpAll(() async {
    final initialApi = await MedTechApiBuilder.newBuilder()
        .withICureBasePath(Platform.environment["ICURE_DART_TEST_URL"]!)
        .withUserName(Platform.environment["ICURE_TS_TEST_HCP_USER"]!)
        .withPassword(Platform.environment["ICURE_TS_TEST_HCP_PWD"]!)
        .addKeyPair(
          Platform.environment["ICURE_TS_TEST_HCP_ID"]!,
          Platform.environment["ICURE_TS_TEST_HCP_PRIV_KEY"]!.keyFromHexString()
        )
        .build();

    final professionalKeys = generateRandomPrivateAndPublicKeyPair();
    final delegateHcp = await initialApi.healthcareProfessionalApi.createOrModifyHealthcareProfessional(
      new HealthcareProfessional(
        firstName: "Arthur",
        lastName: "Dent",
        systemMetaData: new SystemMetaDataOwner(
          publicKey: professionalKeys.item2
        )
      )
    );

    final hcpUser = await initialApi.userApi.createOrModifyUser(
      new User(
        id: uuid.v4(options: {'rng': UuidUtil.cryptoRNG}),
        login: "hcp-${uuid.v4(options: {'rng': UuidUtil.cryptoRNG})}-delegate",
        status: UserStatus.ACTIVE,
        healthcarePartyId: delegateHcp!.id
      )
    );

    final token = await initialApi.userApi.createToken(hcpUser!.id!);

    api = await MedTechApiBuilder.newBuilder()
        .withICureBasePath(Platform.environment["ICURE_DART_TEST_URL"]!)
        .withUserName(hcpUser.login!)
        .withPassword(token!)
        .addKeyPair(
        hcpUser.healthcarePartyId!,
        professionalKeys.item1.keyFromHexString()
        )
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
      expect(createdPatient.systemMetaData?.publicKey, userKeyPair.item2);
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

      final patMedtechApi = await createPatientWithUserAndApi(api!);

      final createdUser = (await patMedtechApi.userApi.getLoggedUser())!;
      final createdPatient = (await patMedtechApi.patientApi.getPatient(createdUser.patientId!))!;

      createdPatient.note = "Secret";
      final modPat = (await patMedtechApi.patientApi.createOrModifyPatient(createdPatient))!;

      patMedtechApi.crypto.clearCachesFor(modPat.id!);
      api!.crypto.clearCachesFor(modPat.id!);

      // Then
      expect(modPat.id, createdPatient.id);
      expect(modPat.firstName, createdPatient.firstName);
      expect(modPat.lastName, createdPatient.lastName);
      expect(modPat.note, createdPatient.note);
      expect(modPat.systemMetaData?.publicKey != null, true);
      expect(modPat.systemMetaData!.publicKey, createdPatient.systemMetaData?.publicKey);

      // Init
      final HealthcareElement hE = getHealthElementDto();
      final createdHealthElement = await patMedtechApi.healthcareElementApi.createOrModifyHealthcareElement(modPat.id!, hE);

      final filteredHealthElement =
          await patMedtechApi.healthcareElementApi.filterHealthcareElement(HealthcareElementByIdsFilter(ids: {createdHealthElement!.id!}));

      assert(filteredHealthElement!.rows.length == 1);
    });

    test("Sharing delegation patient to HCP", () async {

      // Init: Creation of user and Hcp
      final patMedtechApi = await createPatientWithUserAndApi(api!);
      final createdUser = (await patMedtechApi.userApi.getLoggedUser())!;
      final createdPatient = (await patMedtechApi.patientApi.getPatient(createdUser.patientId!))!;

      final hcpMedtechApi = await createHCPWithUserAndApi(api!);
      final hcpUser = (await hcpMedtechApi.userApi.getLoggedUser())!;

      final delegatedPatient = await patMedtechApi.patientApi.giveAccessTo(createdPatient, hcpUser.healthcarePartyId!);
      assert(delegatedPatient.systemMetaData!.delegations.containsKey(hcpUser.healthcarePartyId!));
      assert(delegatedPatient.systemMetaData!.encryptionKeys.containsKey(hcpUser.healthcarePartyId!));

      final hcpCurrentPatient = await hcpMedtechApi.patientApi.getPatient(createdUser.patientId!);
      assert(hcpCurrentPatient != null);
    });

    test('Update patient lastname and first name', () async {
      // Init
      final patMedtechApi = await createPatientWithUserAndApi(api!);
      final createdUser = (await patMedtechApi.userApi.getLoggedUser())!;
      final patient = (await patMedtechApi.patientApi.getPatient(createdUser.patientId!))!;

      print("BEFORE CHANGE :");
      print("First name: ${patient.firstName}");
      print("Last name: ${patient.lastName}");
      print("---");

      // When
      patient.lastName = uuid.v4(options: {'rng': UuidUtil.cryptoRNG}).substring(0, 8);
      patient.firstName = uuid.v4(options: {'rng': UuidUtil.cryptoRNG}).substring(0, 8);

      final updatedPatient = await patMedtechApi.patientApi.createOrModifyPatient(patient);
      final gotPatient = await patMedtechApi.patientApi.getPatient(createdUser.dataOwnerId()!);

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
  });
}
