@Timeout(Duration(hours: 1))
import 'package:icure_medical_device_dart_sdk/api.dart';
import "package:test/test.dart";
import 'package:uuid/uuid.dart';
import 'package:uuid/uuid_util.dart';

import '../utils/test_utils.dart';

void main() {
  final Uuid uuid = Uuid();

  Future<MedTechApi> medtechApi() async {
    return await TestUtils.medtechApi();
  }

  Coding getCoding() => Coding(
      description: {"fr": "Bonjour le monde", "en": "Hello world"}, code: uuid.v4(options: {'rng': UuidUtil.cryptoRNG}), type: "TEST", version: "1");

  group('tests for CodingApi', () {
    test('test createOrModifyCoding CREATE', () async {
      // Init
      final MedTechApi api = await medtechApi();
      final Coding coding = getCoding();

      final createdCoding = await api.codingApi.createOrModifyCoding(coding);

      expect("${coding.type}|${coding.code}|${coding.version}", createdCoding!.id);
      expect(coding.description, createdCoding.description);
    });

    test('test getCoding', () async {
      // Init
      final MedTechApi api = await medtechApi();
      final Coding coding = getCoding();

      // When
      final createdCoding = await api.codingApi.createOrModifyCoding(coding);
      final gotCoding = await api.codingApi.getCoding(createdCoding!.id!);

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
      final Coding coding = getCoding();
      final updateVersion = "2";

      // When
      final createdCoding = await api.codingApi.createOrModifyCoding(coding);
      createdCoding!.version = updateVersion;
      final updatedCoding = await api.codingApi.createOrModifyCoding(createdCoding);

      // Then
      expect(createdCoding.id, updatedCoding!.id);
      assert(updatedCoding.rev != null && updatedCoding.rev != createdCoding.rev);
      expect(createdCoding.code, updatedCoding.code);
      expect(createdCoding.type, updatedCoding.type);
      expect(updatedCoding.version, updateVersion);
    });
  });
}
