# openapi.api.PatientApi

## Load the API package
```dart
import 'package:icure_medical_device_dart_sdk/api.dart';
```

All URIs are relative to *http://127.0.0.1:8912*

Method | HTTP request | Description
------------- | ------------- | -------------
[**createOrModifyPatient**](PatientApi.md#createormodifypatient) | Create or update a [Patient]
[**deletePatient**](PatientApi.md#deletepatient) | Delete a [Patient]
[**filterPatients**](PatientApi.md#filterpatients) | Load patients from the database by filtering them using the provided [filter].
[**getPatient**](PatientApi.md#getpatient) | Get a [Patient]
[**matchPatients**](PatientApi.md#matchpatients) | Load patient ids from the database by filtering them using the provided [filter].


# **createOrModifyPatient**
> Patient createOrModifyPatient(patient)

Create or update a [Patient]

When modifying a patient, you must ensure that the rev obtained when getting or creating the patient is present as the rev is used to guarantee that the patient has not been modified by a third party.

### Example
```dart
import 'package:icure_medical_device_dart_sdk/api.dart';

final api = MedTechApiBuilder()
    .withICureBasePath('https://kraken.icure.dev')
    .withUserName('user')
    .withPassword('password')
    .addKeyPair('id', private_key)
    .build();

final patient_api = api.patientApi;
final patient = Patient(); // Patient | 

try {
    final result = patient_api.createOrModifyPatient(patient);
    print(result);
} catch (e) {
    print('Exception when calling PatientApi->createOrModifyPatient: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **patient** | [**Patient**](Patient.md)|  | 

### Return type

[**Patient**](Patient.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json, application/xml
 - **Accept**: */*

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **deletePatient**
> String deletePatient(patientId)

Delete a [Patient]

Deletes the patient identified by the provided unique [patientId].

### Example
```dart
import 'package:icure_medical_device_dart_sdk/api.dart';

final api = MedTechApiBuilder()
    .withICureBasePath('https://kraken.icure.dev')
    .withUserName('user')
    .withPassword('password')
    .addKeyPair('id', private_key)
    .build();

final patient_api = api.patientApi;
final patientId = patientId_example; // String | 

try {
    final result = patient_api.deletePatient(patientId);
    print(result);
} catch (e) {
    print('Exception when calling PatientApi->deletePatient: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **patientId** | **String**|  | 

### Return type

**String**

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: */*

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **filterPatients**
> PaginatedListPatient filterPatients(filter, nextPatientId, limit)

Load patients from the database by filtering them using the provided [filter].

Filters are complex selectors that are built by combining basic building blocks. Examples of filters available for [Patient] are AllPatientsFilter and PatientsByIdsFilter. This method returns a paginated list of patient (with a cursor that lets you query the following items).

### Example
```dart
import 'package:icure_medical_device_dart_sdk/api.dart';

final api = MedTechApiBuilder()
    .withICureBasePath('https://kraken.icure.dev')
    .withUserName('user')
    .withPassword('password')
    .addKeyPair('id', private_key)
    .build();

final patient_api = api.patientApi;
final filter = Filter(); // Filter | The Filter object that describes which condition(s) the elements whose the ids should be returned must fulfill
final nextPatientId = nextPatientId_example; // String | The id of the first patient in the next page
final limit = 56; // int | The number of patients to return in the queried page

try {
    final result = patient_api.filterPatients(filter, nextPatientId, limit);
    print(result);
} catch (e) {
    print('Exception when calling PatientApi->filterPatients: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **filter** | [**Filter**](Filter.md)| The Filter object that describes which condition(s) the elements whose the ids should be returned must fulfill | 
 **nextPatientId** | **String**| The id of the first patient in the next page | [optional] 
 **limit** | **int**| The number of patients to return in the queried page | [optional] 

### Return type

[**PaginatedListPatient**](PaginatedListPatient.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json, application/xml
 - **Accept**: */*

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getPatient**
> Patient getPatient(patientId)

Get a [Patient]

Each patient is uniquely identified by a patient id. The patient id is a UUID. This [patientId] is the preferred method to retrieve one specific patient.

### Example
```dart
import 'package:icure_medical_device_dart_sdk/api.dart';

final api = MedTechApiBuilder()
    .withICureBasePath('https://kraken.icure.dev')
    .withUserName('user')
    .withPassword('password')
    .addKeyPair('id', private_key)
    .build();

final patient_api = api.patientApi;
final patientId = patientId_example; // String | 

try {
    final result = patient_api.getPatient(patientId);
    print(result);
} catch (e) {
    print('Exception when calling PatientApi->getPatient: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **patientId** | **String**|  | 

### Return type

[**Patient**](Patient.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: */*

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **matchPatients**
> List<String> matchPatients(filter)

Load patient ids from the database by filtering them using the provided [filter].

Filters are complex selectors that are built by combining basic building blocks. Examples of filters available for [Patient] are AllPatientsFilter and PatientsByIdsFilter. This method returns the list of the ids of the users matching the [filter].

### Example
```dart
import 'package:icure_medical_device_dart_sdk/api.dart';

final api = MedTechApiBuilder()
    .withICureBasePath('https://kraken.icure.dev')
    .withUserName('user')
    .withPassword('password')
    .addKeyPair('id', private_key)
    .build();

final patient_api = api.patientApi;
final filter = Filter(); // Filter | The Filter object that describes which condition(s) the elements whose the ids should be returned must fulfill

try {
    final result = patient_api.matchPatients(filter);
    print(result);
} catch (e) {
    print('Exception when calling PatientApi->matchPatients: $e\n');
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

