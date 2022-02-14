
import 'package:crypton/crypton.dart';
import 'package:icure_dart_sdk/api.dart';
import 'package:icure_dart_sdk/crypto/crypto.dart';
import 'package:icure_dart_sdk/extended_api/data_owner_api.dart';

class MedTechApi {
  final CodeApi codeApi;
  final UserApi userApi;
  final PatientApi patientApi;
  final HealthElementApi healthElementApi;
  final DeviceApi deviceApi;
  final HealthcarePartyApi healthcarePartyApi;
  final ContactApi contactApi;
  final LocalCrypto localCrypto;

  MedTechApi(this.codeApi, this.userApi, this.patientApi, this.healthElementApi, this.deviceApi, this.healthcarePartyApi, this.contactApi, this.localCrypto);
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

  void addKeyPair(String keyId, RSAPrivateKey privateKey){
    var keyPair = RSAKeypair(privateKey);
    rsaKeyPairs[keyId] = keyPair;
  }

  MedTechApi build(){
    final ApiClient client = ApiClient.basic(iCureBasePath, userName, password);
    final hcpApi = HealthcarePartyApi(client);
    final patientApi = PatientApi(client);
    final deviceApi = DeviceApi(client);

    return MedTechApi(
      CodeApi(client),
      UserApi(client),
      patientApi,
      HealthElementApi(client),
      deviceApi,
      hcpApi,
      ContactApi(client),
      LocalCrypto(DataOwnerResolver(hcpApi, patientApi, deviceApi), rsaKeyPairs)
    );
  }
}
