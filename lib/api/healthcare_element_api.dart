//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of icure_medical_device_dart_sdk.api;


abstract class HealthcareElementApi {
  HealthcareElementApi([ApiClient? apiClient]) : apiClient = apiClient ?? defaultApiClient;

  final ApiClient apiClient;

  /// Create a Healthcare Element
  ///
  /// Parameters:
  ///
  /// * [HealthcareElement] healthcareElement (required):
  Future<HealthcareElement?> createOrModifyHealthcareElement(String patientId, HealthcareElement healthcareElement,);

  /// Create a Healthcare Element
  ///
  /// Parameters:
  ///
  /// * [List<HealthcareElement>] healthcareElement (required):
  Future<List<HealthcareElement>?> createOrModifyHealthcareElements(String patientId, List<HealthcareElement> healthcareElement,);

  /// Delete a Healthcare Element
  ///
  /// Parameters:
  ///
  /// * [String] id (required):
  Future<String?> deleteHealthcareElement(String id,);

  /// Find Healthcare Elements using a filter
  ///
  /// Parameters:
  ///
  /// * [Filter] filter (required):
  Future<PaginatedListHealthcareElement?> filterHealthcareElement(Filter<HealthcareElement> filter, { String? nextHealthElementId, int? limit, });

  /// Get a Healthcare Element
  ///
  /// Parameters:
  ///
  /// * [String] id (required):
  Future<HealthcareElement?> getHealthcareElement(
    String id,
  );

  /// Find Healthcare Elements using a filter
  ///
  /// Parameters:
  ///
  /// * [Filter] filter (required):
  Future<List<String>?> matchHealthcareElement(
    Filter filter,
  );

  /// Give access to another dataOwner to the healthcareElement
  ///
  /// Parameters:
  ///
  /// * [HealthcareElement] healthcareElement to giveAccessTo [delegateTo]
  /// * [String] delegatedTo: dataOwnerId to giveAccessTo
  ///
  /// Data owner id can be either a:
  /// * healthcarePartyId,
  /// * patientId
  /// * deviceId
  ///
  Future<HealthcareElement> giveAccessTo(HealthcareElement healthcareElement, String delegatedTo);
}
