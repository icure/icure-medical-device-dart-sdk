import 'package:icure_dart_sdk/api.dart' as rawApi;
import 'package:icure_medical_device_dart_sdk/api.dart';
import 'package:icure_medical_device_dart_sdk/mappers/identifier.dart';
import "package:test/test.dart";

void main() {
  group('Identifier Mapping', () {
    test('test toIdentifierDto mapping', () async {
      final idToMap = Identifier(
          assigner: "https://heartkinetics.com",
          system: "system",
          value: "LINEAR"
      );

      // When
      final mappedId = idToMap.toIdentifierDto();

      // Then
      assert(mappedId.system == idToMap.system);
      assert(mappedId.assigner == idToMap.assigner);
      assert(mappedId.value == idToMap.value);
    });

    test('test toIdentifier mapping', () async {
      final idToMap = rawApi.IdentifierDto(
          assigner: "https://heartkinetics.com",
          system: "system",
          value: "LINEAR"
      );

      // When
      final mappedId = idToMap.toIdentifier();

      // Then
      assert(mappedId.system == idToMap.system);
      assert(mappedId.assigner == idToMap.assigner);
      assert(mappedId.value == idToMap.value);
    });
  });
}