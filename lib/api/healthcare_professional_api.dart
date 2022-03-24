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

  /// Creates a new healthcare professional or modify an existing one.
  ///
  ///
  /// Parameters:
  ///
  /// * [HealthcareProfessional] healthcareProfessional (required):
  ///   The healthcare professional that must be created in the database.
  Future<HealthcareProfessional?> createOrModifyHealthcareProfessional(HealthcareProfessional healthcareProfessional,);

  /// Creates new healthcare professionals or modify a list of existing ones.
  ///
  /// Parameters:
  ///
  /// * [List] healthcareProfessionals (required):
  ///   The list of healthcare professionals that must be created / updated in the database.
  Future<List<HealthcareProfessional>?> createOrModifyHealthcareProfessionals(List<HealthcareProfessional> healthcareProfessionals);

  /// Deletes an existing healthcare professional.
  ///
  /// Deletes the healthcare professional identified by the provided unique hcpId.
  ///
  /// Parameters:
  ///
  /// * [String] hcpId (required):
  ///   The UUID that uniquely identifies the healthcare professional to be deleted.
  Future<String?> deleteHealthcareProfessional(String hcpId,);

  /// Deletes a list of existing healthcare professionals.
  ///
  /// Deletes the healthcare professionals identified by the provided unique hcpIds.
  ///
  /// Parameters:
  ///
  /// * [List] hcpIds (required):
  ///   The list of UUIDs that uniquely identify the healthcare professionals to be deleted.
  Future<List<String>?> deleteHealthcareProfessionals(List<String> hcpIds);

  /// Loads healthcare professionals from the database by filtering them using the provided Filter.
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
