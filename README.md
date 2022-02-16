# openapi
ICure Medical Device Dart SDK

## Requirements

Dart 2.12 or later

## Installation & Usage

### Pub.dev
The recommended way to get this package is through pub.dev, add the following dependency to your pubspec.yaml
```
dependencies:
  icure_medical_device_dart_sdk:
    path: /path/to/openapi
```

### Github
If you wish to get this package from Github, add the following dependency to your pubspec.yaml
```
dependencies:
  icure_medical_device_dart_sdk: ^1.0.3
```

## Tests

TODO

## Getting Started

Please follow the [installation procedure](#installation--usage) and then run the following:

```dart
import 'package:icure_medical_device_dart_sdk/api.dart';

final api = MedTechApiBuilder()
    .withICureBasePath('https://kraken.icure.dev')
    .withUserName('user')
    .withPassword('password')
    .addKeyPair('id', private_key)
.build();

final coding_api = api.codingApi;
final coding = Coding(id: "typ|123|1"); 

try {
    final result = coding_api.createOrModifyCoding(coding);
    print(result);
} catch (e) {
    print('Exception when calling CodingApi->createOrModifyCoding: $e\n');
}

```

## Documentation for API Endpoints

All URIs are relative to *http://127.0.0.1:8912*

Class | Method | Description
------------ | ------------- | -------------
*CodingApi* | [**createOrModifyCoding**](doc//CodingApi.md#createormodifycoding) | Create or update a [Coding]
*CodingApi* | [**createOrModifyCodings**](doc//CodingApi.md#createormodifycodings) | Create or update a batch of [Coding]
*CodingApi* | [**filterCoding**](doc//CodingApi.md#filtercoding) | Load codings from the database by filtering them using the provided [filter].
*CodingApi* | [**getCoding**](doc//CodingApi.md#getcoding) | Get a [Coding]
*CodingApi* | [**matchCoding**](doc//CodingApi.md#matchcoding) | Load coding ids from the database by filtering them using the provided [filter].
*DataSampleApi* | [**createOrModifyDataSampleFor**](doc//DataSampleApi.md#createormodifydatasamplefor) | Create or update a [DataSample] for a patient
*DataSampleApi* | [**createOrModifyDataSamplesFor**](doc//DataSampleApi.md#createormodifydatasamplesfor) | Create or update a batch of [DataSample] for a patient
*DataSampleApi* | [**deleteAttachment**](doc//DataSampleApi.md#deleteattachment) | Delete an attachment of a DataSample
*DataSampleApi* | [**deleteDataSample**](doc//DataSampleApi.md#deletedatasample) | Delete a [DataSample] by its id
*DataSampleApi* | [**deleteDataSamples**](doc//DataSampleApi.md#deletedatasamples) | Delete a batch of [Data Samples]
*DataSampleApi* | [**filterDataSample**](doc//DataSampleApi.md#filterdatasample) | Find data samples using the provided [filter].
*DataSampleApi* | [**getDataSample**](doc//DataSampleApi.md#getdatasample) | Get a [DataSample] by its id
*DataSampleApi* | [**getDataSampleAttachmentContent**](doc//DataSampleApi.md#getdatasampleattachmentcontent) | Get attachment content of a DataSample
*DataSampleApi* | [**getDataSampleAttachmentDocument**](doc//DataSampleApi.md#getdatasampleattachmentdocument) | Get document metadata of a DataSample attachment
*DataSampleApi* | [**matchDataSample**](doc//DataSampleApi.md#matchdatasample) | Find data samples ids using the provided Filter.
*DataSampleApi* | [**setDataSampleAttachment**](doc//DataSampleApi.md#setdatasampleattachment) | Add or update the attachment of a DataSample
*HealthcareElementApi* | [**createOrModifyHealthcareElement**](doc//HealthcareElementApi.md#createormodifyhealthcareelement) | Create a Healthcare Element
*HealthcareElementApi* | [**createOrModifyHealthcareElements**](doc//HealthcareElementApi.md#createormodifyhealthcareelements) | Create a Healthcare Element
*HealthcareElementApi* | [**deleteHealthcareElement**](doc//HealthcareElementApi.md#deletehealthcareelement) | Delete a Healthcare Element
*HealthcareElementApi* | [**filterHealthcareElement**](doc//HealthcareElementApi.md#filterhealthcareelement) | Find Healthcare Elements using a filter
*HealthcareElementApi* | [**getHealthcareElement**](doc//HealthcareElementApi.md#gethealthcareelement) | Get a Healthcare Element
*HealthcareElementApi* | [**matchHealthcareElement**](doc//HealthcareElementApi.md#matchhealthcareelement) | Find Healthcare Elements using a filter
*HealthcareProfessionalApi* | [**createOrModifyHealthcareProfessional**](doc//HealthcareProfessionalApi.md#createormodifyhealthcareprofessional) | Create a newhealthcare professional or modify an existing one.
*HealthcareProfessionalApi* | [**deleteHealthcareProfessional**](doc//HealthcareProfessionalApi.md#deletehealthcareprofessional) | Delete an existing healthcare professional.
*HealthcareProfessionalApi* | [**filterHealthcareProfessionalBy**](doc//HealthcareProfessionalApi.md#filterhealthcareprofessionalby) | Load healthcare professionals from the database by filtering them using the provided Filter.
*HealthcareProfessionalApi* | [**getHealthcareProfessional**](doc//HealthcareProfessionalApi.md#gethealthcareprofessional) | Get a Healthcare professional by id.
*HealthcareProfessionalApi* | [**matchHealthcareProfessionalBy**](doc//HealthcareProfessionalApi.md#matchhealthcareprofessionalby) | Loadhealthcare professional ids from the database by filtering them using the provided Filter.
*MedicalDeviceApi* | [**createOrModifyMedicalDevice**](doc//MedicalDeviceApi.md#createormodifymedicaldevice) | Create or update a [MedicalDevice]
*MedicalDeviceApi* | [**createOrModifyMedicalDevices**](doc//MedicalDeviceApi.md#createormodifymedicaldevices) | Create or update a batch of [MedicalDevice]
*MedicalDeviceApi* | [**deleteMedicalDevice**](doc//MedicalDeviceApi.md#deletemedicaldevice) | Delete a [MedicalDevice]
*MedicalDeviceApi* | [**deleteMedicalDevices**](doc//MedicalDeviceApi.md#deletemedicaldevices) | Delete a batch of [MedicalDevice]
*MedicalDeviceApi* | [**filterMedicalDevices**](doc//MedicalDeviceApi.md#filtermedicaldevices) | Load devices from the database by filtering them using the provided [filter].
*MedicalDeviceApi* | [**getMedicalDevice**](doc//MedicalDeviceApi.md#getmedicaldevice) | Get a Medical Device
*MedicalDeviceApi* | [**matchMedicalDevices**](doc//MedicalDeviceApi.md#matchmedicaldevices) | Load medical device ids from the database by filtering them using the provided Filter.
*PatientApi* | [**createOrModifyPatient**](doc//PatientApi.md#createormodifypatient) | Create or update a [Patient]
*PatientApi* | [**deletePatient**](doc//PatientApi.md#deletepatient) | Delete a [Patient]
*PatientApi* | [**filterPatients**](doc//PatientApi.md#filterpatients) | Load patients from the database by filtering them using the provided [filter].
*PatientApi* | [**getPatient**](doc//PatientApi.md#getpatient) | Get a [Patient]
*PatientApi* | [**matchPatients**](doc//PatientApi.md#matchpatients) | Load patient ids from the database by filtering them using the provided [filter].
*UserApi* | [**checkTokenValidity**](doc//UserApi.md#checktokenvalidity) | Check token validity for a user.
*UserApi* | [**createOrModifyUser**](doc//UserApi.md#createormodifyuser) | Create a new user or modify an existing one.
*UserApi* | [**createToken**](doc//UserApi.md#createtoken) | Create a token for a user.
*UserApi* | [**deleteUser**](doc//UserApi.md#deleteuser) | Delete an existing user.
*UserApi* | [**filterUsers**](doc//UserApi.md#filterusers) | Load users from the database by filtering them using the provided Filter.
*UserApi* | [**getLoggedUser**](doc//UserApi.md#getloggeduser) | Get the details of the logged User.
*UserApi* | [**getUser**](doc//UserApi.md#getuser) | Get a User by id.
*UserApi* | [**matchUsers**](doc//UserApi.md#matchusers) | Load user ids from the database by filtering them using the provided Filter.


## Documentation For Models

 - [Address](doc//Address.md)
 - [AuthenticationToken](doc//AuthenticationToken.md)
 - [Coding](doc//Coding.md)
 - [CodingReference](doc//CodingReference.md)
 - [Content](doc//Content.md)
 - [DataSample](doc//DataSample.md)
 - [Delegation](doc//Delegation.md)
 - [Document](doc//Document.md)
 - [Filter](doc//Filter.md)
 - [HealthcareElement](doc//HealthcareElement.md)
 - [HealthcareProfessional](doc//HealthcareProfessional.md)
 - [Identifier](doc//Identifier.md)
 - [InlineResponse403](doc//InlineResponse403.md)
 - [Measure](doc//Measure.md)
 - [MedicalDevice](doc//MedicalDevice.md)
 - [PaginatedDocumentKeyAndIdPairObject](doc//PaginatedDocumentKeyAndIdPairObject.md)
 - [PaginatedListCoding](doc//PaginatedListCoding.md)
 - [PaginatedListDataSample](doc//PaginatedListDataSample.md)
 - [PaginatedListHealthcareElement](doc//PaginatedListHealthcareElement.md)
 - [PaginatedListHealthcareProfessional](doc//PaginatedListHealthcareProfessional.md)
 - [PaginatedListMedicalDevice](doc//PaginatedListMedicalDevice.md)
 - [PaginatedListPatient](doc//PaginatedListPatient.md)
 - [PaginatedListUser](doc//PaginatedListUser.md)
 - [Partnership](doc//Partnership.md)
 - [Patient](doc//Patient.md)
 - [PatientHealthCareParty](doc//PatientHealthCareParty.md)
 - [PersonName](doc//PersonName.md)
 - [Property](doc//Property.md)
 - [PropertyType](doc//PropertyType.md)
 - [SystemMetaDataEncrypted](doc//SystemMetaDataEncrypted.md)
 - [SystemMetaDataOwner](doc//SystemMetaDataOwner.md)
 - [SystemMetaDataOwnerEncrypted](doc//SystemMetaDataOwnerEncrypted.md)
 - [Telecom](doc//Telecom.md)
 - [TimeSeries](doc//TimeSeries.md)
 - [TypedValueObject](doc//TypedValueObject.md)
 - [User](doc//User.md)


## Documentation For Authorization

 All endpoints do not require authorization.


## Author



