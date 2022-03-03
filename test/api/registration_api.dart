@Timeout(Duration(hours: 1))
import 'dart:math';

import 'package:icure_medical_device_dart_sdk/api.dart';
import "package:test/test.dart";

import '../utils/test_utils.dart';

void main() {
  Future<MedTechApi> medtechApi() async {
    return await TestUtils.medtechApi();
  }

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
