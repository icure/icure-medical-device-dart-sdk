# openapi.api.CodingApi

## Load the API package
```dart
import 'package:openapi/api.dart';
```

All URIs are relative to *http://127.0.0.1:8912*

Method | HTTP request | Description
------------- | ------------- | -------------
[**createOrModifyCoding**](CodingApi.md#createormodifycoding) | **PUT** /rest/v2/coding | Create or update a [Coding]
[**createOrModifyCodings**](CodingApi.md#createormodifycodings) | **PUT** /rest/v2/coding/batch | Create or update a batch of [Coding]
[**filterCoding**](CodingApi.md#filtercoding) | **POST** /rest/v2/coding/filter | Load codings from the database by filtering them using the provided [filter].
[**getCoding**](CodingApi.md#getcoding) | **GET** /rest/v2/coding/{codingId} | Get a [Coding]
[**matchCoding**](CodingApi.md#matchcoding) | **POST** /rest/v2/coding/match | Load coding ids from the database by filtering them using the provided [filter].


# **createOrModifyCoding**
> Coding createOrModifyCoding(coding)

Create or update a [Coding]

When modifying a coding, you must ensure that the rev obtained when getting or creating the coding is present as the rev is used to guarantee that the coding has not been modified by a third party.

### Example
```dart
import 'package:openapi/api.dart';

final api_instance = CodingApi();
final coding = Coding(); // Coding | 

try {
    final result = api_instance.createOrModifyCoding(coding);
    print(result);
} catch (e) {
    print('Exception when calling CodingApi->createOrModifyCoding: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **coding** | [**Coding**](Coding.md)|  | 

### Return type

[**Coding**](Coding.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json, application/xml
 - **Accept**: */*

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **createOrModifyCodings**
> List<Coding> createOrModifyCodings(coding)

Create or update a batch of [Coding]

When modifying codings, you must ensure that the rev obtained when getting or creating the coding is present as the rev is used to guarantee that the coding has not been modified by a third party.

### Example
```dart
import 'package:openapi/api.dart';

final api_instance = CodingApi();
final coding = [List<Coding>()]; // List<Coding> | 

try {
    final result = api_instance.createOrModifyCodings(coding);
    print(result);
} catch (e) {
    print('Exception when calling CodingApi->createOrModifyCodings: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **coding** | [**List<Coding>**](Coding.md)|  | 

### Return type

[**List<Coding>**](Coding.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json, application/xml
 - **Accept**: */*

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **filterCoding**
> PaginatedListCoding filterCoding(filter, nextCodingId, limit)

Load codings from the database by filtering them using the provided [filter].

Filters are complex selectors that are built by combining basic building blocks. Examples of filters available for [Coding] are AllCodingsFilter and CodingsByIdsFilter. This method returns a paginated list of coding (with a cursor that lets you query the following items).

### Example
```dart
import 'package:openapi/api.dart';

final api_instance = CodingApi();
final filter = Filter(); // Filter | The Filter object that describes which condition(s) the elements whose the ids should be returned must fulfill
final nextCodingId = nextCodingId_example; // String | The id of the first coding in the next page
final limit = 56; // int | The number of codings to return in the queried page

try {
    final result = api_instance.filterCoding(filter, nextCodingId, limit);
    print(result);
} catch (e) {
    print('Exception when calling CodingApi->filterCoding: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **filter** | [**Filter**](Filter.md)| The Filter object that describes which condition(s) the elements whose the ids should be returned must fulfill | 
 **nextCodingId** | **String**| The id of the first coding in the next page | [optional] 
 **limit** | **int**| The number of codings to return in the queried page | [optional] 

### Return type

[**PaginatedListCoding**](PaginatedListCoding.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json, application/xml
 - **Accept**: */*

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getCoding**
> Coding getCoding(codingId)

Get a [Coding]

Each coding is uniquely identified by a coding id. The coding id is a UUID. This [codingId] is the preferred method to retrieve one specific coding.

### Example
```dart
import 'package:openapi/api.dart';

final api_instance = CodingApi();
final codingId = codingId_example; // String | 

try {
    final result = api_instance.getCoding(codingId);
    print(result);
} catch (e) {
    print('Exception when calling CodingApi->getCoding: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **codingId** | **String**|  | 

### Return type

[**Coding**](Coding.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: */*

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **matchCoding**
> List<String> matchCoding(filter)

Load coding ids from the database by filtering them using the provided [filter].

Filters are complex selectors that are built by combining basic building blocks. Examples of filters available for [Coding] are AllCodingsFilter and CodingsByIdsFilter. This method returns a paginated list of coding (with a cursor that lets you query the following items).

### Example
```dart
import 'package:openapi/api.dart';

final api_instance = CodingApi();
final filter = Filter(); // Filter | The Filter object that describes which condition(s) the elements whose the ids should be returned must fulfill

try {
    final result = api_instance.matchCoding(filter);
    print(result);
} catch (e) {
    print('Exception when calling CodingApi->matchCoding: $e\n');
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

