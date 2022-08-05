# openapi.api.CodingApi

## Load the API package
```dart
import 'package:icure_medical_device_dart_sdk/api.dart';
```

All URIs are relative to *http://127.0.0.1:8912*

Method | Description
------------- | -------------
[**createOrModifyCoding**](CodingApi.md#createormodifycoding) | Create or update a [Coding]
[**createOrModifyCodings**](CodingApi.md#createormodifycodings) | Create or update a batch of [Coding]
[**filterCoding**](CodingApi.md#filtercoding) | Load codings from the database by filtering them using the provided [filter].
[**getCoding**](CodingApi.md#getcoding) | Get a [Coding]
[**matchCoding**](CodingApi.md#matchcoding) | Load coding ids from the database by filtering them using the provided [filter].


# **createOrModifyCoding**
> Coding createOrModifyCoding(coding)

Create or update a [Coding]

When modifying a coding, you must ensure that the rev obtained when getting or creating the coding is present as the rev is used to guarantee that the coding has not been modified by a third party.

### Example
```dart
import 'package:icure_medical_device_dart_sdk/api.dart';

final api = MedTechApiBuilder()
    .withICureBasePath('https://kraken.icure.dev')
    .withUserName('user')
    .withPassword('password')
    .addKeyPair('id', private_key)
.build();

final coding_api = api.codingApi;
final coding = Coding(); // Coding |

try {
    final result = coding_api.createOrModifyCoding(coding);
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
import 'package:icure_medical_device_dart_sdk/api.dart';

final coding_api = CodingApi();
final coding = [List<Coding>()]; // List<Coding> |

try {
    final result = coding_api.createOrModifyCodings(coding);
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
import 'package:icure_medical_device_dart_sdk/api.dart';

final api = MedTechApiBuilder()
    .withICureBasePath('https://kraken.icure.dev')
    .withUserName('user')
    .withPassword('password')
    .addKeyPair('id', private_key)
.build();

final coding_api = api.codingApi;
final filter = Filter(); // Filter | The Filter object that describes which condition(s) the elements whose the ids should be returned must fulfill
final nextCodingId = nextCodingId_example; // String | The id of the first coding in the next page
final limit = 56; // int | The number of codings to return in the queried page

try {
    final result = coding_api.filterCoding(filter, nextCodingId, limit);
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
import 'package:icure_medical_device_dart_sdk/api.dart';

final api = MedTechApiBuilder()
    .withICureBasePath('https://kraken.icure.dev')
    .withUserName('user')
    .withPassword('password')
    .addKeyPair('id', private_key)
.build();

final coding_api = api.codingApi;
final codingId = codingId_example; // String |

try {
    final result = coding_api.getCoding(codingId);
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
import 'package:icure_medical_device_dart_sdk/api.dart';

final api = MedTechApiBuilder()
    .withICureBasePath('https://kraken.icure.dev')
    .withUserName('user')
    .withPassword('password')
    .addKeyPair('id', private_key)
.build();

final coding_api = api.codingApi;
final filter = Filter(); // Filter | The Filter object that describes which condition(s) the elements whose the ids should be returned must fulfill

try {
    final result = coding_api.matchCoding(filter);
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

The authorization is embedded in the api instance.

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)
