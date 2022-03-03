@Timeout(Duration(hours: 1))
import 'package:icure_medical_device_dart_sdk/api.dart';
import 'package:icure_medical_device_dart_sdk/utils/iterable_utils.dart';
import "package:test/test.dart";
import 'package:uuid/uuid.dart';
import 'package:uuid/uuid_util.dart';

import '../utils/test_utils.dart';

void main() {
  final Uuid uuid = Uuid();

  Future<MedTechApi> medtechApi() async {
    final creds = await TestUtils.credentials(credentialsFilePath: ".hkPatientCredentials");

    return MedTechApiBuilder()
        .withICureBasePath("https://kraken.icure.dev")
        .withUserName(creds.username)
        .withPassword(creds.password)
        .withMsgGtwUrl("https://msg-gw.icure.cloud/km")
        .withSignUpProcessId("f0ced6c6-d7cb-4f78-841e-2674ad09621e")
        .addKeyPair("782f1bcd-9f3f-408a-af1b-cd9f3f908a98", await TestUtils.keyFromFile(keyFileName: "a37e0a71-07d2-4414-9b2b-2120ae9a16fc-icc-priv.2048.key"))
        .build();
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
    test('test add data samples to HK patient', () async {
      // Init
      final MedTechApi patApi = await medtechApi();
      final DataSampleApi patDataSampleApi = DataSampleApiImpl(patApi);

      final DataSample weight = getWeightDataSample();
      final DataSample height = getHeightDataSample();
      final dataSamples = [weight, height];

      final patDataSamples = await patDataSampleApi.createOrModifyDataSamplesFor("a37e0a71-07d2-4414-9b2b-2120ae9a16fc", dataSamples);

      assert(patDataSamples != null);
    });

    test('test createOrModifyDataSampleFor CREATE', () async {
      // Init
      final MedTechApi api = await medtechApi();
      final DataSampleApi dataSampleApi = DataSampleApiImpl(api);
      final PatientApi patientApi = PatientApiImpl(api);
      final DataSample weight = getWeightDataSample();
      final DataSample height = getHeightDataSample();
      final dataSamples = [weight, height];

      // When
      final createdPatient = await patientApi.getPatient("a37e0a71-07d2-4414-9b2b-2120ae9a16fc");
      final createdDataSamples = await dataSampleApi.createOrModifyDataSamplesFor(createdPatient!.id!, dataSamples);
      print(createdDataSamples?.map((e) => e.id));

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
              .forDataOwner((await api.userApi.getLoggedUser())!.healthcarePartyId!)
              .forPatients(api.localCrypto, [createdPatient]).build()
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
