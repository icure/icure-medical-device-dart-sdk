//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of icure_medical_device_dart_sdk.api;


abstract class HealthcareProfessionalApi {
  HealthcareProfessionalApi([ApiClient? apiClient]) : apiClient = apiClient ?? defaultApiClient;

  final ApiClient apiClient;

  /// Create a newhealthcare professional or modify an existing one.
  ///
  /// Ahealthcare professional must have a login, an email or a mobilePhone defined, ahealthcare professional should be linked to either a Healthcare Professional, a Patient or a Device. When modifying an healthcare professional, you must ensure that the rev obtained when getting or creating thehealthcare professional is present as the rev is used to guarantee that thehealthcare professional has not been modified by a third party.
  ///
  /// Parameters:
  ///
  /// * [HealthcareProfessional] healthcareProfessional (required):
  ///   Thehealthcare professional that must be created in the database.
  Future<HealthcareProfessional?> createOrModifyHealthcareProfessional(HealthcareProfessional healthcareProfessional,);

  /// Delete an existing healthcare professional.
  ///
  /// Deletes thehealthcare professional identified by the provided unique hcpId.
  ///
  /// Parameters:
  ///
  /// * [String] hcpId (required):
  ///   The UUID that uniquely identifies thehealthcare professional to be deleted.
  Future<String?> deleteHealthcareProfessional(String hcpId,);

  /// Load healthcare professionals from the database by filtering them using the provided Filter.
  ///
  /// Filters are complex selectors that are built by combining basic building blocks. Examples of filters available for Healthcare professionals are AllHealthcareProfessionalsFilter and HealthcarProfessionalsByIdsFilter. This method returns a paginated list of healthcare professionals (with a cursor that lets you query the following items).
  ///
  /// Parameters:
  ///
  /// * [Filter] filter (required):
  ///   The Filter object that describes which condition(s) the elements whose the ids should be returned must fulfill
  ///
  /// * [String] nextHcpId:
  ///   The id of the first Healthcare professional in the next page
  ///
  /// * [int] limit:
  ///   The number of healthcare professionals to return in the queried page
  Future<PaginatedListHealthcareProfessional?> filterHealthcareProfessionalsBy(Filter<HealthcareProfessional> filter, { String? nextHcpId, int? limit, });

  /// Get a Healthcare professional by id.
  ///
  /// Eachhealthcare professional is uniquely identified by ahealthcare professional id. Thehealthcare professional id is a UUID. This hcpId is the preferred method to retrieve one specific healthcare professional.
  ///
  /// Parameters:
  ///
  /// * [String] hcpId (required):
  ///   The UUID that identifies thehealthcare professional uniquely
  Future<HealthcareProfessional?> getHealthcareProfessional(String hcpId,);

  /// Loadhealthcare professional ids from the database by filtering them using the provided Filter.
  ///
  /// Filters are complex selectors that are built by combining basic building blocks. Examples of filters available for Healthcare professionals are AllHealthcare professionalsFilter and Healthcare professionalsByIdsFilter. This method returns the list of the ids of the healthcare professionals matching the filter.
  ///
  /// Parameters:
  ///
  /// * [Filter] filter (required):
  ///   The Filter object that describes which condition(s) the elements whose the ids should be returned must fulfill
  Future<List<String>?> matchHealthcareProfessionalsBy(Filter<HealthcareProfessional> filter,);
}
