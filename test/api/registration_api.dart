@Timeout(Duration(hours: 1))
import 'dart:io';
import 'dart:math';

import 'package:icure_medical_device_dart_sdk/api.dart';
import 'package:icure_medical_device_dart_sdk/utils/net_utils.dart';
import "package:test/test.dart";
import 'package:tuple/tuple.dart';
import 'package:uuid/uuid.dart';
import 'package:uuid/uuid_util.dart';

import '../utils/test_utils.dart';

void main() {
  final Uuid uuid = Uuid();
  final authProcessHcpId = Platform.environment["ICURE_AUTH_PROCESS_HCP_ID"]!;
  final authRecaptcha = Platform.environment["ICURE_AUTH_RECAPTCHA"]!;

  Future<AnonymousMedTechApi> anonymousMedtechApi() async {
    return AnonymousMedTechApi(Platform.environment["ICURE_DART_TEST_URL"]!, Platform.environment["AUTH_SERVER_URL"]!, Platform.environment["ICURE_PAT_AUTH_PROCESS_ID"]!);
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
      final String userEmail = "${uuid.v4()}@icure.test";

      final AnonymousMedTechApi api = await anonymousMedtechApi();
      final AuthenticationApi authenticationApi = api.authenticationApi;

      // When
      final registrationProcess = await authenticationApi.startAuthentication(
          authProcessHcpId, "justin_th", "", authRecaptcha, false, email: userEmail);

      // Then
      final validationCode = (await TestUtils.getEmailFromMsgGtw(api.authServerUrl!, userEmail)).subject;
      final keyPair = generateRandomPrivateAndPublicKeyPair();

      Future<Tuple3<String, String, String>?> Function(String, String) tokenAndKeyPairProvider = (String groupId, String userId) async => null;

      // When
      final registrationResult = await authenticationApi.completeAuthentication(registrationProcess, validationCode, keyPair, tokenAndKeyPairProvider);

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

    test('Can authenticate when bypassing token check', () async {
      // Init
      final String userEmail = "${uuid.v4()}@icure.test";

      final AnonymousMedTechApi api = await anonymousMedtechApi();
      final AuthenticationApi authenticationApi = api.authenticationApi;

      // When
      final registrationProcess = await authenticationApi.startAuthentication(
          authProcessHcpId, "justin_th", "", authRecaptcha, false, email: userEmail);

      // Then
      final validationCode = (await TestUtils.getEmailFromMsgGtw(api.authServerUrl!, userEmail)).subject;
      final keyPair = generateRandomPrivateAndPublicKeyPair();
      Future<Tuple3<String, String, String>?> Function(String, String) tokenAndKeyPairProvider = (String groupId, String userId) async => null;

      // When
      final registrationResult = await authenticationApi.completeAuthentication(registrationProcess, validationCode, keyPair, tokenAndKeyPairProvider);

      // Then
      final patUser = await retry(() => registrationResult.medTechApi.userApi.getLoggedUser());
      assert(patUser != null);

      // Init second authentication
      final secondAuthenticationProcess = await authenticationApi.startAuthentication(
          authProcessHcpId, "justin_th", "", authRecaptcha, true, email: userEmail);

      // When
      final secondAuthenticationResult = await authenticationApi.completeAuthentication(secondAuthenticationProcess, validationCode, keyPair, tokenAndKeyPairProvider);

      // Then
      final secondPatUser = await retry(() => secondAuthenticationResult.medTechApi.userApi.getLoggedUser());
      assert(secondPatUser != null);

      assert(patUser!.id == secondPatUser!.id);
    });

    test('Can not authenticate with an invalid validationCode', () async {
      // Init
      final String userEmail = "${uuid.v4()}@icure.test";
      final AnonymousMedTechApi api = await anonymousMedtechApi();
      final AuthenticationApi authenticationApi = api.authenticationApi;

      // When
      final registrationProcess = await authenticationApi.startAuthentication(
          authProcessHcpId, "justin_th", "", authRecaptcha, false, email: userEmail);

      // Then
      final keyPair = generateRandomPrivateAndPublicKeyPair();

      Future<Tuple3<String, String, String>?> Function(String, String) tokenAndKeyPairProvider = (String groupId, String userId) async => null;

      // When & Then
      expect(() async => await authenticationApi.completeAuthentication(registrationProcess, "bad_code", keyPair, tokenAndKeyPairProvider), throwsA(isA<FormatException>()));
    });
  });
}
