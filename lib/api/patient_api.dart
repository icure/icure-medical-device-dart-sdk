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
  Future<PaginatedListPatient?> filterPatients(Filter<Patient> filter, { String? nextPatientId, int? limit, String? startKey});

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
  Future<List<String>?> matchPatients(
    Filter filter,
  );

  /// Give access to another dataOwner to the patient
  ///
  /// Parameters:
  ///
  /// * [Patient] patient to giveAccessTo [delegateTo]
  /// * [String] delegatedTo: dataOwnerId to giveAccessTo
  ///
  /// Data owner id can be either a:
  /// * healthcarePartyId,
  /// * patientId
  /// * deviceId
  ///
  Future<Patient> giveAccessTo(Patient patient, String delegatedTo);

  Future<PotentiallyEncryptedPatient> giveAccessToPotentiallyEncrypted(PotentiallyEncryptedPatient patient, String delegatedTo);

  /// Gets a patient and tries to decrypt its content. If it is not possible to decrypt the content only the unencrypted
  /// data will be available.
  /// This method is useful to allow new patient users to access some of their own data before their doctor actually
  /// gave them access to their own data: instead of giving an error if the data can't be decrypted (like what happens
  /// in getPatient) you will be able to get at least partial information.
  Future<PotentiallyEncryptedPatient?> getPatientAndTryDecrypt(String patientId,);

  /// Modifies an encrypted patient, ensuring that the modified patient does not include any data which should be
  /// encrypted.
  /// Similarly to getPatientAndTryDecrypt this method is useful when a patient needs to update is own data before
  /// an hcp gave him access to his own encrypted data.
  Future<EncryptedPatient?> modifyEncryptedPatient(EncryptedPatient modifiedPatient,);
}
