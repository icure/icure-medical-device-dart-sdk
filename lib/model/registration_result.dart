//
// @dart=2.12

part of icure_medical_device_dart_sdk.api;

class RegistrationResult {
  RegistrationResult(this.medTechApi, this.token, this.userId);

  MedTechApi medTechApi;
  String token;
  String userId;
}
