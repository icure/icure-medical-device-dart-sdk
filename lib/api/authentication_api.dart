//
// @dart=2.12

part of icure_medical_device_dart_sdk.api;

class ApiInitialisationResult {
  final UserDto user;
  final String token;
  final Tuple2<String, String>? keyPair;

  ApiInitialisationResult(this.user, this.token, this.keyPair);
}

class AuthenticationApi {
  AuthenticationApi(
      this.iCureBasePath,
      this.authServerUrl,
      this.authProcessId,
      this.dataOwnerApiFactory);

  final String iCureBasePath;
  final String authServerUrl;
  final String authProcessId;
  final DataOwnerApiFactory? dataOwnerApiFactory;

  Future<AuthenticationProcess?> startAuthentication(
      String healthcareProfessionalId, String firstName, String lastName, String email, String recaptcha, {String? mobilePhone}) async {
    final requestId = Uuid().v4(options: {'rng': UuidUtil.cryptoRNG});
    var client = Client();
    final Response res = await client.post(Uri.parse('${authServerUrl}/process/${authProcessId}/${requestId}'),
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
      return AuthenticationProcess(requestId, email);
    }

    return null;
  }

  Future<AuthenticationResult> completeAuthentication(AuthenticationProcess process, String validationCode, Tuple2<String, String> userKeyPair,
      Future<Tuple3<String, String, String>?> Function(String, String) tokenAndKeyPairProvider) async {
    var client = Client();
    final Response res = await client
        .get(Uri.parse('${authServerUrl}/process/validate/${process.requestId}-${validationCode}'), headers: {'Content-Type': 'application/json'});

    if (res.statusCode < 400) {
      final Tuple2<MedTechApi, ApiInitialisationResult> initInfo =
          await retry(() async => await initApiAndUserAuthenticationToken(process, validationCode, tokenAndKeyPairProvider), trials: 5, delay: 1000);

      MedTechApi authenticatedApi =
          await initUserCrypto(initInfo.item1, initInfo.item2.token, initInfo.item2.user, initInfo.item2.keyPair ?? userKeyPair);

      return AuthenticationResult(
          authenticatedApi, initInfo.item2.keyPair ?? userKeyPair, initInfo.item2.token, initInfo.item2.user.groupId!, initInfo.item2.user.id);
    }

    throw FormatException("Invalid validation code");
  }

  Future<Tuple2<MedTechApi, ApiInitialisationResult>> initApiAndUserAuthenticationToken(AuthenticationProcess process, String validationCode, Future<Tuple3<String, String, String>?> Function(String, String) tokenAndKeyPairProvider) async {
    final api = MedTechApiBuilder.newBuilder()
        .withICureBasePath(this.iCureBasePath)
        .withUserName(process.login)
        .withPassword(validationCode)
        .withAuthServerUrl(this.authServerUrl)
        .withAuthProcessId(this.authProcessId)
        .build();
    try {
      final user = await api.baseUserApi.getCurrentUser();
      if (user == null) {
        throw FormatException("Your validation code is expired");
      }

      final Tuple3<String, String, String>? fromProvider = await tokenAndKeyPairProvider(user.groupId!, user.id);

      final token = fromProvider != null ? fromProvider.item1 : await api.userApi.createToken(user.id, validity: Duration(days: 3653));
      if (token == null) {
        throw FormatException("Your validation code is expired");
      }
      print("User Token is : $token");

      return Tuple2(api, ApiInitialisationResult(user, token, fromProvider?.let((it) => Tuple2(it.item2, it.item3))));

    } catch (e) {
      throw FormatException("Your validation code is expired");
    }
  }

  Future<MedTechApi> initUserCrypto(MedTechApi api, String token, UserDto user, Tuple2<String, String> userKeyPair) async {
    final authenticatedApi =
        MedTechApiBuilder.from(api).withPassword(token).addKeyPair(user.dataOwnerId()!, userKeyPair.item1.keyFromHexString()).build();

    final dataOwnerApi = await DataOwnerApiFactory.fromExistingApis(
      authenticatedApi.baseHealthcarePartyApi,
      authenticatedApi.basePatientApi,
      authenticatedApi.baseDeviceApi,
    ).getDataOwnerApiFor(user);

    final dataOwner = await dataOwnerApi.getDataOwner(user.dataOwnerId()!);
    if (dataOwner == null) {
      throw FormatException("Your user is not a patient");
    }

    if (dataOwner.publicKey == null) {
      dataOwner.publicKey = userKeyPair.item2;
      final modDataOwner = await dataOwnerApi.modifyDataOwner(dataOwner);

      if (user.patientId != null) {
        await initPatientDelegationsAndSave(authenticatedApi, modDataOwner as PatientDto, user, dataOwnerApi);
      }
    } else if (dataOwner.publicKey != userKeyPair.item2) {
      //TODO User lost his key
    }

    return authenticatedApi;
  }

  Future<void> initPatientDelegationsAndSave(MedTechApi apiWithNewKeyPair, PatientDto modPat, UserDto user, DataOwnerApi<dynamic> dataOwnerApi) async {
    final ccPatient = patientCryptoConfig(apiWithNewKeyPair.crypto);
    final dataOwnerWithDelegations = await DecryptedPatientDto.fromJson(toJsonDeep(modPat))
        .let((that) => that!.initDelegations(user, ccPatient));

    final initialisedDataOwner = await apiWithNewKeyPair.basePatientApi.modifyPatient(user, dataOwnerWithDelegations, ccPatient);
    if (initialisedDataOwner == null) {
      throw FormatException("An error occurred while initializing your user");
    }
  }
}
