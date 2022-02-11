# openapi.model.DataSample

## Load the model package
```dart
import 'package:openapi/api.dart';
```

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**id** | **String** | The Id of the Data sample. We encourage using either a v4 UUID or a HL7 Id. | [optional] 
**transactionId** | **String** | The transactionId is used when a single data sample had to be split into parts for technical reasons. Several data samples with the same non null transaction id form one single data sample | [optional] 
**identifier** | [**List<Identifier>**](Identifier.md) | Typically used for business / client identifiers. An identifier should identify a data sample uniquely and unambiguously. However, iCure can't guarantee the uniqueness of those identifiers : This is something you need to take care of. | [default to const []]
**batchId** | **String** | Id of the batch that embeds this data sample | [optional] 
**healthElementsIds** | **Set<String>** | List of IDs of all healthcare elements for which the data sample is provided. Only used when the Data sample is emitted outside of its batch | [optional] [default to const {}]
**canvasesIds** | **Set<String>** | List of Ids of all canvases linked to the Data sample. Only used when the Data sample is emitted outside of its batch. | [optional] [default to const {}]
**index** | **int** | Used for sorting data samples inside an upper object (A batch, a transaction, a FHIR bundle, ...) | [optional] 
**content** | [**Map<String, Content>**](Content.md) | Information contained in the data sample (Measure, number, ...). Content is localized, using ISO language code as key | [default to const {}]
**valueDate** | **int** | The date (YYYYMMDDhhmmss) when the Data sample is noted to have started and also closes on the same date | [optional] 
**openingDate** | **int** | The date (YYYYMMDDhhmmss) of the start of the Data sample | [optional] 
**closingDate** | **int** | The date (YYYYMMDDhhmmss) marking the end of the Data sample | [optional] 
**created** | **int** | The timestamp (unix epoch in ms) of creation of this data sample in iCure system. Will be filled automatically if not provided. | [optional] 
**modified** | **int** | The timestamp (unix epoch in ms) of the latest modification of this data sample in iCure system. Will be filled automatically if not provided. | [optional] 
**endOfLife** | **int** | Soft delete (unix epoch in ms) timestamp of the data sample | [optional] 
**author** | **String** | The id of the [User] that created this data sample. When creating the data sample, will be filled automatically by the current user id if not provided. | [optional] 
**responsible** | **String** | The id of the data owner that is responsible of this data sample. When creating the data sample, will be filled automatically by the current user data owner id ([HealthcareProfessional], [Patient] or [MedicalDevice]) if missing | [optional] 
**comment** | **String** | Text, comments on the Data sample provided | [optional] 
**qualifiedLinks** | [**Map<String, Map<String, String>>**](Map.md) | Links towards related data samples (possibly in other batches) | [default to const {}]
**codes** | [**Set<CodingReference>**](CodingReference.md) | A code is an item from a codification system that qualifies the content of this data sample. SNOMED-CT, ICPC-2 or ICD-10 codifications systems can be used for codes | [default to const {}]
**labels** | [**Set<CodingReference>**](CodingReference.md) | A label is an item from a codification system that qualifies a data sample as being member of a certain class, whatever the value it might have taken. If the label qualifies the content of a field, it means that whatever the content of the field, the label will always apply. LOINC is a codification system typically used for labels. | [default to const {}]

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


