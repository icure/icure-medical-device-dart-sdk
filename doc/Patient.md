# openapi.model.Patient

## Load the model package
```dart
import 'package:icure_medical_device_dart_sdk/api.dart';
```

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**id** | **String** | the Id of the patient. We encourage using either a v4 UUID or a HL7 Id. | [optional]
**rev** | **String** | the revision of the patient in the database, used for conflict management / optimistic locking. | [optional]
**identifiers** | [**List<Identifier>**](Identifier.md) | Typically used for business / client identifiers. An identifier should identify a patient uniquely and unambiguously. However, iCure can't guarantee the uniqueness of those identifiers : This is something you need to take care of. | [default to const []]
**created** | **int** | the creation date of the patient (encoded as epoch). | [optional]
**modified** | **int** | the last modification date of the patient (encoded as epoch). | [optional]
**author** | **String** | The id of the [User] that created this patient. When creating the patient, this field will be filled automatically by the current user id if not provided. | [optional]
**responsible** | **String** | The id of the data owner that is responsible of this patient. When creating the patient, will be filled automatically by the current user data owner id ([HealthcareProfessional], [Patient] or [MedicalDevice]) if missing | [optional]
**labels** | [**Set<CodingReference>**](CodingReference.md) | A label is an item from a codification system that qualifies a patient as being member of a certain class, whatever the value it might have taken. If the label qualifies the content of a field, it means that whatever the content of the field, the label will always apply. LOINC is a codification system typically used for labels. | [default to const {}]
**codes** | [**Set<CodingReference>**](CodingReference.md) | A code is an item from a codification system that qualifies the content of this patient. | [default to const {}]
**endOfLife** | **int** | Soft delete (unix epoch in ms) timestamp of the patient | [optional]
**deletionDate** | **int** | the soft delete timestamp. When a patient is ”deleted“, this is set to a non null value: the moment of the deletion | [optional]
**firstName** | **String** | the firstname (name) of the patient. | [optional]
**lastName** | **String** | the lastname (surname) of the patient. This is the official lastname that should be used for official administrative purposes. | [optional]
**names** | [**List<PersonName>**](PersonName.md) | the list of all names of the patient, also containing the official full name information. Ordered by preference of use. First element is therefore the official name used for the patient in the application | [default to const []]
**companyName** | **String** | the name of the company this patient is member of. | [optional]
**languages** | **List<String>** | the list of languages spoken by the patient ordered by fluency (alpha-2 code http://www.loc.gov/standards/iso639-2/ascii_8bits.html). | [default to const []]
**addresses** | [**List<Address>**](Address.md) | the list of addresses (with address type). | [default to const []]
**civility** | **String** | Mr., Ms., Pr., Dr. ... | [optional]
**gender** | **String** | the gender of the patient: male, female, indeterminate, changed, changedToMale, changedToFemale, unknown | [optional]
**birthSex** | **String** | the birth sex of the patient: male, female, indeterminate, unknown | [optional]
**mergeToPatientId** | **String** | The id of the patient this patient has been merged with. | [optional]
**mergedIds** | **Set<String>** | The ids of the patients that have been merged inside this patient. | [default to const {}]
**alias** | **String** | An alias of the person, nickname, ... | [optional]
**active** | **bool** | Is the patient active (boolean). | [default to true]
**deactivationReason** | **String** | When not active, the reason for deactivation. | [default to 'DeactivationReason.none']
**ssin** | **String** | Social security inscription number. | [optional]
**maidenName** | **String** | Lastname at birth (can be different of the current name), depending on the country, must be used to design the patient . | [optional]
**spouseName** | **String** | Lastname of the spouse for a married woman, depending on the country, can be used to design the patient. | [optional]
**partnerName** | **String** | Lastname of the partner, should not be used to design the patient. | [optional]
**personalStatus** | **String** | any of `single`, `in_couple`, `married`, `separated`, `divorced`, `divorcing`, `widowed`, `widower`, `complicated`, `unknown`, `contract`, `other`. | [optional]
**dateOfBirth** | **int** | The birthdate encoded as a fuzzy date on 8 positions (YYYYMMDD) MM and/or DD can be set to 00 if unknown (19740000 is a valid date). | [optional]
**dateOfDeath** | **int** | The date of death encoded as a fuzzy date on 8 positions (YYYYMMDD) MM and/or DD can be set to 00 if unknown (19740000 is a valid date). | [optional]
**placeOfBirth** | **String** | The place of birth. | [optional]
**placeOfDeath** | **String** | The place of death. | [optional]
**deceased** | **bool** | Is the patient deceased. | [optional]
**education** | **String** | The level of education (college degree, undergraduate, phd). | [optional]
**profession** | **String** | The current professional activity. | [optional]
**note** | **String** | A text note (can be confidential, encrypted by default). | [optional]
**administrativeNote** | **String** | An administrative note, not confidential. | [optional]
**nationality** | **String** | The nationality of the patient. | [optional]
**race** | **String** | The race of the patient. | [optional]
**ethnicity** | **String** | The ethnicity of the patient. | [optional]
**picture** | **String** | A picture usually saved in JPEG format. | [optional]
**externalId** | **String** | An external (from another source) id with no guarantee or requirement for unicity . | [optional]
**partnerships** | [**List<Partnership>**](Partnership.md) | List of partners, or persons of contact (of class Partnership, see below). | [default to const []]
**patientHealthCareParties** | [**List<PatientHealthCareParty>**](PatientHealthCareParty.md) | Links (usually for therapeutic reasons) between this patient and healthcare parties (of class PatientHealthcareParty). | [default to const []]
**patientProfessions** | [**List<CodingReference>**](CodingReference.md) | Codified list of professions exercised by this patient. | [default to const []]
**parameters** | [**Map<String, List<String>>**](List.md) | Extra parameters | [default to const {}]
**properties** | [**Set<Property>**](Property.md) | Extra properties | [default to const {}]
**systemMetaData** | [**SystemMetaDataOwnerEncrypted**](SystemMetaDataOwnerEncrypted.md) |  | [optional]

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)
