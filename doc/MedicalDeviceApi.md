# openapi.api.MedicalDeviceApi

## Load the API package
```dart
import 'package:openapi/api.dart';
```

All URIs are relative to *http://127.0.0.1:8912*

Method | HTTP request | Description
------------- | ------------- | -------------
[**createOrModifyMedicalDevice**](MedicalDeviceApi.md#createormodifymedicaldevice) | **PUT** /rest/v2/medical/device | Create or update a [MedicalDevice]
[**createOrModifyMedicalDevices**](MedicalDeviceApi.md#createormodifymedicaldevices) | **PUT** /rest/v2/medical/device/batch | Create or update a batch of [MedicalDevice]
[**deleteMedicalDevice**](MedicalDeviceApi.md#deletemedicaldevice) | **DELETE** /rest/v2/medical/device/{medicalDeviceId} | Delete a [MedicalDevice]
[**deleteMedicalDevices**](MedicalDeviceApi.md#deletemedicaldevices) | **POST** /rest/v2/medical/device/batch | Delete a batch of [MedicalDevice]
[**filterMedicalDevices**](MedicalDeviceApi.md#filtermedicaldevices) | **POST** /rest/v2/medical/device/filter | Load devices from the database by filtering them using the provided [filter].
[**getMedicalDevice**](MedicalDeviceApi.md#getmedicaldevice) | **GET** /rest/v2/medical/device/{medicalDeviceId} | Get a Medical Device
[**matchMedicalDevices**](MedicalDeviceApi.md#matchmedicaldevices) | **POST** /rest/v2/medical/device/match | Load medical device ids from the database by filtering them using the provided Filter.


# **createOrModifyMedicalDevice**
> MedicalDevice createOrModifyMedicalDevice(medicalDevice)

Create or update a [MedicalDevice]

When modifying a device, you must ensure that the rev obtained when getting or creating the device is present as the rev is used to guarantee that the device has not been modified by a third party.

### Example
```dart
import 'package:openapi/api.dart';

final api_instance = MedicalDeviceApi();
final medicalDevice = MedicalDevice(); // MedicalDevice | 

try {
    final result = api_instance.createOrModifyMedicalDevice(medicalDevice);
    print(result);
} catch (e) {
    print('Exception when calling MedicalDeviceApi->createOrModifyMedicalDevice: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **medicalDevice** | [**MedicalDevice**](MedicalDevice.md)|  | 

### Return type

[**MedicalDevice**](MedicalDevice.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json, application/xml
 - **Accept**: */*

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **createOrModifyMedicalDevices**
> List<MedicalDevice> createOrModifyMedicalDevices(medicalDevice)

Create or update a batch of [MedicalDevice]

When modifying a device, you must ensure that the rev obtained when getting or creating the device is present as the rev is used to guarantee that the device has not been modified by a third party.

### Example
```dart
import 'package:openapi/api.dart';

final api_instance = MedicalDeviceApi();
final medicalDevice = [List<MedicalDevice>()]; // List<MedicalDevice> | 

try {
    final result = api_instance.createOrModifyMedicalDevices(medicalDevice);
    print(result);
} catch (e) {
    print('Exception when calling MedicalDeviceApi->createOrModifyMedicalDevices: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **medicalDevice** | [**List<MedicalDevice>**](MedicalDevice.md)|  | 

### Return type

[**List<MedicalDevice>**](MedicalDevice.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json, application/xml
 - **Accept**: */*

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **deleteMedicalDevice**
> String deleteMedicalDevice(medicalDeviceId)

Delete a [MedicalDevice]

Deletes the medical device identified by the provided unique [medicalDeviceId].

### Example
```dart
import 'package:openapi/api.dart';

final api_instance = MedicalDeviceApi();
final medicalDeviceId = medicalDeviceId_example; // String | 

try {
    final result = api_instance.deleteMedicalDevice(medicalDeviceId);
    print(result);
} catch (e) {
    print('Exception when calling MedicalDeviceApi->deleteMedicalDevice: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **medicalDeviceId** | **String**|  | 

### Return type

**String**

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: */*

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **deleteMedicalDevices**
> List<String> deleteMedicalDevices(requestBody)

Delete a batch of [MedicalDevice]

Deletes the batch of medical device identified by the provided [medicalDeviceIds].

### Example
```dart
import 'package:openapi/api.dart';

final api_instance = MedicalDeviceApi();
final requestBody = [List<String>()]; // List<String> | 

try {
    final result = api_instance.deleteMedicalDevices(requestBody);
    print(result);
} catch (e) {
    print('Exception when calling MedicalDeviceApi->deleteMedicalDevices: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **requestBody** | [**List<String>**](String.md)|  | 

### Return type

**List<String>**

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json, application/xml
 - **Accept**: */*

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **filterMedicalDevices**
> PaginatedListMedicalDevice filterMedicalDevices(filter, nextDeviceId, limit)

Load devices from the database by filtering them using the provided [filter].

Filters are complex selectors that are built by combining basic building blocks. Examples of filters available for [MedicalDevice] are AllDevicesFilter and DevicesByIdsFilter. This method returns a paginated list of medical devices (with a cursor that lets you query the following items).

### Example
```dart
import 'package:openapi/api.dart';

final api_instance = MedicalDeviceApi();
final filter = Filter(); // Filter | The Filter object that describes which condition(s) the elements whose the ids should be returned must fulfill
final nextDeviceId = nextDeviceId_example; // String | The id of the first device in the next page
final limit = 56; // int | The number of devices to return in the queried page

try {
    final result = api_instance.filterMedicalDevices(filter, nextDeviceId, limit);
    print(result);
} catch (e) {
    print('Exception when calling MedicalDeviceApi->filterMedicalDevices: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **filter** | [**Filter**](Filter.md)| The Filter object that describes which condition(s) the elements whose the ids should be returned must fulfill | 
 **nextDeviceId** | **String**| The id of the first device in the next page | [optional] 
 **limit** | **int**| The number of devices to return in the queried page | [optional] 

### Return type

[**PaginatedListMedicalDevice**](PaginatedListMedicalDevice.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json, application/xml
 - **Accept**: */*

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getMedicalDevice**
> MedicalDevice getMedicalDevice(medicalDeviceId)

Get a Medical Device

Each medical device is uniquely identified by a device id. The device id is a UUID. This [medicalDeviceId] is the preferred method to retrieve one specific device.

### Example
```dart
import 'package:openapi/api.dart';

final api_instance = MedicalDeviceApi();
final medicalDeviceId = medicalDeviceId_example; // String | 

try {
    final result = api_instance.getMedicalDevice(medicalDeviceId);
    print(result);
} catch (e) {
    print('Exception when calling MedicalDeviceApi->getMedicalDevice: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **medicalDeviceId** | **String**|  | 

### Return type

[**MedicalDevice**](MedicalDevice.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: */*

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **matchMedicalDevices**
> List<String> matchMedicalDevices(filter)

Load medical device ids from the database by filtering them using the provided Filter.

Filters are complex selectors that are built by combining basic building blocks. Examples of filters available for [MedicalDevice] are AllDevicesFilter and DevicesByIdsFilter. This method returns the list of the ids of the users matching the filter.

### Example
```dart
import 'package:openapi/api.dart';

final api_instance = MedicalDeviceApi();
final filter = Filter(); // Filter | The Filter object that describes which condition(s) the elements whose the ids should be returned must fulfill

try {
    final result = api_instance.matchMedicalDevices(filter);
    print(result);
} catch (e) {
    print('Exception when calling MedicalDeviceApi->matchMedicalDevices: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **filter** | [**Filter**](Filter.md)| The Filter object that describes which condition(s) the elements whose the ids should be returned must fulfill | 

### Return type

**List<String>**

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json, application/xml
 - **Accept**: */*

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

