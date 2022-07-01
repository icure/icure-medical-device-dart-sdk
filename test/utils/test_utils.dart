import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:icure_medical_device_dart_sdk/api.dart';

class TestUtils {

  static Future<MedTechApi> medtechApi({iCureBackendUrl= "https://kraken.icure.dev", credsFilePath = ".credentials", hcpId = "782f1bcd-9f3f-408a-af1b-cd9f3f908a98"}) async {
    final creds = await TestUtils.credentials(credentialsFilePath: credsFilePath);

    return MedTechApiBuilder.newBuilder()
        .withICureBasePath(iCureBackendUrl)
        .withUserName(creds.username)
        .withPassword(creds.password)
        .withAuthServerUrl("https://msg-gw.icure.cloud/km")
        .withAuthProcessId("f0ced6c6-d7cb-4f78-841e-2674ad09621e")
        .addKeyPair(hcpId, await TestUtils.keyFromFile(keyFileName: "${hcpId}-icc-priv.2048.key"))
        .build();
  }

  static Future<Uint8List> keyFromFile({String keyFileName = "782f1bcd-9f3f-408a-af1b-cd9f3f908a98-icc-priv.2048.key"}) async {
    var fileUri = Uri.file("test/resources/keys/${keyFileName}", windows: false);
    var keyFile = File.fromUri(fileUri);

    return (await keyFile.readAsString(encoding: utf8)).trim().keyFromHexString();
  }

  static Future<UsernamePassword> credentials({String credentialsFilePath = ".credentials"}) async {
    var fileUri = Uri.file("test/resources/creds/$credentialsFilePath", windows: false);
    var credentialsFile = File.fromUri(fileUri);

    return UsernamePassword.fromJson(json.decode(await credentialsFile.readAsString(encoding: utf8)))!;
  }

  static Future<MedTechApi> getApiFromCredentialsToken(
      {String credentialsFilePath = ".credentials",
      String authServer = "https://msg-gw.icure.cloud/km",
      String authProcessId = "f0ced6c6-d7cb-4f78-841e-2674ad09621e",
      String host = "https://kraken.icure.dev"}) async {
    final fileUri = Uri.file("test/resources/creds/$credentialsFilePath", windows: false);
    final credentialsFile = File.fromUri(fileUri);
    final user = UsernameTokenDataOwnerId.fromJson(json.decode(await credentialsFile.readAsString(encoding: utf8)));

    return MedTechApiBuilder()
        .withUserName(user!.username)
        .withPassword(user.token)
        .withAuthServerUrl(authServer)
        .withICureBasePath(host)
        .addKeyPair(user.dataOwnerId, await keyFromFile(keyFileName: "${user.dataOwnerId}-icc-priv.2048.key"))
        .build();
  }

  static AnonymousMedTechApi getAnonymousApi(
      {String authServer = "https://msg-gw.icure.cloud/km",
      String authProcessId = "f0ced6c6-d7cb-4f78-841e-2674ad09621e",
      String host = "https://kraken.icure.dev"}) {
    return AnonymousMedTechApi(host, authServer, authProcessId);
  }
}

class UsernamePassword {
  UsernamePassword({required this.username, required this.password});

  String username;
  String password;

  static UsernamePassword? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      return UsernamePassword(username: mapValueOfType<String>(json, r'username')!, password: mapValueOfType<String>(json, r'password')!);
    }
    return null;
  }
}

class UsernameTokenDataOwnerId {
  String username;
  String token;
  String dataOwnerId;

  UsernameTokenDataOwnerId({required this.username, required this.token, required this.dataOwnerId});

  static UsernameTokenDataOwnerId? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      return UsernameTokenDataOwnerId(
          username: mapValueOfType<String>(json, r'username')!,
          token: mapValueOfType<String>(json, r'token')!,
          dataOwnerId: mapValueOfType<String>(json, r'dataOwnerId')!);
    }
    return null;
  }
}
