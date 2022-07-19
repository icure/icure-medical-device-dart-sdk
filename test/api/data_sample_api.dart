@Timeout(Duration(hours: 1))
import 'dart:math';

import 'package:icure_dart_sdk/api.dart';
import 'package:icure_dart_sdk/util/collection_utils.dart';
import 'package:icure_medical_device_dart_sdk/api.dart';
import 'package:icure_medical_device_dart_sdk/utils/iterable_utils.dart';
import "package:test/test.dart";
import 'package:uuid/uuid.dart';
import 'package:uuid/uuid_util.dart';

import '../utils/test_utils.dart';

void main() {
  final Uuid uuid = Uuid();
  final rnd = Random();

  Future<MedTechApi> medtechApi() async {
    return TestUtils.medtechApi();
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

  DataSample getCompoundedDataSample() => DataSample(
        id: uuid.v4(options: {'rng': UuidUtil.cryptoRNG}),
        content: {
          "en": Content(compoundValue: [
            DataSample(
              id: uuid.v4(options: {'rng': UuidUtil.cryptoRNG}),
              content: {
                "en": Content(compoundValue: [
                  DataSample(content: {
                    "en": Content(
                        timeSeries:
                            TimeSeries(samples: List<List<num>>.generate(1000, (index) => List<num>.generate(6, (index) => rnd.nextDouble()))))
                  }),
                  DataSample(content: {
                    "en": Content(
                        timeSeries:
                            TimeSeries(samples: List<List<num>>.generate(1000, (index) => List<num>.generate(6, (index) => rnd.nextDouble()))))
                  }),
                  DataSample(content: {
                    "en": Content(
                        timeSeries: TimeSeries(samples: List<List<num>>.generate(1000, (index) => List<num>.generate(6, (index) => rnd.nextInt(9)))))
                  }),
                  DataSample(content: {
                    "en": Content(
                        timeSeries:
                            TimeSeries(samples: List<List<num>>.generate(1000, (index) => List<num>.generate(6, (index) => rnd.nextDouble()))))
                  }),
                ])
              },
            )
          ])
        },
        valueDate: 20220203111034,
        labels: [CodingReference(id: "LOINC|29463-7|2", code: "29463-7", type: "LOINC", version: "2")].toSet(),
      );

  Patient getPatient() => Patient(id: uuid.v4(options: {'rng': UuidUtil.cryptoRNG}), firstName: "Raymond", lastName: "Jamonserano");
  Patient getEmptyPatient() => Patient(id: uuid.v4(options: {'rng': UuidUtil.cryptoRNG}), firstName: "Raymond", lastName: "Jambomaigre");

  group('tests for DataSampleApi', () {
    test('test createOrModifyDataSampleFor CREATE', () async {
      // Init
      final api = await TestUtils.medtechApi(
          iCureBackendUrl: "http://localhost:16043", credsFilePath: ".hkCredentials", hcpId: "171f186a-7a2a-40f0-b842-b486428c771b");
      final DataSample weight = getWeightDataSample();
      final DataSample height = getHeightDataSample();
      final dataSamples = [weight, height];

      final currentPatient = await api.patientApi.createOrModifyPatient(getPatient());

      // When
      final createdDataSamples = await api.dataSampleApi.createOrModifyDataSamplesFor(currentPatient!.id!, dataSamples);
      print(createdDataSamples?.map((e) => e.id));

      // Then
      expect(dataSamples.length, createdDataSamples!.length);
      assert(createdDataSamples.findFirst((it) => it.id == weight.id) != null);
      assert(createdDataSamples.findFirst((it) => it.id == height.id) != null);
    });

    test('test createOrModifyDataSampleFor compounded CREATE', () async {
      // Init
      final api = await TestUtils.getApiFromCredentialsToken(credentialsFilePath: "pat_test-6ounpaaem.json");
      final dataSamples = [getCompoundedDataSample()];

      final currentUser = await api.userApi.getLoggedUser();
      final currentPatient = await api.patientApi.getPatient(currentUser!.patientId!);

      // When
      final createdDataSamples = await api.dataSampleApi.createOrModifyDataSamplesFor(currentPatient!.id!, dataSamples);
      print(createdDataSamples?.map((e) => e.id));

      // Then
      expect(dataSamples.length, createdDataSamples!.length);
    });

    test('test createOrModifyDataSampleFor UPDATE', () async {
      // Init
      final MedTechApi api = await medtechApi();
      final DataSample weight = getWeightDataSample();
      final Patient patient = getPatient();
      final updateContent = {"en": Content(numberValue: 60.0)};

      // When
      final createdPatient = await api.patientApi.createOrModifyPatient(patient);
      final createdDataSample = await api.dataSampleApi.createOrModifyDataSampleFor(createdPatient!.id!, weight);
      createdDataSample!.content = updateContent;
      final updatedDataSample = await api.dataSampleApi.createOrModifyDataSampleFor(createdPatient.id!, createdDataSample);

      // Then
      expect(createdDataSample.id, updatedDataSample!.id);
      assert(createdDataSample.id == updatedDataSample.id);
      assert(weight.content != updatedDataSample.content);
      expect(updatedDataSample.content["en"]!.numberValue!, updateContent["en"]!.numberValue!);
    });

    test('test getDataSample', () async {
      // Init
      final MedTechApi api = await medtechApi();
      final DataSample weight = getWeightDataSample();
      final Patient patient = getPatient();

      // When
      final createdPatient = await api.patientApi.createOrModifyPatient(patient);
      final createdDataSample = await api.dataSampleApi.createOrModifyDataSampleFor(createdPatient!.id!, weight);
      final gotDataSample = await api.dataSampleApi.getDataSample(createdDataSample!.id!);

      // Then
      assert(gotDataSample!.id != null && gotDataSample.id == createdDataSample.id);
      assert(createdDataSample.batchId == gotDataSample!.batchId);
      assert(createdDataSample.author == gotDataSample!.author);
    });

    test('test filterDataSample', () async {
      // Init
      final MedTechApi api = await medtechApi();
      final DataSample weight = getWeightDataSample();
      final Patient patient = getPatient();

      // When
      final createdPatient = await api.patientApi.createOrModifyPatient(patient);
      final createdDataSample = (await api.dataSampleApi.createOrModifyDataSampleFor(createdPatient!.id!, weight))!;
      var paginatedListDataSample = await api.dataSampleApi.filterDataSample(
          await DataSampleFilter()
              .forDataOwner((await api.userApi.getLoggedUser())!.healthcarePartyId!)
              .forPatients(api.crypto, [createdPatient]).build()
      );
      final gotDataSample = (paginatedListDataSample)!.rows[0];

      // Then
      assert(gotDataSample.id != null && gotDataSample.id == createdDataSample.id);
      assert(createdDataSample.batchId == gotDataSample.batchId);
      assert(createdDataSample.author == gotDataSample.author);
    });

    test('test deleteDataSample', () async {
      // Init
      final MedTechApi api = await medtechApi();
      final DataSample weight = getWeightDataSample();
      final Patient patient = getEmptyPatient();

      // When
      final createdPatient = await api.patientApi.createOrModifyPatient(patient);
      final createdDataSample = await api.dataSampleApi.createOrModifyDataSampleFor(createdPatient!.id!, weight);
      final deletedDataSampleId = await api.dataSampleApi.deleteDataSample(createdDataSample!.id!);

      // Then
      assert(deletedDataSampleId != null && deletedDataSampleId == createdDataSample.id);
    });
  });

  test("Sharing delegation of DataSample patient to HCP", () async {
    final patApi = await TestUtils.getApiFromCredentialsToken(credentialsFilePath: "pat_rikah54178_kino.json");
    final hcpApi = await TestUtils.getApiFromCredentialsToken(credentialsFilePath: "hcp_sobehex999_kino.json");

    final currentUser = await patApi.userApi.getLoggedUser();
    final currentHcp = await hcpApi.userApi.getLoggedUser();

    final currentPatient = await patApi.patientApi.getPatient(currentUser!.patientId!);

    final ds = getHeightDataSample();

    final createdDs = await patApi.dataSampleApi.createOrModifyDataSampleFor(currentPatient!.id!, ds);
    final sharedDs = await patApi.dataSampleApi.giveAccessTo(createdDs!, currentHcp!.healthcarePartyId!);

    final hcpDs = await hcpApi.dataSampleApi.getDataSample(sharedDs.id!);
    assert(hcpDs != null);
  });

  test("Sharing delegation of DataSample HCP to Patient", () async {
    final hcpApi = await TestUtils.medtechApi(credsFilePath: ".hkCredentials", hcpId: "171f186a-7a2a-40f0-b842-b486428c771b");
    final patApi = await TestUtils.medtechApi(credsFilePath: ".hkPatientCredentials", hcpId: "a37e0a71-07d2-4414-9b2b-2120ae9a16fc");

    final currentUser = await patApi.userApi.getLoggedUser();

    final currentPatient = await patApi.patientApi.getPatient(currentUser!.patientId!);

    final ds = getHeightDataSample();

    final createdDs = await hcpApi.dataSampleApi.createOrModifyDataSampleFor(currentPatient!.id!, ds);
    final sharedDs = await hcpApi.dataSampleApi.giveAccessTo(createdDs!, currentPatient.id!);

    final patDs = await patApi.dataSampleApi.getDataSample(sharedDs.id!);
    assert(patDs != null);
  });

  test("Creating a datasample as HCP for a patient", () async {
    final hcpApi = await TestUtils.medtechApi(credsFilePath: ".hkCredentials", hcpId: "171f186a-7a2a-40f0-b842-b486428c771b");
    final patApi = await TestUtils.medtechApi(credsFilePath: ".hkPatientCredentials", hcpId: "a37e0a71-07d2-4414-9b2b-2120ae9a16fc");

    final currentPatUser = await patApi.userApi.getLoggedUser();
    final hcpPatient = await hcpApi.patientApi.getPatient(currentPatUser!.dataOwnerId()!);

    // When
    final dataSample = await hcpApi.dataSampleApi.createOrModifyDataSampleFor(hcpPatient!.id!, getWeightDataSample());

    // Then
    assert(dataSample != null);
    assert(dataSample!.id != null);

    // When
    final sharedDS = await hcpApi.dataSampleApi.giveAccessTo(dataSample!, currentPatUser.dataOwnerId()!);

    assert(sharedDS != null);

    // Then
    final patDataSample = await patApi.dataSampleApi.getDataSample(dataSample.id!);
    assert(patDataSample != null);
    assert(patDataSample!.id! == dataSample.id);
  });
}
