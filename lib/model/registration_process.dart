//
// @dart=2.12

part of icure_medical_device_dart_sdk.api;

class AuthenticationProcess {
  AuthenticationProcess(this.requestId, this.login, this.bypassTokenCheck);

  String requestId;
  String login;
  bool bypassTokenCheck;
}
