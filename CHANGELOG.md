# 1.4.4

- FEATURE Send recaptchaKey as sha256 during authentication process

# 1.4.3

- FIX an issue that inverted the logic of delegation sharing when the delegation is already existing

# 1.4.2

- FIX giveAccessTo wouldn't check if the delegateTo already has access
- FIX User ID is used in giveAccessTo in PatientApi
- FIX Cache could sometimes return wrong values for delegateHcPartyKeys

# 1.4.1

- Fix an issue that block the decryption of data samples

# 1.4.0

- Add the ability to give access to other data owner to healthcare element, data sample and patient
- Fix issues on iterable comparison
- Fix an issue on UserDto to User mapping

# 1.3.5

- BUG Fix missing identifier value mapping

# 1.3.4

- Add parameter to provide keys and tokens using a Keystore

# 1.3.3

- Add AnonymousMedtechApi for initialisation of users

# 1.3.2

- Renamed registrationApi -> authenticationApi

# 1.3.1

- Implement authentication login with user still having access to its key

# 1.3.0

- Added login process methods

# 1.2.17

- FEATURE Support AesExchangeKeys, transferKeys and lostHcPartyKeys in data owners
- Updating icure_dart_sdk dependency to 1.0.34

# 1.2.16

- FIX Add patientId in createOrModifyHealthElement API service
- Updating icure_dart_sdk dependency to 1.0.33

# 1.2.15

- Fixed creation of DataSamples that contains "content" value
- Updated icure-dart-sdk to 1.0.32

## 1.2.14

- FIX Could not manage data samples when user is a patient
- FIX Could not filter patients and healthcare elements for a patient data owner
- FIX HealthcareElementByHcPartyIdentifiersFilter mapping

## 1.2.13

- Updated icure dart sdk

## 1.2.12

- Updated icure dart sdk

## 1.2.11

- Fix createOrModifyHealthcareElements method
- Add missing methods in healthcare professional API and delete unrelated documentation
- Simplify MedTechApiBuilder

## 1.2.10

- Fix registration process
-

## 1.2.9

- Added the possibility to provide a validationCode for the signUp

## 1.2.8

- Fixed issues in Filters DSL

## 1.2.7

- Exported binary_utils
- Changed addKeyPair signature

## 1.2.6

- Registration API Use Client Process ID

## 1.2.5

- Fix jsonEncode error when calling registration api

## 1.2.4

- Changed forHcp to forDataOwner in filter_dsl

## 1.2.3

- Added simplified calls for registration

## 1.2.2

- Exported crypto from icure-dart-sdk

## 1.2.1

- Update dependencies

## 1.2.0

- Added getUserByEmail

## 1.1.5

- Update dependencies & add signup test

## 1.1.4

- Update dependencies

## 1.1.3

- Update dependencies

## 1.1.2

- Fix forPatient DataSample filter builder

## 1.1.1

- Update dependencies

## 1.1.0

- Added data samples API

## 1.0.7

- Better documentation, better top level api

## 1.0.6

- Performance improvement

## 1.0.5

- Fix transitive dependency problem

## 1.0.4

- Improve library layout

## 1.0.3

- Fix filter serialization, mapping and decryption of entities without encryption keys

## 1.0.2

- Fix filter mapping
- Add tests for healthcare professionals API

## 1.0.1

- Add healthcare elements API
- Add healthcare professionals API
- Improve test coverage
- Add constructors to filters

## 1.0.0

- Initial version


