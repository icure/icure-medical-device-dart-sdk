//
// @dart=2.12

part of icure_medical_device_dart_sdk.api;

class RegistrationApi {
  RegistrationApi(
      this.iCureBasePath,
      this.authServerUrl,
      this.authProcessId,
      this.dataOwnerApiFactory);

  final String iCureBasePath;
  final String authServerUrl;
  final String authProcessId;
  final DataOwnerApiFactory dataOwnerApiFactory;

  Future<RegistrationProcess?> startAuthentication(
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
      return RegistrationProcess(requestId, email);
    }

    return null;
  }

  Future<RegistrationResult> completeAuthentication(RegistrationProcess process, String validationCode, Tuple2<String, String> patientKeyPair) async {
    var client = Client();
    final Response res = await client.get(Uri.parse('${authServerUrl}/process/validate/${process.processId}-${validationCode}'), headers: {
      'Content-Type': 'application/json'
    });

    if (res.statusCode < 400) {
      final Tuple3<MedTechApi, UserDto, String> initInfo = await retry(
              () async => await createUserAuthenticationToken(process, validationCode),
          trials: 5, delay: 1000
      );

      MedTechApi authenticatedApi = await initUserCrypto(initInfo.item1, initInfo.item3, initInfo.item2, patientKeyPair);

      return RegistrationResult(authenticatedApi, initInfo.item3, initInfo.item2.id);
    }

    throw FormatException("Invalid validation code");
  }

  Future<Tuple3<MedTechApi, UserDto, String>> createUserAuthenticationToken(RegistrationProcess process, String validationCode) async {
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

      final token = await api.userApi.createToken(user.id, validity: Duration(days: 3653));
      if (token == null) {
        throw FormatException("Your validation code is expired");
      }
      print("User Token is : $token");

      return Tuple3(api, user, token);

    } catch (e) {
      throw FormatException("Your validation code is expired");
    }
  }

  Future<MedTechApi> initUserCrypto(MedTechApi api, String token, UserDto user, Tuple2<String, String> patientKeyPair) async {
    final authenticatedApi = MedTechApiBuilder.from(api)
        .withPassword(token)
        .addKeyPair(user.dataOwnerId()!, patientKeyPair.item1.keyFromHexString())
        .build();

    final dataOwnerApi = await DataOwnerApiFactory.fromExistingApis(
      authenticatedApi.baseHealthcarePartyApi,
      authenticatedApi.basePatientApi,
      authenticatedApi.baseDeviceApi,
    ).getDataOwnerApiFor(user);

    final dataOwner = await dataOwnerApi.getDataOwner(user.dataOwnerId()!);
    if (dataOwner == null) {
      throw FormatException("Your user is not a patient");
    }
    dataOwner.publicKey = patientKeyPair.item2;
    final modDataOwner = await dataOwnerApi.modifyDataOwner(dataOwner);

    if (user.patientId != null) {
      await initPatientDelegationsAndSave(authenticatedApi, modDataOwner as PatientDto, user, dataOwnerApi);
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
