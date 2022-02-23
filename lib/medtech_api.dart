// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of icure_medical_device_dart_sdk.api;

class MedTechApi {
  final base_api.CodeApi baseCodeApi;
  final base_api.UserApi baseUserApi;
  final base_api.PatientApi basePatientApi;
  final base_api.HealthElementApi baseHealthElementApi;
  final base_api.DeviceApi baseDeviceApi;
  final base_api.HealthcarePartyApi baseHealthcarePartyApi;
  final base_api.ContactApi baseContactApi;
  final LocalCrypto localCrypto;
  final base_api.DocumentApi baseDocumentApi;
  final base_api.AuthApi baseAuthApi;

  MedTechApi(this.baseCodeApi, this.baseUserApi, this.basePatientApi, this.baseHealthElementApi, this.baseDeviceApi, this.baseHealthcarePartyApi,
      this.baseContactApi, this.localCrypto, this.baseDocumentApi, this.baseAuthApi);

  CodingApi? _codingApi;
  PatientApi? _patientApi;
  UserApi? _userApi;
  HealthcareElementApi? _healthcareElementApi;
  MedicalDeviceApi? _medicalDeviceApi;
  DataSampleApi? _dataSampleApi;
  HealthcareProfessionalApi? _healthcareProfessionalApi;

  CodingApi get codingApi => _codingApi ?? (_codingApi = CodingApiImpl(this));
  PatientApi get patientApi => _patientApi ?? (_patientApi = PatientApiImpl(this));
  UserApi get userApi => _userApi ?? (_userApi = UserApiImpl(this));
  HealthcareElementApi get healthcareElementApi => _healthcareElementApi ?? (_healthcareElementApi = HealthcareElementApiImpl(this));
  MedicalDeviceApi get medicalDeviceApi => _medicalDeviceApi ?? (_medicalDeviceApi = MedicalDeviceApiImpl(this));
  DataSampleApi get dataSampleApi => _dataSampleApi ?? (_dataSampleApi = DataSampleApiImpl(this));
  HealthcareProfessionalApi get healthcareProfessionalApi => _healthcareProfessionalApi ?? (_healthcareProfessionalApi = HealthcareProfessionalApiImpl(this));
}

class MedTechApiBuilder {
  late String _iCureBasePath;
  late String _userName;
  late String _password;
  Map<String, RSAKeypair> rsaKeyPairs = Map();

  String get iCureBasePath => _iCureBasePath;

  set iCureBasePath(String newICureBasePath) {
    _iCureBasePath = newICureBasePath;
  }

  MedTechApiBuilder withICureBasePath(String newICureBasePath) {
    _iCureBasePath = newICureBasePath;
    return this;
  }

  String get userName => _userName;

  set userName(String newUserName) {
    _userName = newUserName;
  }

  MedTechApiBuilder withUserName(String newUserName) {
    _userName = newUserName;
    return this;
  }

  String get password => _password;

  set password(String newPassword) {
    _password = newPassword;
  }

  MedTechApiBuilder withPassword(String newPassword) {
    _password = newPassword;
    return this;
  }

  MedTechApiBuilder addKeyPair(String keyId, RSAPrivateKey privateKey) {
    var keyPair = RSAKeypair(privateKey);
    rsaKeyPairs[keyId] = keyPair;
    return this;
  }

  MedTechApi build() {
    final base_api.ApiClient client = base_api.ApiClient.basic(iCureBasePath, userName, password);
    final hcpApi = base_api.HealthcarePartyApi(client);
    final patientApi = base_api.PatientApi(client);
    final deviceApi = base_api.DeviceApi(client);

    return MedTechApi(
        base_api.CodeApi(client),
        base_api.UserApi(client),
        patientApi,
        base_api.HealthElementApi(client),
        deviceApi,
        hcpApi,
        base_api.ContactApi(client),
        LocalCrypto(DataOwnerResolver(hcpApi, patientApi, deviceApi), rsaKeyPairs),
        base_api.DocumentApi(client),
        base_api.AuthApi(client));
  }
}
