# openapi.model.User

## Load the model package
```dart
import 'package:icure_medical_device_dart_sdk/api.dart';
```

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**id** | **String** | the Id of the user. We encourage using either a v4 UUID or a HL7 Id. | [optional] 
**rev** | **String** | the revision of the user in the database, used for conflict management / optimistic locking. | [optional] 
**deletionDate** | **int** | the soft delete timestamp. When a user is ”deleted“, this is set to a non null value: the moment of the deletion | [optional] 
**created** | **int** | the creation date of the user (encoded as epoch). | [optional] 
**name** | **String** | Last name of the user. This is the official last name that should be used for official administrative purposes. | [optional] 
**properties** | [**Set<Property>**](Property.md) | Extra properties for the user. Those properties are typed (see class Property) | [default to const {}]
**roles** | **Set<String>** | Roles assigned to this user | [default to const {}]
**login** | **String** | Username for this user. We encourage using an email address | [optional] 
**passwordHash** | **String** | Hashed version of the password (BCrypt is used for hashing) | [optional] 
**secret** | **String** | Secret token used to verify 2fa | [optional] 
**use2fa** | **bool** | Whether the user has activated two factors authentication | [optional] 
**groupId** | **String** | id of the group (practice/hospital) the user is member of | [optional] 
**healthcarePartyId** | **String** | Id of the healthcare party if the user is a healthcare party. | [optional] 
**patientId** | **String** | Id of the patient if the user is a patient | [optional] 
**deviceId** | **String** | Id of the patient if the user is a patient | [optional] 
**autoDelegations** | [**Map<String, Set<String>>**](Set.md) | Delegations that are automatically generated client side when a new database object is created by this user | [default to const {}]
**email** | **String** | email address of the user (used for token exchange or password recovery). | [optional] 
**mobilePhone** | **String** | mobile phone of the user (used for token exchange or password recovery). | [optional] 
**authenticationTokens** | [**Map<String, AuthenticationToken>**](AuthenticationToken.md) | Encrypted and time-limited Authentication tokens used for inter-applications authentication | [default to const {}]

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


