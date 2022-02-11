//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

import 'package:openapi/api.dart';
import 'package:test/test.dart';


/// tests for HealthcareProfessionalApi
void main() {
  // final instance = HealthcareProfessionalApi();

  group('tests for HealthcareProfessionalApi', () {
    // Create a newhealthcare professional or modify an existing one.
    //
    // Ahealthcare professional must have a login, an email or a mobilePhone defined, ahealthcare professional should be linked to either a Healthcare Professional, a Patient or a Device. When modifying an healthcare professional, you must ensure that the rev obtained when getting or creating thehealthcare professional is present as the rev is used to guarantee that thehealthcare professional has not been modified by a third party.
    //
    //Future<HealthcareProfessional> createOrModifyHealthcareProfessional(HealthcareProfessional healthcareProfessional) async
    test('test createOrModifyHealthcareProfessional', () async {
      // TODO
    });

    // Delete an existing healthcare professional.
    //
    // Deletes thehealthcare professional identified by the provided unique hcpId.
    //
    //Future<String> deleteHealthcareProfessional(String hcpId) async
    test('test deleteHealthcareProfessional', () async {
      // TODO
    });

    // Load healthcare professionals from the database by filtering them using the provided Filter.
    //
    // Filters are complex selectors that are built by combining basic building blocks. Examples of filters available for Healthcare professionals are AllHealthcareProfessionalsFilter and HealthcarProfessionalsByIdsFilter. This method returns a paginated list of healthcare professionals (with a cursor that lets you query the following items).
    //
    //Future<PaginatedListHealthcareProfessional> filterHealthcareProfessionalBy(Filter filter, { String nextHcpId, int limit }) async
    test('test filterHealthcareProfessionalBy', () async {
      // TODO
    });

    // Get a Healthcare professional by id.
    //
    // Eachhealthcare professional is uniquely identified by ahealthcare professional id. Thehealthcare professional id is a UUID. This hcpId is the preferred method to retrieve one specific healthcare professional.
    //
    //Future<HealthcareProfessional> getHealthcareProfessional(String hcpId) async
    test('test getHealthcareProfessional', () async {
      // TODO
    });

    // Loadhealthcare professional ids from the database by filtering them using the provided Filter.
    //
    // Filters are complex selectors that are built by combining basic building blocks. Examples of filters available for Healthcare professionals are AllHealthcare professionalsFilter and Healthcare professionalsByIdsFilter. This method returns the list of the ids of the healthcare professionals matching the filter.
    //
    //Future<List<String>> matchHealthcareProfessionalBy(Filter filter) async
    test('test matchHealthcareProfessionalBy', () async {
      // TODO
    });

  });
}
