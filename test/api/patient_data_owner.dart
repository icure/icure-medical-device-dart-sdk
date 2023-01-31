@Timeout(Duration(hours: 1))
import 'dart:io';

import 'package:icure_medical_device_dart_sdk/api.dart';
import 'package:icure_medical_device_dart_sdk/utils/net_utils.dart';
import "package:test/test.dart";
import 'package:tuple/tuple.dart';
import 'package:uuid/uuid.dart';
import 'package:uuid/uuid_util.dart';

import '../utils/test_utils.dart';

void main() {
  MedTechApi? hcpApi;
  String? hcpId;

  final uuid = Uuid();

  setUpAll(() async {
    final initialApi = await TestUtils.medtechApi(
        iCureBackendUrl: Platform.environment["ICURE_URL"]!,
        userName: Platform.environment["HCP_1_USERNAME"]!,
        userPassword: Platform.environment["HCP_1_PASSWORD"]!,
        userPrivKey: Platform.environment["HCP_1_PRIV_KEY"]!
    );
    final professionalKeys = generateRandomPrivateAndPublicKeyPair();
    final hcp = await initialApi.healthcareProfessionalApi.createOrModifyHealthcareProfessional(
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
            healthcarePartyId: hcp!.id
        )
    );

    final token = await initialApi.userApi.createToken(hcpUser!.id!);

    hcpApi = await MedTechApiBuilder.newBuilder()
        .withICureBasePath(Platform.environment["ICURE_URL"]!)
        .withUserName(hcpUser.login!)
        .withPassword(token!)
        .addKeyPair(
        hcpUser.healthcarePartyId!,
        professionalKeys.item1.keyFromHexString()
    )
        .build();

    hcpId = hcpUser.healthcarePartyId;

    print("Successfully set up test backend!");
  });

  Future<Tuple4<Patient, DataSample, User, MedTechApi>> createPatientApi() async {
    final patientNote = 'Premature optimization is the root of all evil';
    final email = "${uuid.v4()}@patient-mail.com";
    final patient = await hcpApi!.patientApi.createOrModifyPatient(
        Patient(
          firstName: 'John',
          lastName: 'Doe',
          note: patientNote,
          addresses: [
            Address(
                addressType: AddressAddressTypeEnum.home,
                description: 'London',
                telecoms: [
                  Telecom(
                      telecomType: TelecomTelecomTypeEnum.email,
                      telecomNumber: email
                  )
                ]
            )
          ],
        )
    );
    final dataSample = await hcpApi!.dataSampleApi.createOrModifyDataSampleFor(patient!.id!, DataSample(
      id: uuid.v4(options: {'rng': UuidUtil.cryptoRNG}),
      content: {"en": Content(numberValue: 53.5)},
      valueDate: 20220203111034,
      labels: [CodingReference(id: "LOINC|29463-7|2", code: "29463-7", type: "LOINC", version: "2")].toSet(),
    ));
    final patientUser = await hcpApi!.userApi.createOrModifyUser(
        new User(
            id: uuid.v4(options: {'rng': UuidUtil.cryptoRNG}),
            name: email,
            login: email,
            email: email,
            status: UserStatus.ACTIVE,
            patientId: patient.id
        )
    );
    final anonApi = AnonymousMedTechApi(
        Platform.environment["ICURE_URL"]!,
        Platform.environment["MSG_GTW_URL"]!,
        Platform.environment["PAT_AUTH_PROCESS_ID"]!
    );
    final authApi = anonApi.authenticationApi;
    final registrationProcess = await authApi.startAuthentication(hcpId!, "Giovanni", "Muciaccia", "ArtAttack", false, email: email);
    final validationCode = (await TestUtils.getEmailFromMsgGtw(anonApi.authServerUrl!, email)).subject;
    final keyPair = generateRandomPrivateAndPublicKeyPair();
    Future<Tuple3<String, String, String>?> Function(String, String) tokenAndKeyPairProvider = (String groupId, String userId) async => null;
    final registrationResult = await authApi.completeAuthentication(registrationProcess, validationCode, keyPair, tokenAndKeyPairProvider);
    final patUser = await retry(() => registrationResult.medTechApi.userApi.getLoggedUser());
    assert(patUser != null);
    assert(patUser!.patientId == patient.id!);
    return Tuple4(
        (await hcpApi!.patientApi.getPatient(patient.id!))!,
        dataSample!,
        patientUser!,
        registrationResult.medTechApi
    );
  }

  group('tests for patient data owners api', () {
    test('Patient data should still be accessible to hcp after first login', () async {
      final patientApiDetails = await createPatientApi();
      final patient = patientApiDetails.item1;
      final dataSample = patientApiDetails.item2;
      final patientApi = patientApiDetails.item4;
      expect(patientApi.patientApi.getPatient(patient.id!), throwsException);
      final potentiallyEncryptedPatient = (await patientApi.patientApi.getPatientAndTryDecrypt(patient.id!))!;
      expect(potentiallyEncryptedPatient is EncryptedPatient, true, reason: "Retrieved patient should be encrypted");
      expect(potentiallyEncryptedPatient.note, null);
      expect(potentiallyEncryptedPatient.systemMetaData?.publicKey != null, true, reason: "Patient should have initialised public key");

      print("Hcp should still be able to access patient, existing data samples, and create new data samples.");
      final retrievedPatient = (await hcpApi!.patientApi.getPatient(patient.id!))!;
      expect(retrievedPatient.note!, patient.note);
      expect((await hcpApi!.dataSampleApi.getDataSample(dataSample.id!))!.toJson(), dataSample.toJson());
      final newSample = (await hcpApi!.dataSampleApi.createOrModifyDataSampleFor(patient.id!, DataSample(
        id: uuid.v4(options: {'rng': UuidUtil.cryptoRNG}),
        content: {"en": Content(numberValue: 159.0)},
        valueDate: 20220203111128,
        labels: [CodingReference(id: "LOINC|8302-2|2", code: "8302-2", type: "LOINC", version: "2")].toSet(),
      )))!;
      final updatedPatient = await hcpApi!.patientApi.giveAccessTo(retrievedPatient, patient.id!);
      final updatedDataSample = await hcpApi!.dataSampleApi.giveAccessTo(dataSample, patient.id!);
      final updatedNewSample = await hcpApi!.dataSampleApi.giveAccessTo(newSample, patient.id!);
      expect((await hcpApi!.patientApi.getPatient(patient.id!))!.note!, patient.note);

      print("Patient can now access and find all the data");
      expect((await patientApi.patientApi.getPatient(patient.id!))!.note!, patient.note);
      expect((await patientApi.dataSampleApi.getDataSample(dataSample.id!))!.toJson(), updatedDataSample.toJson());
      expect((await patientApi.dataSampleApi.getDataSample(newSample.id!))!.toJson(), updatedNewSample.toJson());
      final filterForPatient = await new DataSampleFilter()
          .forDataOwner(patient.id!)
          .forPatients(patientApi.crypto, [updatedPatient])
          .build();
      final foundDataSamplesByPatient = (await patientApi.dataSampleApi.filterDataSample(filterForPatient))!.rows;
      expect(foundDataSamplesByPatient.length, 2);
      expect(foundDataSamplesByPatient.map((e) => e.id!), containsAll([dataSample.id, newSample.id]));

      print("And hcps should still have full access to the data");
      expect((await hcpApi!.patientApi.getPatient(patient.id!))!.note!, patient.note);
      expect((await hcpApi!.dataSampleApi.getDataSample(dataSample.id!))!.toJson(), updatedDataSample.toJson());
      expect((await hcpApi!.dataSampleApi.getDataSample(newSample.id!))!.toJson(), updatedNewSample.toJson());
      final filterForHcp = await new DataSampleFilter()
          .forDataOwner(hcpId!)
          .forPatients(hcpApi!.crypto, [updatedPatient])
          .build();
      final foundDataSamplesByHcp = (await hcpApi!.dataSampleApi.filterDataSample(filterForHcp))!.rows;
      expect(foundDataSamplesByHcp.length, 2);
      expect(foundDataSamplesByHcp.map((e) => e.id!), containsAll([dataSample.id, newSample.id]));
    });

    test('Patient should be able to create new data before being given full access to their existing data', () async {
      final patientApiDetails = await createPatientApi();
      final patient = patientApiDetails.item1;
      final dataSample = patientApiDetails.item2;
      final patientApi = patientApiDetails.item4;

      print("Can create new sample");
      final newSample = (await patientApi.dataSampleApi.createOrModifyDataSampleFor(patient.id!, DataSample(
        id: uuid.v4(options: {'rng': UuidUtil.cryptoRNG}),
        content: {"en": Content(numberValue: 159.0)},
        valueDate: 20220203111128,
        labels: [CodingReference(id: "LOINC|8302-2|2", code: "8302-2", type: "LOINC", version: "2")].toSet(),
      )))!;

      print("After sharing the data sample with each other both hcp and patient can directly access the data samples");
      final updatedDataSample = await hcpApi!.dataSampleApi.giveAccessTo(dataSample, patient.id!);
      final updatedNewSample = await patientApi.dataSampleApi.giveAccessTo(newSample, hcpId!);
      expect((await hcpApi!.dataSampleApi.getDataSample(newSample.id!))!.toJson(), updatedNewSample.toJson());
      expect((await patientApi.dataSampleApi.getDataSample(dataSample.id!))!.toJson(), updatedDataSample.toJson());

      print("But they can only find their own data samples");
      final filterForHcp = await new DataSampleFilter()
          .forDataOwner(hcpId!)
          .forPatients(hcpApi!.crypto, [patient])
          .build();
      final foundDataSamplesByHcp = (await hcpApi!.dataSampleApi.filterDataSample(filterForHcp))!.rows;
      expect(foundDataSamplesByHcp.length, 1);
      expect(foundDataSamplesByHcp[0].id, dataSample.id);
      final filterForPatient = await new DataSampleFilter()
          .forDataOwner(patient.id!)
          .forPatients(patientApi.crypto, [patient])
          .build();
      final foundDataSamplesByPatient = (await patientApi.dataSampleApi.filterDataSample(filterForPatient))!.rows;
      expect(foundDataSamplesByPatient.length, 1);
      expect(foundDataSamplesByPatient[0].id, newSample.id);

      print("By giving each other's access to the patient entity both patient and hcp can now find all data samples");
      final pu0 = await hcpApi!.patientApi.getPatient(patient.id!);
      final pu1 = await hcpApi!.patientApi.giveAccessTo(pu0!, patient.id!);
      final updatedPatient = await patientApi.patientApi.giveAccessTo(pu1, hcpId!);
      final filterForPatient2 = await new DataSampleFilter()
          .forDataOwner(patient.id!)
          .forPatients(patientApi.crypto, [updatedPatient])
          .build();
      final foundDataSamplesByPatient2 = (await patientApi.dataSampleApi.filterDataSample(filterForPatient2))!.rows;
      expect(foundDataSamplesByPatient2.length, 2);
      expect(foundDataSamplesByPatient2.map((e) => e.id), containsAll([dataSample.id, newSample.id]));
      hcpApi!.crypto.clearCachesFor(patient.id!);
      final filterForHcp2 = await new DataSampleFilter()
          .forDataOwner(hcpId!)
          .forPatients(hcpApi!.crypto, [updatedPatient])
          .build();
      final foundDataSamplesByHcp2 = (await hcpApi!.dataSampleApi.filterDataSample(filterForHcp2))!.rows;
      expect(foundDataSamplesByHcp2.length, 2);
      expect(foundDataSamplesByHcp2.map((e) => e.id), containsAll([dataSample.id, newSample.id]));
    });
  });

  test('Patient should be able to modify his non-encrypted data even if he was not yet given full access to it', () async {
    final patientApiDetails = await createPatientApi();
    final patient = patientApiDetails.item1;
    final patientApi = patientApiDetails.item4;
    final encrypted = (await patientApi.patientApi.getPatientAndTryDecrypt(patient.id!)) as EncryptedPatient;
    encrypted.note = "This is not allowed";
    expect(patientApi.patientApi.modifyEncryptedPatient(encrypted), throwsArgumentError);
    encrypted.note = null;
    encrypted.firstName = "Gianfranco";
    final updated = await patientApi.patientApi.modifyEncryptedPatient(encrypted);
    expect(updated!.note, null);
    expect(updated.firstName, "Gianfranco");
    expect(updated.rev != encrypted.rev, true, reason: "Patient revision should have changed");
    expect((await hcpApi!.patientApi.getPatient(patient.id!))?.note, patient.note!);
  });
}
