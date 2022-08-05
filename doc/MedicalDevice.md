# openapi.model.MedicalDevice

## Load the model package
```dart
import 'package:icure_medical_device_dart_sdk/api.dart';
```

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**id** | **String** | The Id of the MedicalDevice. We encourage using either a v4 UUID or a HL7 Id. | [optional]
**rev** | **String** | the revision of the medical device in the database, used for conflict management / optimistic locking. | [optional]
**deletionDate** | **int** | the soft delete timestamp. When a medical device is ”deleted“, this is set to a non null value: the moment of the deletion | [optional]
**identifiers** | [**List<Identifier>**](Identifier.md) | Typically used for business / client identifiers. An identifier should identify a device uniquely and unambiguously. However, iCure can't guarantee the uniqueness of those identifiers : This is something you need to take care of. | [default to const []]
**created** | **int** | the creation date of the medical device (encoded as epoch). | [optional]
**modified** | **int** | the last modification date of the medical device (encoded as epoch). | [optional]
**author** | **String** | The id of the [User] that created this medical device. When creating the device, this field will be filled automatically by the current user id if not provided. | [optional]
**responsible** | **String** | The id of the data owner that is responsible of this medical device. When creating the medical device, will be filled automatically by the current user data owner id ([HealthcareProfessional], [Patient] or [MedicalDevice]) if missing | [optional]
**labels** | [**Set<CodingReference>**](CodingReference.md) | A label is an item from a codification system that qualifies a medical device as being member of a certain class, whatever the value it might have taken. If the label qualifies the content of a field, it means that whatever the content of the field, the label will always apply. LOINC is a codification system typically used for labels. | [default to const {}]
**codes** | [**Set<CodingReference>**](CodingReference.md) | A code is an item from a codification system that qualifies the content of this medical device. SNOMED-CT, ICPC-2 or ICD-10 codifications systems can be used for codes | [default to const {}]
**endOfLife** | **int** | Soft delete (unix epoch in ms) timestamp of the medical device | [optional]
**externalId** | **String** | An external (from another source) id with no guarantee or requirement for unicity. | [optional]
**name** | **String** | Name of the device/application recording the data | [optional]
**type** | **String** | Type of device/application recording the data. (eg. \"smartphone\", \"watch\",...) | [optional]
**brand** | **String** | Brand of the device recording the data | [optional]
**model** | **String** | Model of the device recording the data | [optional]
**serialNumber** | **String** | Serial number of the device recording the data | [optional]
**parentId** | **String** |  | [optional]
**picture** | **List<String>** | Picture of the device/application | [optional] [default to const []]
**properties** | [**Set<Property>**](Property.md) |  | [default to const {}]
**systemMetaData** | [**SystemMetaDataOwner**](SystemMetaDataOwner.md) |  | [optional]

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)
