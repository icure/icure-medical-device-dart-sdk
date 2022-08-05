# openapi.model.Content

## Load the model package
```dart
import 'package:icure_medical_device_dart_sdk/api.dart';
```

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**stringValue** | **String** |  | [optional]
**numberValue** | **double** |  | [optional]
**booleanValue** | **bool** |  | [optional]
**instantValue** | [**DateTime**](DateTime.md) |  | [optional]
**fuzzyDateValue** | **int** | Value as date. The format could have a all three (day, month and year) or values on any of these three, whatever is known. | [optional]
**binaryValue** | **String** |  | [optional]
**documentId** | **String** | Linked document. | [optional]
**measureValue** | [**Measure**](Measure.md) |  | [optional]
**timeSeries** | [**TimeSeries**](TimeSeries.md) |  | [optional]
**compoundValue** | [**List<DataSample>**](DataSample.md) |  | [optional] [default to const []]
**ratio** | [**List<Measure>**](Measure.md) |  | [optional] [default to const []]
**range** | [**List<Measure>**](Measure.md) |  | [optional] [default to const []]

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)
