# openapi.model.Document

## Load the model package
```dart
import 'package:icure_medical_device_dart_sdk/api.dart';
```

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**id** | **String** | The Id of the document. We encourage using either a v4 UUID or a HL7 Id. | [optional]
**rev** | **String** | The revision of the document in the database, used for conflict management / optimistic locking. | [optional]
**created** | **int** |  | [optional]
**modified** | **int** |  | [optional]
**author** | **String** |  | [optional]
**responsible** | **String** |  | [optional]
**medicalLocationId** | **String** |  | [optional]
**deletionDate** | **int** |  | [optional]
**objectStoreReference** | **String** | Reference in object store | [optional]
**mainUti** | **String** | The main Uniform Type Identifier of the document (https://developer.apple.com/library/archive/documentation/FileManagement/Conceptual/understanding_utis/understand_utis_conc/understand_utis_conc.html#//apple_ref/doc/uid/TP40001319-CH202-CHDHIJDE) | [optional]
**name** | **String** | Name of the document | [optional]
**version** | **String** | The document version | [optional]
**otherUtis** | **Set<String>** | Extra Uniform Type Identifiers | [default to const {}]
**externalUuid** | **String** | A unique external id (from another external source). | [optional]
**size** | **int** | Size of the document file | [optional]
**hash** | **String** | Hashed version of the document | [optional]
**attachmentId** | **String** | Id of attachment to this document | [optional]

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)
