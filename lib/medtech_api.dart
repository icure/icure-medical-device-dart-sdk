// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of icure_medical_device_dart_sdk.api;

class MedTechApi {
  final String iCureBasePath;
  final String userName;
  final String password;

  final String? msgGtwUrl;
  final String? signUpProcessId;

  late final base_api.CodeApi baseCodeApi;
  late final base_api.UserApi baseUserApi;
  late final base_api.PatientApi basePatientApi;
  late final base_api.HealthElementApi baseHealthElementApi;
  late final base_api.DeviceApi baseDeviceApi;
  late final base_api.HealthcarePartyApi baseHealthcarePartyApi;
  late final base_api.ContactApi baseContactApi;
  late final Crypto crypto;
  late final base_api.DocumentApi baseDocumentApi;
  late final base_api.AuthApi baseAuthApi;

  MedTechApi(this.iCureBasePath, this.userName, this.password, Map<String, RSAKeypair> rsaKeyPairs, this.msgGtwUrl, this.signUpProcessId) {
    final base_api.ApiClient client = base_api.ApiClient.basic(iCureBasePath, userName, password);

    this.baseHealthcarePartyApi = base_api.HealthcarePartyApi(client);
    this.basePatientApi = base_api.PatientApi(client);
    this.baseDeviceApi = base_api.DeviceApi(client);
    this.baseCodeApi = base_api.CodeApi(client);
    this.baseUserApi = base_api.UserApi(client);
    this.baseHealthElementApi = base_api.HealthElementApi(client);
    this.baseContactApi = base_api.ContactApi(client);
    this.crypto = LocalCrypto(DataOwnerResolver(this.baseHealthcarePartyApi, this.basePatientApi, this.baseDeviceApi), rsaKeyPairs);
    this.baseDocumentApi = base_api.DocumentApi(client);
    this.baseAuthApi = base_api.AuthApi(client);
  }

  CodingApi? _codingApi;
  PatientApi? _patientApi;
  UserApi? _userApi;
  HealthcareElementApi? _healthcareElementApi;
  MedicalDeviceApi? _medicalDeviceApi;
  DataSampleApi? _dataSampleApi;
  HealthcareProfessionalApi? _healthcareProfessionalApi;
  RegistrationApi? _registrationApi;

  CodingApi get codingApi => _codingApi ?? (_codingApi = CodingApiImpl(this));
  PatientApi get patientApi => _patientApi ?? (_patientApi = PatientApiImpl(this));
  UserApi get userApi => _userApi ?? (_userApi = UserApiImpl(this));
  HealthcareElementApi get healthcareElementApi => _healthcareElementApi ?? (_healthcareElementApi = HealthcareElementApiImpl(this));
  MedicalDeviceApi get medicalDeviceApi => _medicalDeviceApi ?? (_medicalDeviceApi = MedicalDeviceApiImpl(this));
  DataSampleApi get dataSampleApi => _dataSampleApi ?? (_dataSampleApi = DataSampleApiImpl(this));
  HealthcareProfessionalApi get healthcareProfessionalApi => _healthcareProfessionalApi ?? (_healthcareProfessionalApi = HealthcareProfessionalApiImpl(this));
  RegistrationApi get registrationApi {
    if (_registrationApi != null) {
      return _registrationApi!;
    }

    if (this.msgGtwUrl == null || this.signUpProcessId == null) {
      throw FormatException("To use RegistrationApi, you need to provide the msgGtwUrl and your signUpProcessId !");
    }

    _registrationApi = RegistrationApi(this.iCureBasePath, this.msgGtwUrl!, this.signUpProcessId!);
    return _registrationApi!;
  }

}

class MedTechApiBuilder {
  String? _iCureBasePath = "https://kraken.icure.dev";
  String? _userName;
  String? _password;
  Map<String, RSAKeypair> _rsaKeyPairs = Map();

  String? _msgGtwUrl = "https://msg-gw.icure.cloud/km";
  String? _signUpProcessId;

  static MedTechApiBuilder newBuilder() {
    return MedTechApiBuilder();
  }

  static MedTechApiBuilder from(MedTechApi previousApi) {
    return newBuilder()
        .withICureBasePath(previousApi.iCureBasePath)
        .withUserName(previousApi.userName)
        .withPassword(previousApi.password)
        .withMsgGtwUrl(previousApi.msgGtwUrl)
        .withSignUpProcessId(previousApi.signUpProcessId);
  }

  MedTechApiBuilder withICureBasePath(String newICureBasePath) {
    _iCureBasePath = newICureBasePath;
    return this;
  }

  MedTechApiBuilder withUserName(String newUserName) {
    _userName = newUserName;
    return this;
  }

  MedTechApiBuilder withPassword(String newPassword) {
    _password = newPassword;
    return this;
  }

  MedTechApiBuilder addKeyPair(String keyId, Uint8List privateKey) {
    var keyPair = RSAKeypair(RSAPrivateKey.fromString(base64.encoder.convert(privateKey)));
    _rsaKeyPairs[keyId] = keyPair;
    return this;
  }

  MedTechApiBuilder withMsgGtwUrl(String? msgGtwUrl) {
    _msgGtwUrl = msgGtwUrl;
    return this;
  }

  MedTechApiBuilder withSignUpProcessId(String? signUpProcessId) {
    _signUpProcessId = signUpProcessId;
    return this;
  }


  MedTechApi build() {
    if (_iCureBasePath == null || _userName == null || _password == null) {
      throw FormatException("Missing mandatory information [iCureBasePath, userName & password] to build valid MedTechApi");
    }

    return MedTechApi(
        _iCureBasePath!,
        _userName!,
        _password!,
        _rsaKeyPairs,
        _msgGtwUrl,
        _signUpProcessId
    );
  }
}
