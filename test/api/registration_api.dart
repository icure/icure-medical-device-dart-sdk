@Timeout(Duration(hours: 1))
import 'dart:convert';
import 'dart:io';
import 'dart:math';

import 'package:icure_dart_sdk/api.dart' as rapi;
import 'package:icure_dart_sdk/util/binary_utils.dart';
import 'package:icure_medical_device_dart_sdk/api.dart';
import "package:test/test.dart";
import 'package:uuid/uuid.dart';
import 'package:uuid/uuid_util.dart';

void main() {
  final Uuid uuid = Uuid();

  Future<MedTechApi> medtechApi() async {
    var fileUri = Uri.file("test/resources/keys/782f1bcd-9f3f-408a-af1b-cd9f3f908a98-icc-priv.2048.key", windows: false);
    var hcpKeyFile = File.fromUri(fileUri);

    return MedTechApiBuilder()
        .withICureBasePath("https://kraken.icure.dev")
        .withUserName("abdemotst2")
        .withPassword("27b90f6e-6847-44bf-b90f-6e6847b4bf1c")
        .withMsgGtwUrl("https://msg-gw.icure.cloud/km")
        .withSignUpProcessId("f0ced6c6-d7cb-4f78-841e-2674ad09621e")
        .addKeyPair("782f1bcd-9f3f-408a-af1b-cd9f3f908a98", (await hcpKeyFile.readAsString(encoding: utf8)).keyFromHexString())
        .build();
  }

  rapi.DecryptedPatientDto getPatient() => rapi.DecryptedPatientDto(
      id: uuid.v4(options: {'rng': UuidUtil.cryptoRNG}), firstName: 'John', lastName: 'Doe', note: 'Premature optimization is the root of all evil');

  group('tests for RegistrationApi', () {
    test('test signup', () async {
      // Init
      final MedTechApi api = await medtechApi();

      final RegistrationApi registrationApi = api.registrationApi;

      final test = await registrationApi.registerUserForPatient(
          "782f1bcd-9f3f-408a-af1b-cd9f3f908a98", "Justin", "Thyme", "EMAIL", "RECAPTCHA", Random().nextInt(999999).toString().padLeft(6, '0'));
      expect(test != null, true);
    });
  });
}
