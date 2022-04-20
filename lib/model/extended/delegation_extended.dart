
import 'package:icure_medical_device_dart_sdk/api.dart';

extension DelegationExtended on Delegation {
  static Future<Delegation> delegationBasedOn(Crypto localCrypto, String dataOwnerId,
      String delegatedTo, String objectId, String keyToEncrypt) async {
    return Delegation(
        owner: dataOwnerId,
        delegatedTo: delegatedTo,
        key: (await localCrypto.encryptAESKeyForHcp(dataOwnerId, delegatedTo, objectId, keyToEncrypt)).item1);
  }
}