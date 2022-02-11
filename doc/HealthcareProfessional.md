# openapi.model.HealthcareProfessional

## Load the model package
```dart
import 'package:openapi/api.dart';
```

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**id** | **String** | the Id of the healthcare party. We encourage using either a v4 UUID or a HL7 Id. | [optional] 
**rev** | **String** | the revision of the healthcare party in the database, used for conflict management / optimistic locking. | [optional] 
**created** | **int** | creation timestamp of the object. | [optional] 
**modified** | **int** | last modification timestamp of the object. | [optional] 
**deletionDate** | **int** | the soft delete timestamp. When a user is ”deleted“, this is set to a non null value: the moment of the deletion | [optional] 
**name** | **String** | The full name of the healthcare party, used mainly when the healthcare party is an organization | [optional] 
**lastName** | **String** | the lastname (surname) of the healthcare party. This is the official lastname that should be used for official administrative purposes. | [optional] 
**firstName** | **String** | the firstname (name) of the healthcare party. | [optional] 
**names** | [**List<PersonName>**](PersonName.md) | the list of all names of the healthcare party, also containing the official full name information. Ordered by preference of use. First element is therefore the official name used for the healthcare party in the application | [default to const []]
**gender** | **String** | the gender of the healthcare party: male, female, indeterminate, changed, changedToMale, changedToFemale, unknown | [optional] 
**civility** | **String** | Mr., Ms., Pr., Dr. ... | [optional] 
**speciality** | **String** | Medical specialty of the healthcare party | [optional] 
**parentId** | **String** | Id of parent of the user representing the healthcare party. | [optional] 
**addresses** | [**List<Address>**](Address.md) | The list of addresses (with address type). | [default to const []]
**languages** | **List<String>** | The list of languages spoken by the patient ordered by fluency (alpha-2 code http://www.loc.gov/standards/iso639-2/ascii_8bits.html). | [default to const []]
**picture** | **String** | A picture usually saved in JPEG format. | [optional] 
**specialityCodes** | [**Set<CodingReference>**](CodingReference.md) | Medical specialty of the healthcare party codified using FHIR or Kmehr codificaiton scheme | [default to const {}]
**notes** | **String** | Text notes. | [optional] 
**properties** | [**Set<Property>**](Property.md) |  | [default to const {}]
**systemMetaData** | [**SystemMetaDataOwner**](SystemMetaDataOwner.md) |  | [optional] 

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


