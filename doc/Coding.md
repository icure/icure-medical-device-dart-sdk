# openapi.model.Coding

## Load the model package
```dart
import 'package:openapi/api.dart';
```

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**id** | **String** | the Id of the coding. We encourage using either a v4 UUID or a HL7 Id. | [optional] 
**rev** | **String** | the revision of the coding in the database, used for conflict management / optimistic locking. | [optional] 
**type** | **String** |  | [optional] 
**code** | **String** |  | [optional] 
**version** | **String** | Must be lexicographically searchable | [optional] 
**description** | **Map<String, String>** | Description (ex: {en: Rheumatic Aortic Stenosis, fr: Sténose rhumatoïde de l'Aorte}) | [optional] [default to const {}]
**qualifiedLinks** | [**Map<String, List<String>>**](List.md) | Links towards related codes | [default to const {}]
**searchTerms** | [**Map<String, Set<String>>**](Set.md) | Extra search terms/ language | [default to const {}]

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


