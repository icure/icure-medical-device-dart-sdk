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

  rapi.DecryptedPatientDto getPatient() => rapi.DecryptedPatientDto(
      id: uuid.v4(options: {'rng': UuidUtil.cryptoRNG}), firstName: 'John', lastName: 'Doe', note: 'Premature optimization is the root of all evil');

  group('tests for PatientApi', () {
    test('test createPatient', () async {
      // Init
      final MedTechApi api = await medtechApi();

      final PatientApi patientApi = api.patientApi;

      final rapi.DecryptedPatientDto patient = getPatient();

      // When
      final Patient? createdPatient = await patientApi.createOrModifyPatient(PatientDtoMapper(patient).toPatient());

      // Then
      expect(createdPatient!.id, patient.id);
      expect(createdPatient.firstName, patient.firstName);
      expect(createdPatient.lastName, patient.lastName);
      expect(createdPatient.note, patient.note);
    });

    test('test getPatient', () async {
      // Init
      final MedTechApi api = await medtechApi();
      final PatientApiImpl patientApi = PatientApiImpl(api);

      final rapi.DecryptedPatientDto patient = getPatient();

      // When
      final Patient? createdPatient = await patientApi.createOrModifyPatient(PatientDtoMapper(patient).toPatient());
      final Patient? gotPatient = await patientApi.getPatient(createdPatient!.id!);

      // Then
      expect(createdPatient.id, gotPatient!.id);
      expect(createdPatient.firstName, gotPatient.firstName);
      expect(createdPatient.lastName, gotPatient.lastName);
      expect(createdPatient.note, gotPatient.note);
    });

    test('test filterPatient', () async {
      // Init
      final MedTechApi api = await medtechApi();
      final PatientApiImpl patientApi = PatientApiImpl(api);
      final UserApiImpl userApi = UserApiImpl(api);

      // When
      var patients = (await patientApi.filterPatients(
          PatientByHcPartyNameContainsFuzzyFilter(
              healthcarePartyId: (await userApi.getLoggedUser())!.healthcarePartyId!,
              searchString: "maes")
      ))?.rows ?? [];

      expect(patients.length == 3, true);

      // Then
    });

    test('test createPatient with crypto', () async {
      // Init
      final MedTechApi api = await medtechApi();

      final PatientApi patientApi = api.patientApi;
      final UserApi userApi = api.userApi;

      final rapi.DecryptedPatientDto patient = rapi.DecryptedPatientDto(id: uuid.v4(options: {'rng': UuidUtil.cryptoRNG}), firstName: 'John', lastName: 'Doe');

      // When
      final Patient? createdPatient = await patientApi.createOrModifyPatient(PatientDtoMapper(patient).toPatient());
      var idUser = uuid.v4(options: {'rng': UuidUtil.cryptoRNG});
      var passwordUser = uuid.v4(options: {'rng': UuidUtil.cryptoRNG});
      final User? createdUser = await userApi.createOrModifyUser(new User(id: idUser, login: idUser.substring(0, 8), patientId: createdPatient!.id, passwordHash: passwordUser));

      var patMedtechApi = MedTechApiBuilder()
          .withICureBasePath('https://kraken.icure.dev')
          .withUserName(createdUser!.login!)
          .withPassword(passwordUser)
          .withMsgGtwUrl("https://msg-gw.icure.cloud/km")
          .withSignUpProcessId("f0ced6c6-d7cb-4f78-841e-2674ad09621e")
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
          .withMsgGtwUrl("https://msg-gw.icure.cloud/km")
          .withSignUpProcessId("f0ced6c6-d7cb-4f78-841e-2674ad09621e")
          .build();

      final pat2 = await patMedtechApi.patientApi.getPatient(patUser.patientId!);
      pat2!.note = "Secret";
      pat2.systemMetaData!.delegations = {};
      pat2.systemMetaData!.encryptionKeys = {};
      final modPat2 = (await patMedtechApi.patientApi.createOrModifyPatient(pat2))!;

      // Then
      expect(modPat2.id, pat2.id);
      expect(modPat2.firstName, pat2.firstName);
      expect(modPat2.lastName, pat2.lastName);
      expect(modPat2.note, pat2.note);
    });


  });
}
