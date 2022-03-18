import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:icure_medical_device_dart_sdk/api.dart';

class TestUtils {

  static Future<MedTechApi> medtechApi() async {
    final creds = await TestUtils.credentials();

    return MedTechApiBuilder.newBuilder()
        .withICureBasePath("https://kraken.icure.dev")
        .withUserName(creds.username)
        .withPassword(creds.password)
        .withAuthServerUrl("https://msg-gw.icure.cloud/km")
        .withAuthProcessId("f0ced6c6-d7cb-4f78-841e-2674ad09621e")
        .addKeyPair("782f1bcd-9f3f-408a-af1b-cd9f3f908a98", await TestUtils.keyFromFile())
        .build();
  }

  static Future<Uint8List> keyFromFile({String keyFileName = "782f1bcd-9f3f-408a-af1b-cd9f3f908a98-icc-priv.2048.key"}) async {
    var fileUri = Uri.file("test/resources/keys/${keyFileName}", windows: false);
    var keyFile = File.fromUri(fileUri);

    return (await keyFile.readAsString(encoding: utf8)).keyFromHexString();
  }

  static Future<UsernamePassword> credentials({String credentialsFilePath = ".credentials"}) async {
    var fileUri = Uri.file("test/resources/creds/$credentialsFilePath", windows: false);
    var credentialsFile = File.fromUri(fileUri);

    return UsernamePassword.fromJson(json.decode(await credentialsFile.readAsString(encoding: utf8)))!;
  }
}

class UsernamePassword {
  UsernamePassword({required this.username, required this.password});

  String username;
  String password;

  static UsernamePassword? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      return UsernamePassword(
          username: mapValueOfType<String>(json, r'username')!,
          password: mapValueOfType<String>(json, r'password')!
      );
    }
    return null;
  }
}