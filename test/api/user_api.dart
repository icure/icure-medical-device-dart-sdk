import 'dart:io';

import 'package:icure_medical_device_dart_sdk/api.dart';
import 'package:icure_medical_device_dart_sdk/mappers/user.dart';
import "package:test/test.dart";
import 'package:uuid/uuid.dart';
import 'package:uuid/uuid_util.dart';

import '../utils/test_utils.dart';

void main() {
  final Uuid uuid = Uuid();

  group('tests for UserApi', () {
    test("Updating user properties", () async {
      final api = await TestUtils.medtechApi(credsFilePath: ".hkCredentials", hcpId: "171f186a-7a2a-40f0-b842-b486428c771b");

      final currentUser = await api.userApi.getLoggedUser();
      currentUser!.properties
          .add(Property(type: PropertyType(type: PropertyTypeTypeEnum.STRING), typedValue: TypedValueObject(stringValue: uuid.v4().toString())));
      final updatedUser = await api.userApi.createOrModifyUser(currentUser);

      // Then
      currentUser.rev = null;
      updatedUser?.rev = null;

      expect(currentUser == updatedUser, isTrue);
    });

    test("Mapping user", () async {
      final api = await TestUtils.medtechApi(credsFilePath: ".hkCredentials", hcpId: "171f186a-7a2a-40f0-b842-b486428c771b");

      final currentUser = await api.userApi.getLoggedUser();
      final iCureUser = UserMapper(currentUser!).toUserDto();
      final mappedUser = iCureUser.toUser();

      // Then
      expect(currentUser == mappedUser, isTrue);
    });

    test("Creating account for HK", () async {
      final email = "XXX";
      final username = Uuid(options: {'rng': UuidUtil.cryptoRNG}).v4().toString().substring(0, 6);

      // final AnonymousMedTechApi api = TestUtils.getAnonymousApi(authProcessId: "6a355458dbfa392cb56244031907f47a");
      final AnonymousMedTechApi api = TestUtils.getAnonymousApi(host: Platform.environment["ICURE_DART_TEST_URL"]!, authServer: Platform.environment["AUTH_SERVER_URL"], authProcessId: Platform.environment["ICURE_PAT_AUTH_PROCESS_ID"]);

      print("Username: ${username}");
      print("email: ${email}");

      final proc = await api.authenticationApi.startAuthentication("XXX", username, '', "XXX", false, email: email);
      print("processId id: ${proc?.requestId}");

      assert(proc != null);
    });

    test("Completing account", () async {
      final email = "XXX";
      final validationCode = "XXX";
      final processId = "XXX";

      final AnonymousMedTechApi api = TestUtils.getAnonymousApi(host: Platform.environment["ICURE_DART_TEST_URL"]!, authServer: Platform.environment["AUTH_SERVER_URL"], authProcessId: Platform.environment["ICURE_PAT_AUTH_PROCESS_ID"]);
      final keyPair = generateRandomPrivateAndPublicKeyPair();

      final tokenAndKeyProvider = (String userId, String groupId) async {
        return null;
      };
      print("Private Key : ${keyPair.item1}");
      print("Public  Key : ${keyPair.item2}");

      final result =
          await api.authenticationApi.completeAuthentication(AuthenticationProcess(processId, email, false), validationCode, keyPair, tokenAndKeyProvider);

      var patMedtechApi = result.medTechApi;

      final currentUser = await patMedtechApi.userApi.getLoggedUser();
      final currentPatient = await patMedtechApi.patientApi.getPatient(currentUser!.patientId!);

      print("User ID: ${currentUser.id}");
      print("DataOwner ID: ${currentUser.dataOwnerId()}");

      // Then
      assert(currentUser != null);
      assert(currentPatient != null);
    }, timeout: Timeout(Duration(minutes: 10)));

    test("Connecting patient account", () async {
      final patApi = await TestUtils.medtechApi(credsFilePath: ".hkPatientCredentials", hcpId: "a37e0a71-07d2-4414-9b2b-2120ae9a16fc");

      final currentUser = await patApi.userApi.getLoggedUser();
      final currentPatient = await patApi.patientApi.getPatient(currentUser!.patientId!);

      // Then
      assert(currentUser != null);
      assert(currentPatient != null);
    });

    test("Connecting HCP account", () async {
      final api = await TestUtils.medtechApi(credsFilePath: ".hkCredentials", hcpId: "171f186a-7a2a-40f0-b842-b486428c771b");

      final currentUser = await api.userApi.getLoggedUser();

      // Then
      assert(currentUser != null);
      assert(currentUser?.healthcarePartyId != null);
    });
  });
}
