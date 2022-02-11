
import 'package:icure_dart_sdk/api.dart';
import 'package:icure_dart_sdk/crypto/crypto.dart';
import 'package:crypton/crypton.dart';

class MedTechApi {
  final UserApi userApi;
  final PatientApi patientApi;
  final HealthElementApi healthElementApi;
  final HealthcarePartyApi healthcarePartyApi;
  final LocalCrypto localCrypto;

  MedTechApi(this.userApi, this.patientApi, this.healthElementApi, this.healthcarePartyApi, this.localCrypto);
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

  void addKeyPair(String keyId, RSAPrivateKey privateKey, RSAPublicKey publicKey){
    var keyPair = RSAKeypair(privateKey);
    rsaKeyPairs[keyId] = keyPair;
  }
  
  MedTechApi build(){
    final ApiClient client = ApiClient.basic(iCureBasePath, userName, password);
    final hcpApi = HealthcarePartyApi(client);

    return MedTechApi(
      UserApi(client),
      PatientApi(client),
      HealthElementApi(client),
      hcpApi,
      LocalCrypto(hcpApi, rsaKeyPairs)
    );
  }
}
