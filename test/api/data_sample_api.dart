@Timeout(Duration(hours: 1))
import 'dart:convert';
import 'dart:io';

import 'package:icure_dart_sdk/util/binary_utils.dart';
import 'package:icure_medical_device_dart_sdk/api.dart';
import 'package:icure_medical_device_dart_sdk/utils/iterable_utils.dart';
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

  DataSample getHeightDataSample() => DataSample(
        id: uuid.v4(options: {'rng': UuidUtil.cryptoRNG}),
        content: {"en": Content(numberValue: 159.0)},
        valueDate: 20220203111128,
        labels: [CodingReference(id: "LOINC|8302-2|2", code: "8302-2", type: "LOINC", version: "2")].toSet(),
      );

  DataSample getWeightDataSample() => DataSample(
        id: uuid.v4(options: {'rng': UuidUtil.cryptoRNG}),
        content: {"en": Content(numberValue: 53.5)},
        valueDate: 20220203111034,
        labels: [CodingReference(id: "LOINC|29463-7|2", code: "29463-7", type: "LOINC", version: "2")].toSet(),
      );

  Patient getPatient() => Patient(id: uuid.v4(options: {'rng': UuidUtil.cryptoRNG}), firstName: "Raymond", lastName: "Jamonserano");
  Patient getEmptyPatient() => Patient(id: uuid.v4(options: {'rng': UuidUtil.cryptoRNG}), firstName: "Raymond", lastName: "Jambomaigre");

  group('tests for DataSampleApi', () {
    test('test createOrModifyDataSampleFor CREATE', () async {
      // Init
      final MedTechApi api = await medtechApi();
      final DataSampleApi dataSampleApi = DataSampleApiImpl(api);
      final PatientApi patientApi = PatientApiImpl(api);
      final DataSample weight = getWeightDataSample();
      final DataSample height = getHeightDataSample();
      final dataSamples = [weight, height];
      final Patient patient = getPatient();

      // When
      final createdPatient = await patientApi.createOrModifyPatient(patient);
      final createdDataSamples = await dataSampleApi.createOrModifyDataSamplesFor(createdPatient!.id!, dataSamples);

      // Then
      expect(dataSamples.length, createdDataSamples!.length);
      assert(createdDataSamples.findFirst((it) => it.id == weight.id) != null);
      assert(createdDataSamples.findFirst((it) => it.id == height.id) != null);
    });

    test('test createOrModifyDataSampleFor UPDATE', () async {
      // Init
      final MedTechApi api = await medtechApi();
      final DataSampleApi dataSampleApi = DataSampleApiImpl(api);
      final PatientApi patientApi = PatientApiImpl(api);
      final DataSample weight = getWeightDataSample();
      final Patient patient = getPatient();
      final updateContent = {"en": Content(numberValue: 60.0)};

      // When
      final createdPatient = await patientApi.createOrModifyPatient(patient);
      final createdDataSample = await dataSampleApi.createOrModifyDataSampleFor(createdPatient!.id!, weight);
      createdDataSample!.content = updateContent;
      final updatedDataSample = await dataSampleApi.createOrModifyDataSampleFor(createdPatient.id!, createdDataSample);

      // Then
      expect(createdDataSample.id, updatedDataSample!.id);
      assert(createdDataSample.id == updatedDataSample.id);
      assert(weight.content != updatedDataSample.content);
      expect(updatedDataSample.content["en"]!.numberValue!, updateContent["en"]!.numberValue!);
    });

    test('test getDataSample', () async {
      // Init
      final MedTechApi api = await medtechApi();
      final DataSampleApi dataSampleApi = DataSampleApiImpl(api);
      final PatientApi patientApi = PatientApiImpl(api);
      final DataSample weight = getWeightDataSample();
      final Patient patient = getPatient();

      // When
      final createdPatient = await patientApi.createOrModifyPatient(patient);
      final createdDataSample = await dataSampleApi.createOrModifyDataSampleFor(createdPatient!.id!, weight);
      final gotDataSample = await dataSampleApi.getDataSample(createdDataSample!.id!);

      // Then
      assert(gotDataSample!.id != null && gotDataSample.id == createdDataSample.id);
      assert(createdDataSample.batchId == gotDataSample!.batchId);
      assert(createdDataSample.author == gotDataSample!.author);
    });

    test('test filterDataSample', () async {
      // Init
      final MedTechApi api = await medtechApi();
      final DataSampleApi dataSampleApi = DataSampleApiImpl(api);
      final PatientApi patientApi = PatientApiImpl(api);
      final DataSample weight = getWeightDataSample();
      final Patient patient = getPatient();

      // When
      final createdPatient = await patientApi.createOrModifyPatient(patient);
      final createdDataSample = (await dataSampleApi.createOrModifyDataSampleFor(createdPatient!.id!, weight))!;
      var paginatedListDataSample = await dataSampleApi.filterDataSample(
          await DataSampleFilter()
          .forHcp(HealthcareProfessional(id:(await api.userApi.getLoggedUser())!.healthcarePartyId!))
          .forPatients(api.localCrypto, [createdPatient]).build()
      );
      final gotDataSample = (paginatedListDataSample)!.rows[0];

      // Then
      assert(gotDataSample!.id != null && gotDataSample.id == createdDataSample.id);
      assert(createdDataSample.batchId == gotDataSample!.batchId);
      assert(createdDataSample.author == gotDataSample!.author);
    });

    test('test deleteDataSample', () async {
      // Init
      final MedTechApi api = await medtechApi();
      final DataSampleApi dataSampleApi = DataSampleApiImpl(api);
      final PatientApi patientApi = PatientApiImpl(api);
      final DataSample weight = getWeightDataSample();
      final Patient patient = getEmptyPatient();

      // When
      final createdPatient = await patientApi.createOrModifyPatient(patient);
      final createdDataSample = await dataSampleApi.createOrModifyDataSampleFor(createdPatient!.id!, weight);
      final deletedDataSampleId = await dataSampleApi.deleteDataSample(createdDataSample!.id!);

      // Then
      assert(deletedDataSampleId != null && deletedDataSampleId == createdDataSample.id);
    });
  });
}
