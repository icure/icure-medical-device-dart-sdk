//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;


abstract class MedicalDeviceApi {
  MedicalDeviceApi([ApiClient? apiClient]) : apiClient = apiClient ?? defaultApiClient;

  final ApiClient apiClient;

  /// Create or update a [MedicalDevice]
  ///
  /// When modifying a device, you must ensure that the rev obtained when getting or creating the device is present as the rev is used to guarantee that the device has not been modified by a third party.
  ///
  /// Parameters:
  ///
  /// * [MedicalDevice] medicalDevice (required):
  Future<MedicalDevice?> createOrModifyMedicalDevice(MedicalDevice medicalDevice,);

  /// Create or update a batch of [MedicalDevice]
  ///
  /// When modifying a device, you must ensure that the rev obtained when getting or creating the device is present as the rev is used to guarantee that the device has not been modified by a third party.
  ///
  /// Parameters:
  ///
  /// * [List<MedicalDevice>] medicalDevice (required):
  Future<List<MedicalDevice>?> createOrModifyMedicalDevices(List<MedicalDevice> medicalDevice,);

  /// Delete a [MedicalDevice]
  ///
  /// Deletes the medical device identified by the provided unique [medicalDeviceId].
  ///
  /// Parameters:
  ///
  /// * [String] medicalDeviceId (required):
  Future<String?> deleteMedicalDevice(String medicalDeviceId,);

  /// Delete a batch of [MedicalDevice]
  ///
  /// Deletes the batch of medical device identified by the provided [medicalDeviceIds].
  ///
  /// Parameters:
  ///
  /// * [List<String>] requestBody (required):
  Future<List<String>?> deleteMedicalDevices(List<String> requestBody,);

  /// Load devices from the database by filtering them using the provided [filter].
  ///
  /// Filters are complex selectors that are built by combining basic building blocks. Examples of filters available for [MedicalDevice] are AllDevicesFilter and DevicesByIdsFilter. This method returns a paginated list of medical devices (with a cursor that lets you query the following items).
  ///
  /// Parameters:
  ///
  /// * [Filter] filter (required):
  ///   The Filter object that describes which condition(s) the elements whose the ids should be returned must fulfill
  ///
  /// * [String] nextDeviceId:
  ///   The id of the first device in the next page
  ///
  /// * [int] limit:
  ///   The number of devices to return in the queried page
  Future<PaginatedListMedicalDevice?> filterMedicalDevices(Filter filter, { String? nextDeviceId, int? limit, });

  /// Get a Medical Device
  ///
  /// Each medical device is uniquely identified by a device id. The device id is a UUID. This [medicalDeviceId] is the preferred method to retrieve one specific device.
  ///
  /// Parameters:
  ///
  /// * [String] medicalDeviceId (required):
  Future<MedicalDevice?> getMedicalDevice(String medicalDeviceId,);

  /// Load medical device ids from the database by filtering them using the provided Filter.
  ///
  /// Filters are complex selectors that are built by combining basic building blocks. Examples of filters available for [MedicalDevice] are AllDevicesFilter and DevicesByIdsFilter. This method returns the list of the ids of the users matching the filter.
  ///
  /// Parameters:
  ///
  /// * [Filter] filter (required):
  ///   The Filter object that describes which condition(s) the elements whose the ids should be returned must fulfill
  Future<List<String>?> matchMedicalDevices(Filter filter,);
}
