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


/// tests for PatientApi
void main() {
  // final instance = PatientApi();

  group('tests for PatientApi', () {
    // Create or update a [Patient]
    //
    // When modifying a patient, you must ensure that the rev obtained when getting or creating the patient is present as the rev is used to guarantee that the patient has not been modified by a third party.
    //
    //Future<Patient> createOrModifyPatient(Patient patient) async
    test('test createOrModifyPatient', () async {
      // TODO
    });

    // Delete a [Patient]
    //
    // Deletes the patient identified by the provided unique [patientId].
    //
    //Future<String> deletePatient(String patientId) async
    test('test deletePatient', () async {
      // TODO
    });

    // Load patients from the database by filtering them using the provided [filter].
    //
    // Filters are complex selectors that are built by combining basic building blocks. Examples of filters available for [Patient] are AllPatientsFilter and PatientsByIdsFilter. This method returns a paginated list of patient (with a cursor that lets you query the following items).
    //
    //Future<PaginatedListPatient> filterPatients(Filter filter, { String nextPatientId, int limit }) async
    test('test filterPatients', () async {
      // TODO
    });

    // Get a [Patient]
    //
    // Each patient is uniquely identified by a patient id. The patient id is a UUID. This [patientId] is the preferred method to retrieve one specific patient.
    //
    //Future<Patient> getPatient(String patientId) async
    test('test getPatient', () async {
      // TODO
    });

    // Load patient ids from the database by filtering them using the provided [filter].
    //
    // Filters are complex selectors that are built by combining basic building blocks. Examples of filters available for [Patient] are AllPatientsFilter and PatientsByIdsFilter. This method returns the list of the ids of the users matching the [filter].
    //
    //Future<List<String>> matchPatients(Filter filter) async
    test('test matchPatients', () async {
      // TODO
    });

  });
}
