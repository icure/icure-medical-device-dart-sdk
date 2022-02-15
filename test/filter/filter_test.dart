import 'package:icure_dart_sdk/api.dart' as rawApi;
import 'package:icure_medical_device_dart_sdk/api.dart';
import "package:test/test.dart";
import 'package:icure_medical_device_dart_sdk/mappers/filter.dart';


void main() {
  group('tests for Hcps', () {
    test('test healthcareParty deserialisation', () async {
      var filter = PatientByHcPartyNameContainsFuzzyFilter(healthcarePartyId: '123', searchString: 'abc');
      var converted = filter.toAbstractFilterDto();
      expect((converted as rawApi.PatientByHcPartyNameContainsFuzzyFilter).searchString, "abc");
    });
  });
}
