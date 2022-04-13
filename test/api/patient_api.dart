@Timeout(Duration(hours: 1))
import 'package:icure_dart_sdk/api.dart' as rapi;
import 'package:icure_dart_sdk/crypto/crypto.dart';
import 'package:icure_dart_sdk/util/binary_utils.dart';
import 'package:icure_medical_device_dart_sdk/api.dart';
import 'package:icure_medical_device_dart_sdk/mappers/patient.dart';
import 'package:icure_medical_device_dart_sdk/utils/net_utils.dart';
import "package:test/test.dart";
import 'package:uuid/uuid.dart';
import 'package:uuid/uuid_util.dart';

import '../utils/test_utils.dart';

void main() {
  final Uuid uuid = Uuid();

  Future<MedTechApi> medtechApi() async {
    return await TestUtils.medtechApi();
  }

  HealthcareElement getHealthElementDto() => HealthcareElement(note: 'Premature optimization is the root of all evil');

  rapi.DecryptedPatientDto getPatient() => rapi.DecryptedPatientDto(
      id: uuid.v4(options: {'rng': UuidUtil.cryptoRNG}), firstName: 'John', lastName: 'Doe', note: 'Premature optimization is the root of all evil');

  group('tests for PatientApi', () {
    test('test createPatient', () async {
      // Init
      final MedTechApi api = await medtechApi();
      final rapi.DecryptedPatientDto patient = getPatient();

      // When
      final Patient? createdPatient = await api.patientApi.createOrModifyPatient(PatientDtoMapper(patient).toPatient());

      // Then
      expect(createdPatient!.id, patient.id);
      expect(createdPatient.firstName, patient.firstName);
      expect(createdPatient.lastName, patient.lastName);
      expect(createdPatient.note, patient.note);
    });

    test('test getPatient', () async {
      // Init
      final MedTechApi api = await medtechApi();
      final rapi.DecryptedPatientDto patient = getPatient();

      // When
      final Patient? createdPatient = await api.patientApi.createOrModifyPatient(PatientDtoMapper(patient).toPatient());
      final Patient? gotPatient = await api.patientApi.getPatient(createdPatient!.id!);

      // Then
      expect(createdPatient.id, gotPatient!.id);
      expect(createdPatient.firstName, gotPatient.firstName);
      expect(createdPatient.lastName, gotPatient.lastName);
      expect(createdPatient.note, gotPatient.note);
    });

    test('test filterPatient', () async {
      // Init
      final MedTechApi api = await medtechApi();

      // When
      var patients = (await api.patientApi.filterPatients(
          PatientByHcPartyNameContainsFuzzyFilter(
              healthcarePartyId: (await api.userApi.getLoggedUser())!.healthcarePartyId!,
              searchString: "maes")
      ))?.rows ?? [];

      expect(patients.length == 3, true);

      // Then
    });

    test('test createPatient with crypto', () async {
      // Init
      final MedTechApi api = await medtechApi();
      final rapi.DecryptedPatientDto patient = rapi.DecryptedPatientDto(id: uuid.v4(options: {'rng': UuidUtil.cryptoRNG}), firstName: 'John', lastName: 'Doe');

      // When
      final Patient? createdPatient = await api.patientApi.createOrModifyPatient(PatientDtoMapper(patient).toPatient());
      var idUser = uuid.v4(options: {'rng': UuidUtil.cryptoRNG});
      var passwordUser = uuid.v4(options: {'rng': UuidUtil.cryptoRNG});
      final User? createdUser = await api.userApi.createOrModifyUser(new User(id: idUser, login: idUser.substring(0, 8), patientId: createdPatient!.id, passwordHash: passwordUser));

      var patMedtechApi = MedTechApiBuilder()
          .withICureBasePath('https://kraken.icure.dev')
          .withUserName(createdUser!.login!)
          .withPassword(passwordUser)
          .withAuthServerUrl("https://msg-gw.icure.cloud/km")
          .withAuthProcessId("f0ced6c6-d7cb-4f78-841e-2674ad09621e")
          .build();

      final patUser = await retry(() => patMedtechApi.userApi.getLoggedUser());
      final keyPair = generateRandomPrivateAndPublicKeyPair();
      final pat = await patMedtechApi.patientApi.getPatient(patUser!.patientId!);

      pat!.publicKey = keyPair.item2;

      final modPat = await patMedtechApi.patientApi.createOrModifyPatient(pat);
      patMedtechApi = MedTechApiBuilder()
          .withICureBasePath('https://kraken.icure.dev')
          .withUserName(createdUser.login!)
          .withPassword(passwordUser)
          .addKeyPair(pat.id!, keyPair.item1.keyFromHexString())
          .withAuthServerUrl("https://msg-gw.icure.cloud/km")
          .withAuthProcessId("f0ced6c6-d7cb-4f78-841e-2674ad09621e")
          .build();

      final pat2 = await patMedtechApi.patientApi.giveAccessTo(modPat!, modPat.id!);
      pat2.note = "Secret";
      final modPat2 = (await patMedtechApi.patientApi.createOrModifyPatient(pat2))!;

      // Then
      expect(modPat2.id, pat2.id);
      expect(modPat2.firstName, pat2.firstName);
      expect(modPat2.lastName, pat2.lastName);
      expect(modPat2.note, pat2.note);

      // Init
      final HealthcareElement hE = getHealthElementDto();
      final createdHealthElement = await patMedtechApi.healthcareElementApi.createOrModifyHealthcareElement(modPat2.id!, hE);

      final filteredHealthElement =
          await patMedtechApi.healthcareElementApi.filterHealthcareElement(HealthcareElementByIdsFilter(ids: {createdHealthElement!.id!}));

      assert(filteredHealthElement!.rows.length == 1);
    });
  });

  test("Creating account for HK", () async {
    final email = "XXX";
    final username = Uuid(options: {'rng': UuidUtil.cryptoRNG}).v4().toString().substring(0, 6);

    final AnonymousMedTechApi api = TestUtils.getAnonymousApi();

    print("Username: ${username}");
    print("email: ${email}");

    final proc = await api.authenticationApi.startAuthentication('HCP_ID', username, '', email, 'RECAPTCHA');

    print("processId id: ${proc?.processId}");

    assert(proc != null);
  });

  test("Completing account", () async {
    final email = "XXX";
    final validationCode = "XXX";
    final processId = "XXX";

    final AnonymousMedTechApi api = TestUtils.getAnonymousApi(authProcessId: "6a355458dbfa392cb56244031907f47a");

    final keyPair = generateRandomPrivateAndPublicKeyPair();

    final tokenAndKeyProvider = (String userId, String groupId) async {
      return null;
    };
    print("Private Key : ${keyPair.item1}");
    print("Public  Key : ${keyPair.item2}");

    final result =
        await api.authenticationApi.completeAuthentication(AuthenticationProcess(processId, email), validationCode, keyPair, tokenAndKeyProvider);

    var patMedtechApi = result.medTechApi;

    final currentUser = await patMedtechApi.userApi.getLoggedUser();
    final currentPatient = await patMedtechApi.patientApi.getPatient(currentUser!.patientId!);

    print("User ID: ${currentUser.id}");
    print("Patient ID: ${currentUser.patientId}");

    // Then
    assert(currentUser != null);
    assert(currentPatient != null);
  });

  test("Connecting patient account", () async {
    final api = await TestUtils.getApiFromCredentialsToken(credentialsFilePath: "pat_xitoko4453_kino.json");

    final currentUser = await api.userApi.getLoggedUser();
    final currentPatient = await api.patientApi.getPatient(currentUser!.patientId!);

    // Then
    assert(currentUser != null);
    assert(currentPatient != null);
  });

  test("Connecting HCP account", () async {
    final api = await TestUtils.getApiFromCredentialsToken(credentialsFilePath: "hcp_kotipi5184_kino.json");

    final currentUser = await api.userApi.getLoggedUser();

    // Then
    assert(currentUser != null);
    assert(currentUser?.healthcarePartyId != null);
  });

  test("Sharing delegation patient to HCP", () async {
    final patApi = await TestUtils.getApiFromCredentialsToken(credentialsFilePath: "pat_xitoko4453_kino.json");
    final hcpApi = await TestUtils.getApiFromCredentialsToken(credentialsFilePath: "hcp_kotipi5184_kino.json");

    final currentUser = await patApi.userApi.getLoggedUser();
    final currentHcp = await hcpApi.userApi.getLoggedUser();

    final currentPatient = await patApi.patientApi.getPatient(currentUser!.patientId!);

    final delegatedPatient = await patApi.patientApi.giveAccessTo(currentPatient!, currentHcp!.healthcarePartyId!);
    assert(delegatedPatient != null);

    final hcpCurrentPatient = await hcpApi.patientApi.getPatient(currentUser.patientId!);
    assert(hcpCurrentPatient != null);
  });
}
