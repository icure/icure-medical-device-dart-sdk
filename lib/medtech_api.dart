// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of icure_medical_device_dart_sdk.api;

class MedTechApi {
  final base_api.CodeApi codeApi;
  final base_api.UserApi userApi;
  final base_api.PatientApi patientApi;
  final base_api.HealthElementApi healthElementApi;
  final base_api.DeviceApi deviceApi;
  final base_api.HealthcarePartyApi healthcarePartyApi;
  final base_api.ContactApi contactApi;

  final LocalCrypto localCrypto;

  MedTechApi(
      this.codeApi, this.userApi, this.patientApi, this.healthElementApi, this.deviceApi, this.healthcarePartyApi, this.contactApi, this.localCrypto);
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

  String get userName => _userName;

  set userName(String newUserName) {
    _userName = newUserName;
  }

  String get password => _password;

  set password(String newPassword) {
    _password = newPassword;
  }

  void addKeyPair(String keyId, RSAPrivateKey privateKey) {
    var keyPair = RSAKeypair(privateKey);
    rsaKeyPairs[keyId] = keyPair;
  }

  MedTechApi build() {
    final base_api.ApiClient client = base_api.ApiClient.basic(iCureBasePath, userName, password);
    final hcpApi = base_api.HealthcarePartyApi(client);
    final patientApi = base_api.PatientApi(client);
    final deviceApi = base_api.DeviceApi(client);

    return MedTechApi(base_api.CodeApi(client), base_api.UserApi(client), patientApi, base_api.HealthElementApi(client), deviceApi, hcpApi,
        base_api.ContactApi(client), LocalCrypto(DataOwnerResolver(hcpApi, patientApi, deviceApi), rsaKeyPairs));
  }
}
