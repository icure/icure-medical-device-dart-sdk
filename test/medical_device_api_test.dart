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


/// tests for MedicalDeviceApi
void main() {
  // final instance = MedicalDeviceApi();

  group('tests for MedicalDeviceApi', () {
    // Create or update a [MedicalDevice]
    //
    // When modifying a device, you must ensure that the rev obtained when getting or creating the device is present as the rev is used to guarantee that the device has not been modified by a third party.
    //
    //Future<MedicalDevice> createOrModifyMedicalDevice(MedicalDevice medicalDevice) async
    test('test createOrModifyMedicalDevice', () async {
      // TODO
    });

    // Create or update a batch of [MedicalDevice]
    //
    // When modifying a device, you must ensure that the rev obtained when getting or creating the device is present as the rev is used to guarantee that the device has not been modified by a third party.
    //
    //Future<List<MedicalDevice>> createOrModifyMedicalDevices(List<MedicalDevice> medicalDevice) async
    test('test createOrModifyMedicalDevices', () async {
      // TODO
    });

    // Delete a [MedicalDevice]
    //
    // Deletes the medical device identified by the provided unique [medicalDeviceId].
    //
    //Future<String> deleteMedicalDevice(String medicalDeviceId) async
    test('test deleteMedicalDevice', () async {
      // TODO
    });

    // Delete a batch of [MedicalDevice]
    //
    // Deletes the batch of medical device identified by the provided [medicalDeviceIds].
    //
    //Future<List<String>> deleteMedicalDevices(List<String> requestBody) async
    test('test deleteMedicalDevices', () async {
      // TODO
    });

    // Load devices from the database by filtering them using the provided [filter].
    //
    // Filters are complex selectors that are built by combining basic building blocks. Examples of filters available for [MedicalDevice] are AllDevicesFilter and DevicesByIdsFilter. This method returns a paginated list of medical devices (with a cursor that lets you query the following items).
    //
    //Future<PaginatedListMedicalDevice> filterMedicalDevices(Filter filter, { String nextDeviceId, int limit }) async
    test('test filterMedicalDevices', () async {
      // TODO
    });

    // Get a Medical Device
    //
    // Each medical device is uniquely identified by a device id. The device id is a UUID. This [medicalDeviceId] is the preferred method to retrieve one specific device.
    //
    //Future<MedicalDevice> getMedicalDevice(String medicalDeviceId) async
    test('test getMedicalDevice', () async {
      // TODO
    });

    // Load medical device ids from the database by filtering them using the provided Filter.
    //
    // Filters are complex selectors that are built by combining basic building blocks. Examples of filters available for [MedicalDevice] are AllDevicesFilter and DevicesByIdsFilter. This method returns the list of the ids of the users matching the filter.
    //
    //Future<List<String>> matchMedicalDevices(Filter filter) async
    test('test matchMedicalDevices', () async {
      // TODO
    });

  });
}
