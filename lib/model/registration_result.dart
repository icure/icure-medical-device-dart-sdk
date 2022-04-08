//
// @dart=2.12

part of icure_medical_device_dart_sdk.api;

class AuthenticationResult {
  AuthenticationResult(this.medTechApi, this.keyPair, this.token, this.groupId, this.userId);

  MedTechApi medTechApi;
  Tuple2<String, String> keyPair;
  String token;
  String groupId;
  String userId;
}
