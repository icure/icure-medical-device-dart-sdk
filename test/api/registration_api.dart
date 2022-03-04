@Timeout(Duration(hours: 1))
import 'package:icure_medical_device_dart_sdk/api.dart';
import 'package:icure_medical_device_dart_sdk/utils/net_utils.dart';
import "package:test/test.dart";

import '../utils/test_utils.dart';

void main() {
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

  group('tests for RegistrationApi', () {
    test('test signup', () async {
      // Init
      final MedTechApi api = await medtechApi();
      final RegistrationApi registrationApi = api.registrationApi;

      // When
      final registrationProcess = await registrationApi.registerUserForPatient(
          "171f186a-7a2a-40f0-b842-b486428c771b", "justin_th", "", "test-5e21qtxby@srv1.mail-tester.com", "a58afe0e-02dc-431b-8155-0351140099e4");

      // Then
      print("Login : ${registrationProcess!.login}");
      print("Process ID : ${registrationProcess.processId}");
    });
  });

  test('test complete signUp', () async {
    final MedTechApi api = await medtechApi();
    final RegistrationApi registrationApi = api.registrationApi;
    final registrationProcess = RegistrationProcess("9551d789-a581-4161-a6f2-2d49c0d664b7", "test-5e21qtxby@srv1.mail-tester.com");
    final validationCode = "397413";

    // When
    final registrationResult = await registrationApi.completeRegistration("https://kraken.icure.dev", registrationProcess, validationCode);

    // Init
    var patMedtechApi = registrationResult.medTechApi;
    final patUser = await retry(() => patMedtechApi.userApi.getLoggedUser());
    final keyPair = generateRandomPrivateAndPublicKeyPair();

    // When
    final pat = await patMedtechApi.patientApi.getPatient(patUser!.patientId!);
    pat!.publicKey = keyPair.item2;
    pat.firstName = "John";
    pat.lastName = "Smith";
    pat.gender = PatientGenderEnum.male;
    pat.dateOfBirth = 19921028;

    final modPat = await patMedtechApi.patientApi.createOrModifyPatient(pat);
    patMedtechApi = patMedtechApi.addNewKeyPair(patUser.patientId!, keyPair.item1.keyFromHexString());

    final pat2 = await patMedtechApi.patientApi.getPatient(pat.id!);

    pat2!.note = "Secret";
    pat2.systemMetaData!.encryptionKeys = {};
    pat2.systemMetaData!.delegations = {};

    final modPat2 = (await patMedtechApi.patientApi.createOrModifyPatient(pat2))!;

    // Then
    expect(modPat2.id, pat2.id);
    expect(modPat2.firstName, pat2.firstName);
    expect(modPat2.lastName, pat2.lastName);
    expect(modPat2.note, pat2.note);
  });
}
