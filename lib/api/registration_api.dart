//
// @dart=2.12

part of icure_medical_device_dart_sdk.api;

class RegistrationApi {
  RegistrationApi(this.iCureBasePath, this.registrationServer, this.signUpProcessId, this.loginProcessId);

  final String iCureBasePath;
  final String registrationServer;
  final String signUpProcessId;
  final String loginProcessId;

  Future<RegistrationProcess?> startUserRegistrationProcess(
      String healthcareProfessionalId, String firstName, String lastName, String email, String recaptcha, {String? mobilePhone}) async {
    final requestId = Uuid().v4(options: {'rng': UuidUtil.cryptoRNG});
    var client = Client();
    final Response res = await client.post(Uri.parse('${registrationServer}/process/${signUpProcessId}/${requestId}'),
        headers: {'Content-Type': 'application/json'},
        body: await serializeAsync({
          'g-recaptcha-response': recaptcha,
          'firstName': firstName,
          'lastName': lastName,
          'from': email,
          'mobilePhone': mobilePhone,
          'hcpId': healthcareProfessionalId
        }));

    if (res.statusCode < 400) {
      return RegistrationProcess(requestId, email);
    }

    return null;
  }

  Future<RegistrationResult> completeProcess(RegistrationProcess process, String validationCode) async {
    var client = Client();
    final Response res = await client.get(Uri.parse('${registrationServer}/process/validate/${process.processId}-${validationCode}'), headers: {
      'Content-Type': 'application/json'
    });

    if (res.statusCode < 400) {
      return retry(() async {
        final api = MedTechApiBuilder.newBuilder()
            .withICureBasePath(this.iCureBasePath)
            .withUserName(process.login)
            .withPassword(validationCode)
            .withMsgGtwUrl(this.registrationServer)
            .withSignUpProcessId(this.signUpProcessId)
            .build();
        try {
          final user = await api.userApi.getLoggedUser();
          if (user == null) {
            throw FormatException("Your validation code is expired");
          }

          final token = await api.userApi.createToken(user.id!, validity: Duration(days: 3653));
          if (token == null) {
            throw FormatException("Your validation code is expired");
          }
          print("User Token is : $token");

          return RegistrationResult(MedTechApiBuilder.newBuilder()
              .withICureBasePath(this.iCureBasePath)
              .withUserName(user.id!)
              .withPassword(token)
              .withMsgGtwUrl(this.registrationServer)
              .withSignUpProcessId(this.signUpProcessId)
              .build(), token, user.id!);
        } catch (e) {
          throw FormatException("Your validation code is expired");
        }
      }, trials: 5, delay: 1000);
    }

    throw FormatException("Invalid validation code");
  }

  Future<RegistrationProcess?> startLoginProcess(String email, String recaptcha, {String? mobilePhone}) async {
    final requestId = Uuid().v4(options: {'rng': UuidUtil.cryptoRNG});
    var client = Client();
    final Response res = await client.post(Uri.parse('${registrationServer}/process/${loginProcessId}/${requestId}'),
        headers: {'Content-Type': 'application/json'},
        body: await serializeAsync({
          'g-recaptcha-response': recaptcha,
          'from': email,
          'mobilePhone': mobilePhone
        }));

    if (res.statusCode < 400) {
      return RegistrationProcess(requestId, email);
    }
    return null;
  }
}
