//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of icure_medical_device_dart_sdk.api;


abstract class PatientApi {
  PatientApi([ApiClient? apiClient]) : apiClient = apiClient ?? defaultApiClient;

  final ApiClient apiClient;

  /// Create or update a [Patient]
  ///
  /// When modifying a patient, you must ensure that the rev obtained when getting or creating the patient is present as the rev is used to guarantee that the patient has not been modified by a third party.
  ///
  /// Parameters:
  ///
  /// * [Patient] patient (required):
  Future<Patient?> createOrModifyPatient(Patient patient,);

  /// Delete a [Patient]
  ///
  /// Deletes the patient identified by the provided unique [patientId].
  ///
  /// Parameters:
  ///
  /// * [String] patientId (required):
  Future<String?> deletePatient(String patientId,);

  /// Load patients from the database by filtering them using the provided [filter].
  ///
  /// Filters are complex selectors that are built by combining basic building blocks. Examples of filters available for [Patient] are AllPatientsFilter and PatientsByIdsFilter. This method returns a paginated list of patient (with a cursor that lets you query the following items).
  ///
  /// Parameters:
  ///
  /// * [Filter] filter (required):
  ///   The Filter object that describes which condition(s) the elements whose the ids should be returned must fulfill
  ///
  /// * [String] nextPatientId:
  ///   The id of the first patient in the next page
  ///
  /// * [int] limit:
  ///   The number of patients to return in the queried page
  Future<PaginatedListPatient?> filterPatients(Filter filter, { String? nextPatientId, int? limit, String? startKey});

  /// Get a [Patient]
  ///
  /// Each patient is uniquely identified by a patient id. The patient id is a UUID. This [patientId] is the preferred method to retrieve one specific patient.
  ///
  /// Parameters:
  ///
  /// * [String] patientId (required):
  Future<Patient?> getPatient(String patientId,);

  /// Load patient ids from the database by filtering them using the provided [filter].
  ///
  /// Filters are complex selectors that are built by combining basic building blocks. Examples of filters available for [Patient] are AllPatientsFilter and PatientsByIdsFilter. This method returns the list of the ids of the users matching the [filter].
  ///
  /// Parameters:
  ///
  /// * [Filter] filter (required):
  ///   The Filter object that describes which condition(s) the elements whose the ids should be returned must fulfill
  Future<List<String>?> matchPatients(Filter filter,);
}
