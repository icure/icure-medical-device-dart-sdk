@Timeout(Duration(hours: 1))
import 'dart:convert';
import 'dart:io';

import 'package:icure_dart_sdk/api.dart' as rapi;
import 'package:icure_dart_sdk/util/binary_utils.dart';
import 'package:icure_medical_device_dart_sdk/api.dart';
import 'package:icure_medical_device_dart_sdk/mappers/patient.dart';
import "package:test/test.dart";
import 'package:uuid/uuid.dart';
import 'package:uuid/uuid_util.dart';

void main() {
  final Uuid uuid = Uuid();

  Future<MedTechApi> medtechApi() async {
    final MedTechApiBuilder builder = MedTechApiBuilder();
    builder.iCureBasePath = 'https://kraken.icure.dev';
    builder.userName = 'abdemotst2';
    builder.password = '27b90f6e-6847-44bf-b90f-6e6847b4bf1c';

    var fileUri = Uri.file("test/resources/keys/782f1bcd-9f3f-408a-af1b-cd9f3f908a98-icc-priv.2048.key", windows: false);
    var hcpKeyFile = File.fromUri(fileUri);

    builder.addKeyPair("782f1bcd-9f3f-408a-af1b-cd9f3f908a98", (await hcpKeyFile.readAsString(encoding: utf8)).toPrivateKey());

    return builder.build();
  }

  rapi.DecryptedPatientDto getPatient() => rapi.DecryptedPatientDto(
      id: uuid.v4(options: {'rng': UuidUtil.cryptoRNG}), firstName: 'John', lastName: 'Doe', note: 'Premature optimization is the root of all evil');

  group('tests for PatientApi', () {
    test('test createPatient', () async {
      // Init
      final MedTechApi api = await medtechApi();
      final PatientApiImpl patientApi = PatientApiImpl(api);

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
              searchString: "du")
      ))?.rows ?? [];

      expect(patients.length > 1, true);

      // Then
    });

  });
}
