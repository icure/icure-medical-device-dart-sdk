# openapi.model.HealthcareElement

## Load the model package
```dart
import 'package:icure_medical_device_dart_sdk/api.dart';
```

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**id** | **String** | The Id of the healthcare element. We encourage using either a v4 UUID or a HL7 Id. | [optional]
**identifiers** | [**List<Identifier>**](Identifier.md) |  | [default to const []]
**rev** | **String** | The revision of the healthcare element in the database, used for conflict management / optimistic locking. | [optional]
**created** | **int** |  | [optional]
**modified** | **int** |  | [optional]
**author** | **String** |  | [optional]
**responsible** | **String** |  | [optional]
**medicalLocationId** | **String** |  | [optional]
**tags** | [**Set<CodingReference>**](CodingReference.md) |  | [default to const {}]
**codes** | [**Set<CodingReference>**](CodingReference.md) |  | [default to const {}]
**endOfLife** | **int** |  | [optional]
**deletionDate** | **int** |  | [optional]
**healthElementId** | **String** | The logical id of the healthcare element, used to link together different versions of the same healthcare element. We encourage using either a v4 UUID or a HL7 Id. | [optional]
**valueDate** | **int** | The date (unix epoch in ms) when the healthcare element is noted to have started and also closes on the same date | [optional]
**openingDate** | **int** | The date (unix epoch in ms) of the start of the healthcare element. | [optional]
**closingDate** | **int** | The date (unix epoch in ms) marking the end of the healthcare element. | [optional]
**description** | **String** | Description of the healthcare element. | [optional]
**note** | **String** | A text note (can be confidential, encrypted by default). | [optional]
**systemMetaData** | [**SystemMetaDataEncrypted**](SystemMetaDataEncrypted.md) |  | [optional]

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)
