# openapi.api.HealthcareProfessionalApi

## Load the API package
```dart
import 'package:openapi/api.dart';
```

All URIs are relative to *http://127.0.0.1:8912*

Method | HTTP request | Description
------------- | ------------- | -------------
[**createOrModifyHealthcareProfessional**](HealthcareProfessionalApi.md#createormodifyhealthcareprofessional) | **PUT** /rest/v2/healthcareprofessional | Create a newhealthcare professional or modify an existing one.
[**deleteHealthcareProfessional**](HealthcareProfessionalApi.md#deletehealthcareprofessional) | **DELETE** /rest/v2/healthcareprofessional/{hcpId} | Delete an existing healthcare professional.
[**filterHealthcareProfessionalBy**](HealthcareProfessionalApi.md#filterhealthcareprofessionalby) | **POST** /rest/v2/healthcareprofessional/filter | Load healthcare professionals from the database by filtering them using the provided Filter.
[**getHealthcareProfessional**](HealthcareProfessionalApi.md#gethealthcareprofessional) | **GET** /rest/v2/healthcareprofessional/{hcpId} | Get a Healthcare professional by id.
[**matchHealthcareProfessionalBy**](HealthcareProfessionalApi.md#matchhealthcareprofessionalby) | **POST** /rest/v2/healthcareprofessional/match | Loadhealthcare professional ids from the database by filtering them using the provided Filter.


# **createOrModifyHealthcareProfessional**
> HealthcareProfessional createOrModifyHealthcareProfessional(healthcareProfessional)

Create a newhealthcare professional or modify an existing one.

Ahealthcare professional must have a login, an email or a mobilePhone defined, ahealthcare professional should be linked to either a Healthcare Professional, a Patient or a Device. When modifying an healthcare professional, you must ensure that the rev obtained when getting or creating thehealthcare professional is present as the rev is used to guarantee that thehealthcare professional has not been modified by a third party.

### Example
```dart
import 'package:openapi/api.dart';

final api_instance = HealthcareProfessionalApi();
final healthcareProfessional = HealthcareProfessional(); // HealthcareProfessional | Thehealthcare professional that must be created in the database.

try {
    final result = api_instance.createOrModifyHealthcareProfessional(healthcareProfessional);
    print(result);
} catch (e) {
    print('Exception when calling HealthcareProfessionalApi->createOrModifyHealthcareProfessional: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **healthcareProfessional** | [**HealthcareProfessional**](HealthcareProfessional.md)| Thehealthcare professional that must be created in the database. | 

### Return type

[**HealthcareProfessional**](HealthcareProfessional.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json, application/xml
 - **Accept**: */*

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **deleteHealthcareProfessional**
> String deleteHealthcareProfessional(hcpId)

Delete an existing healthcare professional.

Deletes thehealthcare professional identified by the provided unique hcpId.

### Example
```dart
import 'package:openapi/api.dart';

final api_instance = HealthcareProfessionalApi();
final hcpId = hcpId_example; // String | The UUID that uniquely identifies thehealthcare professional to be deleted.

try {
    final result = api_instance.deleteHealthcareProfessional(hcpId);
    print(result);
} catch (e) {
    print('Exception when calling HealthcareProfessionalApi->deleteHealthcareProfessional: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **hcpId** | **String**| The UUID that uniquely identifies thehealthcare professional to be deleted. | 

### Return type

**String**

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: */*

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **filterHealthcareProfessionalBy**
> PaginatedListHealthcareProfessional filterHealthcareProfessionalBy(filter, nextHcpId, limit)

Load healthcare professionals from the database by filtering them using the provided Filter.

Filters are complex selectors that are built by combining basic building blocks. Examples of filters available for Healthcare professionals are AllHealthcareProfessionalsFilter and HealthcarProfessionalsByIdsFilter. This method returns a paginated list of healthcare professionals (with a cursor that lets you query the following items).

### Example
```dart
import 'package:openapi/api.dart';

final api_instance = HealthcareProfessionalApi();
final filter = Filter(); // Filter | The Filter object that describes which condition(s) the elements whose the ids should be returned must fulfill
final nextHcpId = nextHcpId_example; // String | The id of the first Healthcare professional in the next page
final limit = 56; // int | The number of healthcare professionals to return in the queried page

try {
    final result = api_instance.filterHealthcareProfessionalBy(filter, nextHcpId, limit);
    print(result);
} catch (e) {
    print('Exception when calling HealthcareProfessionalApi->filterHealthcareProfessionalBy: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **filter** | [**Filter**](Filter.md)| The Filter object that describes which condition(s) the elements whose the ids should be returned must fulfill | 
 **nextHcpId** | **String**| The id of the first Healthcare professional in the next page | [optional] 
 **limit** | **int**| The number of healthcare professionals to return in the queried page | [optional] 

### Return type

[**PaginatedListHealthcareProfessional**](PaginatedListHealthcareProfessional.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json, application/xml
 - **Accept**: */*

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getHealthcareProfessional**
> HealthcareProfessional getHealthcareProfessional(hcpId)

Get a Healthcare professional by id.

Eachhealthcare professional is uniquely identified by ahealthcare professional id. Thehealthcare professional id is a UUID. This hcpId is the preferred method to retrieve one specific healthcare professional.

### Example
```dart
import 'package:openapi/api.dart';

final api_instance = HealthcareProfessionalApi();
final hcpId = hcpId_example; // String | The UUID that identifies thehealthcare professional uniquely

try {
    final result = api_instance.getHealthcareProfessional(hcpId);
    print(result);
} catch (e) {
    print('Exception when calling HealthcareProfessionalApi->getHealthcareProfessional: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **hcpId** | **String**| The UUID that identifies thehealthcare professional uniquely | 

### Return type

[**HealthcareProfessional**](HealthcareProfessional.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: */*

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **matchHealthcareProfessionalBy**
> List<String> matchHealthcareProfessionalBy(filter)

Loadhealthcare professional ids from the database by filtering them using the provided Filter.

Filters are complex selectors that are built by combining basic building blocks. Examples of filters available for Healthcare professionals are AllHealthcare professionalsFilter and Healthcare professionalsByIdsFilter. This method returns the list of the ids of the healthcare professionals matching the filter.

### Example
```dart
import 'package:openapi/api.dart';

final api_instance = HealthcareProfessionalApi();
final filter = Filter(); // Filter | The Filter object that describes which condition(s) the elements whose the ids should be returned must fulfill

try {
    final result = api_instance.matchHealthcareProfessionalBy(filter);
    print(result);
} catch (e) {
    print('Exception when calling HealthcareProfessionalApi->matchHealthcareProfessionalBy: $e\n');
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

