@Timeout(Duration(hours: 1))
import 'package:icure_medical_device_dart_sdk/api.dart';
import 'package:icure_medical_device_dart_sdk/utils/net_utils.dart';
import "package:test/test.dart";
import 'package:uuid/uuid.dart';
import 'package:uuid/uuid_util.dart';

import '../utils/test_utils.dart';

void main() {
  final Uuid uuid = Uuid();

  final String userEmail = "large-practice@bxzzdcq0.mailosaur.net";
  final String processId = "320ac00b-8820-4432-ac66-e30ca5c0baea";
  final String userValidationCode = "790517";

  Future<MedTechApi> medtechApi() async {
    final creds = await TestUtils.credentials(credentialsFilePath: ".hkcredentials");

    return MedTechApiBuilder()
        .withICureBasePath("https://kraken.icure.dev")
        .withUserName(creds.username)
        .withPassword(creds.password)
        .withMsgGtwUrl("https://msg-gw.icure.cloud/km")
        .withSignUpProcessId("f0ced6c6-d7cb-4f78-841e-2674ad09621e")
        .addKeyPair("171f186a-7a2a-40f0-b842-b486428c771b", await TestUtils.keyFromFile(keyFileName: "171f186a-7a2a-40f0-b842-b486428c771b.2048.key"))
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


  group('tests for RegistrationApi', () {
    test('test signup', () async {
      // Init
      final MedTechApi api = await medtechApi();
      final RegistrationApi registrationApi = api.registrationApi;

      // When
      final registrationProcess = await registrationApi.registerUserForPatient(
          "171f186a-7a2a-40f0-b842-b486428c771b", "justin_th", "", userEmail, "a58afe0e-02dc-431b-8155-0351140099e4");

      // Then
      print("Login : ${registrationProcess!.login}");
      print("Process ID : ${registrationProcess.processId}");
    });
  });

  test('test complete signUp', () async {
    final MedTechApi api = await medtechApi();
    final RegistrationApi registrationApi = api.registrationApi;
    final registrationProcess = RegistrationProcess(processId, userEmail);
    final validationCode = userValidationCode;

    // When
    final registrationResult = await registrationApi.completeRegistration("https://kraken.icure.dev", registrationProcess, validationCode);

    // Init
    var patMedtechApi = registrationResult.medTechApi;
    final patUser = await retry(() => patMedtechApi.userApi.getLoggedUser());
    final keyPair = generateRandomPrivateAndPublicKeyPair();
    print("User Private Key is : ${keyPair.item1}");
    print("User Public Key is : ${keyPair.item2}");

    // When
    final pat = await patMedtechApi.patientApi.getPatient(patUser!.patientId!);
    pat!.publicKey = keyPair.item2;
    pat.firstName = "John";
    pat.lastName = "Smith";
    pat.gender = PatientGenderEnum.male;
    pat.dateOfBirth = 19921028;

    final modPat = await patMedtechApi.patientApi.createOrModifyPatient(pat);
    patMedtechApi = patMedtechApi.addNewKeyPair(patUser.patientId!, keyPair.item1.keyFromHexString());

    final pat2 = await modPat!.initDelegations(patUser, patMedtechApi.localCrypto);
    pat2.note = "Secret";

    final modPat3 = (await patMedtechApi.patientApi.createOrModifyPatient(pat2))!;

    // Then
    expect(modPat3.id, pat2.id);
    expect(modPat3.firstName, pat2.firstName);
    expect(modPat3.lastName, pat2.lastName);
    expect(modPat3.note, pat2.note);

    // Init
    final DataSample weight = getWeightDataSample();
    final DataSample height = getHeightDataSample();
    final dataSamples = [weight, height];

    final patDataSamples = await patMedtechApi.dataSampleApi.createOrModifyDataSamplesFor(modPat3.id!, dataSamples);

    assert(patDataSamples != null);
  });
}
