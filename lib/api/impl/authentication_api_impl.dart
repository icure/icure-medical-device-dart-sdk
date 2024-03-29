//
// @dart=2.12

part of icure_medical_device_dart_sdk.api;

class ApiInitialisationResult {
  final UserDto user;
  final String token;
  final Tuple2<String, String>? keyPair;

  ApiInitialisationResult(this.user, this.token, this.keyPair);
}

class AuthenticationApiImpl extends AuthenticationApi {
  AuthenticationApiImpl(this.iCureBasePath, this.authServerUrl, this.authProcessId, this.dataOwnerApiFactory);

  final String iCureBasePath;
  final String authServerUrl;
  final String authProcessId;
  final DataOwnerApiFactory? dataOwnerApiFactory;

  @override
  Future<AuthenticationProcess> startAuthentication(
    String healthcareProfessionalId,
    String firstName,
    String lastName,
    String recaptcha,
    bool bypassTokenCheck,
    {String? email, String? mobilePhone}
  ) async {

    if (email == null && mobilePhone == null) {
      throw FormatException("In order to start authentication of a user, you should at least provide its email OR its mobilePhone");
    }

    final requestId = Uuid().v4(options: {'rng': UuidUtil.cryptoRNG});
    final date = DateTime.now().millisecondsSinceEpoch ~/ 60000;
    final String recaptchaHash = sha256.convert((date.toString() + ':' + recaptcha).codeUnits).toString();

    var client = Client();
    final Response res = await client.post(Uri.parse('${authServerUrl}/process/${authProcessId}/${requestId}'),
        headers: {'Content-Type': 'application/json'},
        body: await serializeAsync({
          'g-recaptcha-response': recaptchaHash,
          'firstName': firstName,
          'lastName': lastName,
          'from': email ?? mobilePhone,
          'mobilePhone': mobilePhone,
          'email': email,
          'hcpId': healthcareProfessionalId
        }));

    if (res.statusCode < 400) {
      return AuthenticationProcess(requestId, (email ?? mobilePhone)!, bypassTokenCheck);
    }

    throw Exception("iCure could not start the authentication process $authProcessId for user ${email ?? mobilePhone}. Try again later");
  }

  @override
  Future<AuthenticationResult> completeAuthentication(
    AuthenticationProcess process,
    String validationCode,
    Tuple2<String, String> userKeyPair,
    Future<Tuple3<String, String, String>?> Function(String, String) tokenAndKeyPairProvider
  ) async {
    final Response res = await _validateAuthenticationProcess(process.requestId, validationCode, process.bypassTokenCheck);

    if (res.statusCode < 400) {
      final Tuple2<MedTechApi, ApiInitialisationResult> initInfo =
          await retry(() async => await _initApiAndUserAuthenticationToken(process, validationCode, tokenAndKeyPairProvider), trials: 5, delay: 1000);

      MedTechApi authenticatedApi =
          await _initUserCrypto(initInfo.item1, initInfo.item2.token, initInfo.item2.user, initInfo.item2.keyPair ?? userKeyPair);

      return AuthenticationResult(
          authenticatedApi, initInfo.item2.keyPair ?? userKeyPair, initInfo.item2.token, initInfo.item2.user.groupId!, initInfo.item2.user.id);
    }

    throw FormatException("iCure could not complete authentication process with requestId ${process.requestId}. Try again later.");
  }

  Future<Response> _validateAuthenticationProcess(String processRequestId, String validationCode, bool bypassTokenCheck) async {
    var client = Client();
    try {
      final resp = await client
          .get(Uri.parse('${authServerUrl}/process/validate/${processRequestId}-${validationCode}'), headers: {'Content-Type': 'application/json'});
      return (resp.statusCode >= 400 && bypassTokenCheck) ? Response("", 200) : resp;
    } catch (e) {
      return (bypassTokenCheck) ? Response("", 200) : throw e;
    }
  }


  Future<Tuple2<MedTechApi, ApiInitialisationResult>> _initApiAndUserAuthenticationToken(
    AuthenticationProcess process,
    String validationCode,
    Future<Tuple3<String, String, String>?> Function(String, String) tokenAndKeyPairProvider
  ) async {
    final api = MedTechApiBuilder.newBuilder()
        .withICureBasePath(this.iCureBasePath)
        .withUserName(process.login)
        .withPassword(validationCode)
        .withAuthServerUrl(this.authServerUrl)
        .withAuthProcessId(this.authProcessId)
        .build();
    final user = await api.baseUserApi.getCurrentUser();

    if (user == null) {
      throw FormatException("There is no user currently logged in. You must call this method from an authenticated MedTechApi");
    }

    final Tuple3<String, String, String>? fromProvider = await tokenAndKeyPairProvider(user.groupId!, user.id);

    final token = fromProvider != null ? fromProvider.item1 : await api.userApi.createToken(user.id, validity: Duration(days: 3653));
    if (token == null) {
      throw FormatException("Your validation code ${validationCode} expired. Start a new authentication process for your user");
    }

    return Tuple2(api, ApiInitialisationResult(user, token, fromProvider?.let((it) => Tuple2(it.item2, it.item3))));
  }

  Future<MedTechApi> _initUserCrypto(MedTechApi api, String token, UserDto user, Tuple2<String, String> userKeyPair) async {
    final authenticatedApi =
        MedTechApiBuilder.from(api).withPassword(token).addKeyPair(user.dataOwnerId()!, userKeyPair.item1.keyFromHexString()).build();

    final dataOwnerApi = await DataOwnerApiFactory.fromExistingApis(
      authenticatedApi.baseHealthcarePartyApi,
      authenticatedApi.basePatientApi,
      authenticatedApi.baseDeviceApi,
    ).getDataOwnerApiFor(user);

    final dataOwner = await dataOwnerApi.getDataOwner(user.dataOwnerId()!);
    if (dataOwner == null) {
      throw FormatException("Impossible to find the patient ${user.patientId} apparently linked to the user ${user.id}. Are you sure this patientId is correct?");
    }

    if (dataOwner.publicKey == null) {
      dataOwner.publicKey = userKeyPair.item2;
      final modDataOwner = await dataOwnerApi.modifyDataOwner(dataOwner);

      if (user.patientId != null) { // implicitly && dataOwner.id == user.patientId
        await _initPatientDelegationsAndSave(authenticatedApi, modDataOwner as PatientDto, user, dataOwnerApi);
      }
    } else if (dataOwner.publicKey != userKeyPair.item2) {
      //TODO User lost his key
    }

    return authenticatedApi;
  }

  Future<void> _initPatientDelegationsAndSave(
      MedTechApi apiWithNewKeyPair, PatientDto modPat, UserDto user, DataOwnerApi<dynamic> dataOwnerApi) async {
    if (modPat.delegations.isEmpty &&  modPat.encryptionKeys.isEmpty) {
      final ccPatient = patientCryptoConfig(apiWithNewKeyPair.crypto);
      final dataOwnerWithDelegations = await apiWithNewKeyPair.basePatientApi.rawGetPatient(modPat.id)
          .then((updatedPatient) => DecryptedPatientDto.fromJson(updatedPatient!.toJson()).let((that) => that!.initDelegations(user, ccPatient)));

      final initialisedDataOwner = await apiWithNewKeyPair.basePatientApi.modifyPatient(user, dataOwnerWithDelegations, ccPatient);
      if (initialisedDataOwner == null) {
        throw FormatException("An error occurred while initializing the delegation for the user ${user.id}");
      }
      apiWithNewKeyPair.crypto.clearCachesFor(initialisedDataOwner.id);
    } else if (!modPat.delegations.containsKey(modPat.id)){
      // Patient already existed and some hcp may have created encrypted data -> only create delegation
      final ccPatient = patientCryptoConfig(apiWithNewKeyPair.crypto);
      final sfk = Uuid().v4(options: {'rng': UuidUtil.cryptoRNG});
      final keyAndOwner = await ccPatient.crypto.encryptAESKeyForHcp(modPat.id, modPat.id, modPat.id, sfk);
      if (keyAndOwner.item2 != null) {
        modPat.hcPartyKeys = keyAndOwner.item2!.hcPartyKeys;
        modPat.aesExchangeKeys = keyAndOwner.item2!.aesExchangeKeys;
        modPat.rev = keyAndOwner.item2!.rev;
      }
      final newDelegationsSet = modPat.delegations[modPat.id] ?? {};
      final newDelegation = DelegationDto(
          owner: modPat.id,
          delegatedTo: modPat.id,
          key: keyAndOwner.item1
      );
      newDelegationsSet.add(newDelegation);
      modPat.delegations[modPat.id] = newDelegationsSet;
      await apiWithNewKeyPair.basePatientApi.rawModifyPatient(modPat);
    }
  }
}
