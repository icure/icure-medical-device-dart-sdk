import 'package:icure_dart_sdk/api.dart' as rawApi;
import 'package:icure_medical_device_dart_sdk/api.dart';
import 'package:icure_medical_device_dart_sdk/mappers/filter.dart';
import "package:test/test.dart";

import '../utils/test_utils.dart';


void main() {
  group('tests for Hcps', () {
    test('test PatientByHcPartyNameContainsFuzzyFilter', () async {
      var filter = PatientByHcPartyNameContainsFuzzyFilter(healthcarePartyId: '123', searchString: 'abc');
      var converted = filter.toAbstractFilterDto();
      var clazz = '\$${filter.runtimeType.toString()}';
      expect((converted as rawApi.PatientByHcPartyNameContainsFuzzyFilter).searchString, "abc");
    });

    test('test patient filter dsl', () async {
      var filter = await PatientFilter().forDataOwner('123').byGenderEducationProfession(PatientGenderEnum.male).intersection([
        PatientFilter().containsFuzzy("lisa"),
        PatientFilter().ofAge(28),
      ]).build();
      expect((filter as IntersectionFilter<Patient>).filters[1] is IntersectionFilter<Patient>, true);
    });

    test('test coding filter dsl', () async {
      var filter = await CodingFilter().byIds({"123", "456"}).byRegionTypeLabelLanguage(region: "region").build();
      expect((filter as IntersectionFilter<Coding>).filters[0] is CodingByIdsFilter, true);
      expect((filter as IntersectionFilter<Coding>).filters[1] is CodingByRegionTypeLabelLanguageFilter, true);
    });

    test('test data samples filter dsl', () async {
      // Given
      final MedTechApi api = await TestUtils.medtechApi();
      final currentUser = await api.userApi.getLoggedUser();

      final createdPatient = await api.patientApi.createOrModifyPatient(Patient(
        firstName: "John",
        lastName: "Snow",
        note: "Winter is coming"
      ));

      var filter = await DataSampleFilter()
          .forDataOwner(currentUser!.healthcarePartyId!)
          .byTagCodeDateFilter(tagType: "HK-KINO", tagCode: "RECORD")
          .forPatients(api.crypto, [createdPatient!])
          .build();
      expect((filter as IntersectionFilter<DataSample>).filters[0] is DataSampleByHcPartyTagCodeDateFilter, true);
      expect((filter as IntersectionFilter<DataSample>).filters[1] is DataSampleBySecretForeignKeys, true);
    });

    test('test DataSample filter dsl', () async {
      var filter = await DataSampleFilter().forDataOwner("EFF140E2-FF19-48AC-A87C-FD7E4F57CCE0").union([
        DataSampleFilter().byTagCodeDateFilter(tagCode: "8302-2", tagType: "LOINC"),
        DataSampleFilter().byTagCodeDateFilter(tagCode: "29463-7", tagType: "LOINC")
      ]).build();

      expect((filter as UnionFilter<DataSample>).filters[0] is DataSampleByHcPartyTagCodeDateFilter, true);
      expect((filter as UnionFilter<DataSample>).filters[1] is DataSampleByHcPartyTagCodeDateFilter, true);
    });
  });
}
