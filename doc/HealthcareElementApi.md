# openapi.api.HealthcareElementApi

## Load the API package
```dart
import 'package:icure_medical_device_dart_sdk/api.dart';
```

All URIs are relative to *http://127.0.0.1:8912*

Method | HTTP request | Description
------------- | ------------- | -------------
[**createOrModifyHealthcareElement**](HealthcareElementApi.md#createormodifyhealthcareelement)  | Create a Healthcare Element
[**createOrModifyHealthcareElements**](HealthcareElementApi.md#createormodifyhealthcareelements)  | Create a Healthcare Element
[**deleteHealthcareElement**](HealthcareElementApi.md#deletehealthcareelement) | Delete a Healthcare Element
[**filterHealthcareElement**](HealthcareElementApi.md#filterhealthcareelement) | Find Healthcare Elements using a filter
[**getHealthcareElement**](HealthcareElementApi.md#gethealthcareelement) | Get a Healthcare Element
[**matchHealthcareElement**](HealthcareElementApi.md#matchhealthcareelement) | Find Healthcare Elements using a filter


# **createOrModifyHealthcareElement**
> HealthcareElement createOrModifyHealthcareElement(healthcareElement)

Create a Healthcare Element

### Example
```dart
import 'package:icure_medical_device_dart_sdk/api.dart';

final api = MedTechApiBuilder()
    .withICureBasePath('https://kraken.icure.dev')
    .withUserName('user')
    .withPassword('password')
    .addKeyPair('id', private_key)
.build();

final healthcare_element_api = api.healthcareElementApi;
final healthcareElement = HealthcareElement(); // HealthcareElement |

try {
    final result = api_instance.createOrModifyHealthcareElement(healthcareElement);
    print(result);
} catch (e) {
    print('Exception when calling HealthcareElementApi->createOrModifyHealthcareElement: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **healthcareElement** | [**HealthcareElement**](HealthcareElement.md)|  |

### Return type

[**HealthcareElement**](HealthcareElement.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json, application/xml
 - **Accept**: */*

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **createOrModifyHealthcareElements**
> List<HealthcareElement> createOrModifyHealthcareElements(healthcareElement)

Create a Healthcare Element

### Example
```dart
import 'package:icure_medical_device_dart_sdk/api.dart';

final api = MedTechApiBuilder()
    .withICureBasePath('https://kraken.icure.dev')
    .withUserName('user')
    .withPassword('password')
    .addKeyPair('id', private_key)
.build();

final healthcare_element_api = api.healthcareElementApi;
final healthcareElement = [List<HealthcareElement>()]; // List<HealthcareElement> |

try {
    final result = api_instance.createOrModifyHealthcareElements(healthcareElement);
    print(result);
} catch (e) {
    print('Exception when calling HealthcareElementApi->createOrModifyHealthcareElements: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **healthcareElement** | [**List<HealthcareElement>**](HealthcareElement.md)|  |

### Return type

[**List<HealthcareElement>**](HealthcareElement.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json, application/xml
 - **Accept**: */*

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **deleteHealthcareElement**
> String deleteHealthcareElement(id)

Delete a Healthcare Element

### Example
```dart
import 'package:icure_medical_device_dart_sdk/api.dart';

final api = MedTechApiBuilder()
    .withICureBasePath('https://kraken.icure.dev')
    .withUserName('user')
    .withPassword('password')
    .addKeyPair('id', private_key)
.build();

final healthcare_element_api = api.healthcareElementApi;
final id = id_example; // String |

try {
    final result = api_instance.deleteHealthcareElement(id);
    print(result);
} catch (e) {
    print('Exception when calling HealthcareElementApi->deleteHealthcareElement: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **String**|  |

### Return type

**String**

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: */*

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **filterHealthcareElement**
> PaginatedListHealthcareElement filterHealthcareElement(filter)

Find Healthcare Elements using a filter

### Example
```dart
import 'package:icure_medical_device_dart_sdk/api.dart';

final api = MedTechApiBuilder()
    .withICureBasePath('https://kraken.icure.dev')
    .withUserName('user')
    .withPassword('password')
    .addKeyPair('id', private_key)
.build();

final healthcare_element_api = api.healthcareElementApi;
final filter = Filter(); // Filter |

try {
    final result = api_instance.filterHealthcareElement(filter);
    print(result);
} catch (e) {
    print('Exception when calling HealthcareElementApi->filterHealthcareElement: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **filter** | [**Filter**](Filter.md)|  |

### Return type

[**PaginatedListHealthcareElement**](PaginatedListHealthcareElement.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json, application/xml
 - **Accept**: */*

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getHealthcareElement**
> HealthcareElement getHealthcareElement(id)

Get a Healthcare Element

### Example
```dart
import 'package:icure_medical_device_dart_sdk/api.dart';

final api = MedTechApiBuilder()
    .withICureBasePath('https://kraken.icure.dev')
    .withUserName('user')
    .withPassword('password')
    .addKeyPair('id', private_key)
.build();

final healthcare_element_api = api.healthcareElementApi;
final id = id_example; // String |

try {
    final result = api_instance.getHealthcareElement(id);
    print(result);
} catch (e) {
    print('Exception when calling HealthcareElementApi->getHealthcareElement: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **String**|  |

### Return type

[**HealthcareElement**](HealthcareElement.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: */*

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **matchHealthcareElement**
> List<String> matchHealthcareElement(filter)

Find Healthcare Elements using a filter

### Example
```dart
import 'package:icure_medical_device_dart_sdk/api.dart';

final api = MedTechApiBuilder()
    .withICureBasePath('https://kraken.icure.dev')
    .withUserName('user')
    .withPassword('password')
    .addKeyPair('id', private_key)
.build();

final healthcare_element_api = api.healthcareElementApi;
final filter = Filter(); // Filter |

try {
    final result = api_instance.matchHealthcareElement(filter);
    print(result);
} catch (e) {
    print('Exception when calling HealthcareElementApi->matchHealthcareElement: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **filter** | [**Filter**](Filter.md)|  |

### Return type

**List<String>**

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json, application/xml
 - **Accept**: */*

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)
