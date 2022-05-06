@Timeout(Duration(hours: 1))
import 'package:icure_medical_device_dart_sdk/api.dart';
import 'package:icure_medical_device_dart_sdk/utils/net_utils.dart';
import "package:test/test.dart";
import 'package:tuple/tuple.dart';
import 'package:uuid/uuid.dart';
import 'package:uuid/uuid_util.dart';

import '../utils/test_utils.dart';

void main() {
  final Uuid uuid = Uuid();

  final String userEmail = "original-so@bxzzdcq0.mailosaur.net";
  final String processId = "bdc0a635-8d72-4343-bead-1f771072f00c";
  final String userValidationCode = "377443";

  Future<MedTechApi> medtechApi() async {
    final creds = await TestUtils.credentials(credentialsFilePath: ".hkcredentials");

    return MedTechApiBuilder()
        .withICureBasePath("https://kraken.icure.dev")
        .withUserName(creds.username)
        .withPassword(creds.password)
        .withAuthServerUrl("https://msg-gw.icure.cloud/km")
        .withAuthProcessId("f0ced6c6-d7cb-4f78-841e-2674ad09621e")
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
      final AuthenticationApi registrationApi = api.authenticationApi;

      // When
      final registrationProcess = await registrationApi.startAuthentication(
          "171f186a-7a2a-40f0-b842-b486428c771b", "justin_th", "", userEmail, "a58afe0e-02dc-431b-8155-0351140099e4");

      // Then
      print("Login : ${registrationProcess!.login}");
      print("Process ID : ${registrationProcess.requestId}");
    });
  });

  test('test complete signUp', () async {
    final MedTechApi api = await medtechApi();
    final AuthenticationApi registrationApi = api.authenticationApi;
    final registrationProcess = AuthenticationProcess(processId, userEmail);
    final validationCode = userValidationCode;

    final keyPair = generateRandomPrivateAndPublicKeyPair();
    print("User Private Key is : ${keyPair.item1}");
    print("User Public Key is : ${keyPair.item2}");

    Future<Tuple3<String, String, String>?> Function(String, String) tokenAndKeyPairProvider = (String groupId, String userId) async => null;

    // When
    final registrationResult = await registrationApi.completeAuthentication(registrationProcess, validationCode, keyPair, tokenAndKeyPairProvider);

    // Init
    var patMedtechApi = registrationResult.medTechApi;
    final patUser = await retry(() => patMedtechApi.userApi.getLoggedUser());
    final pat = await patMedtechApi.patientApi.getPatient(patUser!.patientId!);

    // When
    pat!.firstName = "John";
    pat.lastName = "Smith";
    pat.gender = PatientGenderEnum.male;
    pat.dateOfBirth = 19921028;
    pat.note = "Secret";

    final modPat = await patMedtechApi.patientApi.createOrModifyPatient(pat);

    // Then
    expect(modPat!.id, pat.id);
    expect(modPat.firstName, pat.firstName);
    expect(modPat.lastName, pat.lastName);
    expect(modPat.note, pat.note);

    // Init
    final DataSample weight = getWeightDataSample();
    final DataSample height = getHeightDataSample();
    final dataSamples = [weight, height];

    final patDataSamples = await patMedtechApi.dataSampleApi.createOrModifyDataSamplesFor(modPat.id!, dataSamples);

    assert(patDataSamples != null);
  });

  test('test start login without password', () async {
    final MedTechApi api = await medtechApi();
    final AuthenticationApi registrationApi = api.authenticationApi;

    // When
    final loginProcess = await registrationApi.startAuthentication(
        "171f186a-7a2a-40f0-b842-b486428c771b", "justin_th", "", userEmail, "a58afe0e-02dc-431b-8155-0351140099e4");

    // Then
    print("Login : ${loginProcess!.login}");
    print("Process ID : ${loginProcess.requestId}");
  });

  test('test complete login on new device', () async {
    final MedTechApi api = await medtechApi();
    final AuthenticationApi registrationApi = api.authenticationApi;
    final registrationProcess = AuthenticationProcess(processId, userEmail);
    final validationCode = userValidationCode;

    final keyPair = generateRandomPrivateAndPublicKeyPair();
    print("User New Private Key is : ${keyPair.item1}");
    print("User New Public Key is : ${keyPair.item2}");

    Future<Tuple3<String, String, String>?> Function(String, String) tokenAndKeyPairProvider = (String groupId, String userId) async => null;

    // When
    final registrationResult = await registrationApi.completeAuthentication(registrationProcess, validationCode, keyPair, tokenAndKeyPairProvider);

    // Init
    var patMedtechApi = registrationResult.medTechApi;
    final patUser = await retry(() => patMedtechApi.userApi.getLoggedUser());

    // Can not decrypt protected data, as key has been lost
    final pat = await patMedtechApi.patientApi.getPatient(patUser!.patientId!);

    // When
    pat!.note = "Other";

    // Then
    // If we do this, we loose previous data
    final modPat = await patMedtechApi.patientApi.createOrModifyPatient(pat);

    // Then
    expect(modPat!.id, pat.id);
    expect(modPat.firstName, pat.firstName);
    expect(modPat.lastName, pat.lastName);
    expect(modPat.note, pat.note);

    // Init
    final DataSample weight = getWeightDataSample();
    final DataSample height = getHeightDataSample();
    final dataSamples = [weight, height];

    // As new delegation has been created for Patient, should be able to create new data
    final patDataSamples = await patMedtechApi.dataSampleApi.createOrModifyDataSamplesFor(modPat.id!, dataSamples);

    assert(patDataSamples != null);
  });
}
