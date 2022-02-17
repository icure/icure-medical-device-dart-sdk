import 'dart:ffi';

import 'package:icure_dart_sdk/api.dart' as rawApi;
import 'package:icure_medical_device_dart_sdk/api.dart';
import 'package:icure_medical_device_dart_sdk/mappers/filter.dart';
import "package:test/test.dart";


void main() {
  group('tests for Hcps', () {
    test('test PatientByHcPartyNameContainsFuzzyFilter', () async {
      var filter = PatientByHcPartyNameContainsFuzzyFilter(healthcarePartyId: '123', searchString: 'abc');
      var converted = filter.toAbstractFilterDto();
      var clazz = '\$${filter.runtimeType.toString()}';
      expect((converted as rawApi.PatientByHcPartyNameContainsFuzzyFilter).searchString, "abc");
    });

    test('test filter dsl', () async {
      var filter = await PatientFilter()
          .forHcp(HealthcareProfessional(id: '123'))
          .byGenderEducationProfession(PatientGenderEnum.male, null, null)
          .intersection([
              PatientFilter().containsFuzzy("lisa"),
              PatientFilter().ofAge(28),
          ]).build();
      expect((filter as IntersectionFilter<Patient>).filters[1] is IntersectionFilter<Patient>, true);
    });

  });
}
