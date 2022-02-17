@Timeout(Duration(hours: 1))
import 'dart:convert';
import 'dart:io';

import 'package:icure_dart_sdk/util/binary_utils.dart';
import 'package:icure_medical_device_dart_sdk/api.dart';
import "package:test/test.dart";
import 'package:uuid/uuid.dart';
import 'package:uuid/uuid_util.dart';

void main() {
  final Uuid uuid = Uuid();

  Future<MedTechApi> medtechApi() async {
    final MedTechApiBuilder builder = MedTechApiBuilder();
    builder.iCureBasePath = 'https://kraken.icure.dev';
    builder.userName = 'abdemotst2';
    builder.password = '27b90f6e-6847-44bf-b90f-6e6847b4bf1c';

    var fileUri = Uri.file("test/resources/keys/782f1bcd-9f3f-408a-af1b-cd9f3f908a98-icc-priv.2048.key", windows: false);
    var hcpKeyFile = File.fromUri(fileUri);

    builder.addKeyPair("782f1bcd-9f3f-408a-af1b-cd9f3f908a98", (await hcpKeyFile.readAsString(encoding: utf8)).toPrivateKey());

    return builder.build();
  }

  Coding getCoding() => Coding(
      description: {"fr": "Bonjour le monde", "en": "Hello world"}, code: uuid.v4(options: {'rng': UuidUtil.cryptoRNG}), type: "TEST", version: "1");

  group('tests for CodingApi', () {
    test('test createOrModifyCoding CREATE', () async {
      // Init
      final MedTechApi api = await medtechApi();
      final CodingApi codingApi = CodingApiImpl(api);
      final Coding coding = getCoding();

      final createdCoding = await codingApi.createOrModifyCoding(coding);

      expect("${coding.type}|${coding.code}|${coding.version}", createdCoding!.id);
      expect(coding.description, createdCoding.description);
    });

    test('test getCoding', () async {
      // Init
      final MedTechApi api = await medtechApi();
      final CodingApi codingApi = CodingApiImpl(api);
      final Coding coding = getCoding();

      // When
      final createdCoding = await codingApi.createOrModifyCoding(coding);
      final gotCoding = await codingApi.getCoding(createdCoding!.id!);

      // Then
      expect(createdCoding.id, gotCoding!.id);
      expect(createdCoding.rev, gotCoding.rev);
      expect(createdCoding.code, gotCoding.code);
      expect(createdCoding.type, gotCoding.type);
      expect(createdCoding.version, gotCoding.version);
    });

    test('test createOrModifyCoding UPDATE', () async {
      // Init
      final MedTechApi api = await medtechApi();
      final CodingApi codingApi = CodingApiImpl(api);
      final Coding coding = getCoding();
      final updateVersion = "2";

      // When
      final createdCoding = await codingApi.createOrModifyCoding(coding);
      createdCoding!.version = updateVersion;
      final updatedCoding = await codingApi.createOrModifyCoding(createdCoding);

      // Then
      expect(createdCoding.id, updatedCoding!.id);
      assert(updatedCoding.rev != null && updatedCoding.rev != createdCoding.rev);
      expect(createdCoding.code, updatedCoding.code);
      expect(createdCoding.type, updatedCoding.type);
      expect(updatedCoding.version, updateVersion);
    });
  });
}
