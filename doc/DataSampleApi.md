# openapi.api.DataSampleApi

## Load the API package
```dart
import 'package:icure_medical_device_dart_sdk/api.dart';
```

All URIs are relative to *http://127.0.0.1:8912*

Method | Description
------------- | -------------
[**createOrModifyDataSampleFor**](DataSampleApi.md#createormodifydatasamplefor) | Create or update a [DataSample] for a patient
[**createOrModifyDataSamplesFor**](DataSampleApi.md#createormodifydatasamplesfor) | Create or update a batch of [DataSample] for a patient
[**deleteAttachment**](DataSampleApi.md#deleteattachment) | Delete an attachment of a DataSample
[**deleteDataSample**](DataSampleApi.md#deletedatasample) | Delete a [DataSample] by its id
[**deleteDataSamples**](DataSampleApi.md#deletedatasamples) | Delete a batch of [Data Samples]
[**filterDataSample**](DataSampleApi.md#filterdatasample) | Find data samples using the provided [filter].
[**getDataSample**](DataSampleApi.md#getdatasample) | Get a [DataSample] by its id
[**getDataSampleAttachmentContent**](DataSampleApi.md#getdatasampleattachmentcontent) | Get attachment content of a DataSample
[**getDataSampleAttachmentDocument**](DataSampleApi.md#getdatasampleattachmentdocument) | Get document metadata of a DataSample attachment
[**matchDataSample**](DataSampleApi.md#matchdatasample) | Find data samples ids using the provided Filter.
[**setDataSampleAttachment**](DataSampleApi.md#setdatasampleattachment) | Add or update the attachment of a DataSample


# **createOrModifyDataSampleFor**
> DataSample createOrModifyDataSampleFor(patientId, dataSample)

Create or update a [DataSample] for a patient

When modifying a data sample, you can't update the patient of it : For this, you need to delete the faulty data sample and create a new one. When modifying the data sample, you also need to keep the same batchId : It is not possible to change the batch of a data sample.

### Example
```dart
import 'package:icure_medical_device_dart_sdk/api.dart';

final api = MedTechApiBuilder()
    .withICureBasePath('https://kraken.icure.dev')
    .withUserName('user')
    .withPassword('password')
    .addKeyPair('id', private_key)
.build();

final data_sample_api = api.dataSampleApi;
final patientId = patientId_example; // String |
final dataSample = DataSample(); // DataSample |

try {
    final result = data_sample_api.createOrModifyDataSampleFor(patientId, dataSample);
    print(result);
} catch (e) {
    print('Exception when calling DataSampleApi->createOrModifyDataSampleFor: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **patientId** | **String**|  |
 **dataSample** | [**DataSample**](DataSample.md)|  |

### Return type

[**DataSample**](DataSample.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json, application/xml
 - **Accept**: */*

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **createOrModifyDataSamplesFor**
> List<DataSample> createOrModifyDataSamplesFor(patientId, dataSample)

Create or update a batch of [DataSample] for a patient

All the provided data samples will be created in the same batch. If you are trying to update some data samples, then those ones need to come from the same batch.                  When modifying a data sample, you can't update the patient of it : For this, you need to delete the faulty data sample and create a new one. When modifying the data sample, you also need to keep the same batchId : It is not possible to change the batch of a data sample.

### Example
```dart
import 'package:icure_medical_device_dart_sdk/api.dart';

final api = MedTechApiBuilder()
    .withICureBasePath('https://kraken.icure.dev')
    .withUserName('user')
    .withPassword('password')
    .addKeyPair('id', private_key)
.build();

final data_sample_api = api.dataSampleApi;
final patientId = patientId_example; // String |
final dataSample = [List<DataSample>()]; // List<DataSample> |

try {
    final result = data_sample_api.createOrModifyDataSamplesFor(patientId, dataSample);
    print(result);
} catch (e) {
    print('Exception when calling DataSampleApi->createOrModifyDataSamplesFor: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **patientId** | **String**|  |
 **dataSample** | [**List<DataSample>**](DataSample.md)|  |

### Return type

[**List<DataSample>**](DataSample.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json, application/xml
 - **Accept**: */*

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **deleteAttachment**
> String deleteAttachment(dataSampleId, documentId)

Delete an attachment of a DataSample

Deletes an attachment, using its corresponding documentId

### Example
```dart
import 'package:icure_medical_device_dart_sdk/api.dart';

final api = MedTechApiBuilder()
    .withICureBasePath('https://kraken.icure.dev')
    .withUserName('user')
    .withPassword('password')
    .addKeyPair('id', private_key)
.build();

final data_sample_api = api.dataSampleApi;
final dataSampleId = dataSampleId_example; // String |
final documentId = documentId_example; // String |

try {
    final result = data_sample_api.deleteAttachment(dataSampleId, documentId);
    print(result);
} catch (e) {
    print('Exception when calling DataSampleApi->deleteAttachment: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **dataSampleId** | **String**|  |
 **documentId** | **String**|  |

### Return type

**String**

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: */*

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **deleteDataSample**
> String deleteDataSample(dataSampleId)

Delete a [DataSample] by its id

Deletes the data sample identified by the provided unique [dataSampleId].

### Example
```dart
import 'package:icure_medical_device_dart_sdk/api.dart';

final api = MedTechApiBuilder()
    .withICureBasePath('https://kraken.icure.dev')
    .withUserName('user')
    .withPassword('password')
    .addKeyPair('id', private_key)
.build();

final data_sample_api = api.dataSampleApi;
final dataSampleId = dataSampleId_example; // String |

try {
    final result = data_sample_api.deleteDataSample(dataSampleId);
    print(result);
} catch (e) {
    print('Exception when calling DataSampleApi->deleteDataSample: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **dataSampleId** | **String**|  |

### Return type

**String**

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: */*

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **deleteDataSamples**
> List<String> deleteDataSamples(requestBody)

Delete a batch of [Data Samples]

Deletes the batch of data samples identified by the provided [dataSampleIds]. The data samples to delete need to be part of the same batch

### Example
```dart
import 'package:icure_medical_device_dart_sdk/api.dart';

final api = MedTechApiBuilder()
    .withICureBasePath('https://kraken.icure.dev')
    .withUserName('user')
    .withPassword('password')
    .addKeyPair('id', private_key)
.build();

final data_sample_api = api.dataSampleApi;
final requestBody = [List<String>()]; // List<String> |

try {
    final result = data_sample_api.deleteDataSamples(requestBody);
    print(result);
} catch (e) {
    print('Exception when calling DataSampleApi->deleteDataSamples: $e\n');
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

# **filterDataSample**
> PaginatedListDataSample filterDataSample(filter)

Find data samples using the provided [filter].

Filters are complex selectors that are built by combining basic building blocks. Examples of filters available for [DataSample] are AllDataSamplesFilter and DataSamplesByIdsFilter. This method returns a paginated list of data samples (with a cursor that lets you query the following items).

### Example
```dart
import 'package:icure_medical_device_dart_sdk/api.dart';

final api = MedTechApiBuilder()
    .withICureBasePath('https://kraken.icure.dev')
    .withUserName('user')
    .withPassword('password')
    .addKeyPair('id', private_key)
.build();

final data_sample_api = api.dataSampleApi;
final filter = Filter(); // Filter | The Filter object that describes which condition(s) the elements whose the ids should be returned must fulfill

try {
    final result = data_sample_api.filterDataSample(filter);
    print(result);
} catch (e) {
    print('Exception when calling DataSampleApi->filterDataSample: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **filter** | [**Filter**](Filter.md)| The Filter object that describes which condition(s) the elements whose the ids should be returned must fulfill |

### Return type

[**PaginatedListDataSample**](PaginatedListDataSample.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json, application/xml
 - **Accept**: */*

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getDataSample**
> DataSample getDataSample(dataSampleId)

Get a [DataSample] by its id

Each data sample is uniquely identified by a data sample id which is a UUID. This [dataSampleId] is the preferred method to retrieve one specific data sample.

### Example
```dart
import 'package:icure_medical_device_dart_sdk/api.dart';

final api = MedTechApiBuilder()
    .withICureBasePath('https://kraken.icure.dev')
    .withUserName('user')
    .withPassword('password')
    .addKeyPair('id', private_key)
.build();

final data_sample_api = api.dataSampleApi;
final dataSampleId = dataSampleId_example; // String |

try {
    final result = data_sample_api.getDataSample(dataSampleId);
    print(result);
} catch (e) {
    print('Exception when calling DataSampleApi->getDataSample: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **dataSampleId** | **String**|  |

### Return type

[**DataSample**](DataSample.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: */*

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getDataSampleAttachmentContent**
> MultipartFile getDataSampleAttachmentContent(dataSampleId, documentId, attachmentId)

Get attachment content of a DataSample

Data Samples may contain attachments such as prescriptions, reports, ... Use this method to get the content of an attachment

### Example
```dart
import 'package:icure_medical_device_dart_sdk/api.dart';

final api = MedTechApiBuilder()
    .withICureBasePath('https://kraken.icure.dev')
    .withUserName('user')
    .withPassword('password')
    .addKeyPair('id', private_key)
.build();

final data_sample_api = api.dataSampleApi;
final dataSampleId = dataSampleId_example; // String |
final documentId = documentId_example; // String |
final attachmentId = attachmentId_example; // String |

try {
    final result = data_sample_api.getDataSampleAttachmentContent(dataSampleId, documentId, attachmentId);
    print(result);
} catch (e) {
    print('Exception when calling DataSampleApi->getDataSampleAttachmentContent: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **dataSampleId** | **String**|  |
 **documentId** | **String**|  |
 **attachmentId** | **String**|  |

### Return type

[**MultipartFile**](MultipartFile.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/octet-stream

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getDataSampleAttachmentDocument**
> Document getDataSampleAttachmentDocument(dataSampleId, documentId)

Get document metadata of a DataSample attachment

Data Samples may contain attachments such as prescriptions, reports, ... Use this method to get the document metadata information of an attachment

### Example
```dart
import 'package:icure_medical_device_dart_sdk/api.dart';

final api = MedTechApiBuilder()
    .withICureBasePath('https://kraken.icure.dev')
    .withUserName('user')
    .withPassword('password')
    .addKeyPair('id', private_key)
.build();

final data_sample_api = api.dataSampleApi;
final dataSampleId = dataSampleId_example; // String |
final documentId = documentId_example; // String |

try {
    final result = data_sample_api.getDataSampleAttachmentDocument(dataSampleId, documentId);
    print(result);
} catch (e) {
    print('Exception when calling DataSampleApi->getDataSampleAttachmentDocument: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **dataSampleId** | **String**|  |
 **documentId** | **String**|  |

### Return type

[**Document**](Document.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: */*

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **matchDataSample**
> List<String> matchDataSample(filter)

Find data samples ids using the provided Filter.

Filters are complex selectors that are built by combining basic building blocks. Examples of filters available for [DataSample] are AllDataSamplesFilter and DataSamplesByIdsFilter. This method returns a paginated list of data samples (with a cursor that lets you query the following items).

### Example
```dart
import 'package:icure_medical_device_dart_sdk/api.dart';

final api = MedTechApiBuilder()
    .withICureBasePath('https://kraken.icure.dev')
    .withUserName('user')
    .withPassword('password')
    .addKeyPair('id', private_key)
.build();

final data_sample_api = api.dataSampleApi;
final filter = Filter(); // Filter | The Filter object that describes which condition(s) the elements whose the ids should be returned must fulfill

try {
    final result = data_sample_api.matchDataSample(filter);
    print(result);
} catch (e) {
    print('Exception when calling DataSampleApi->matchDataSample: $e\n');
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

# **setDataSampleAttachment**
> Document setDataSampleAttachment(dataSampleId, body, documentName, documentVersion, documentExternalUuid, documentLanguage)

Add or update the attachment of a DataSample

Link an attachment or update the attachment of a data sample

### Example
```dart
import 'package:icure_medical_device_dart_sdk/api.dart';

final api = MedTechApiBuilder()
    .withICureBasePath('https://kraken.icure.dev')
    .withUserName('user')
    .withPassword('password')
    .addKeyPair('id', private_key)
.build();

final data_sample_api = api.dataSampleApi;
final dataSampleId = dataSampleId_example; // String |
final body = MultipartFile(); // MultipartFile |
final documentName = documentName_example; // String |
final documentVersion = documentVersion_example; // String |
final documentExternalUuid = documentExternalUuid_example; // String |
final documentLanguage = documentLanguage_example; // String |

try {
    final result = data_sample_api.setDataSampleAttachment(dataSampleId, body, documentName, documentVersion, documentExternalUuid, documentLanguage);
    print(result);
} catch (e) {
    print('Exception when calling DataSampleApi->setDataSampleAttachment: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **dataSampleId** | **String**|  |
 **body** | **MultipartFile**|  |
 **documentName** | **String**|  | [optional]
 **documentVersion** | **String**|  | [optional]
 **documentExternalUuid** | **String**|  | [optional]
 **documentLanguage** | **String**|  | [optional]

### Return type

[**Document**](Document.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json, application/xml
 - **Accept**: */*

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)
