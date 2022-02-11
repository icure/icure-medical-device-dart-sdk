//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

import 'package:openapi/api.dart';
import 'package:test/test.dart';

// tests for Patient
void main() {
  // final instance = Patient();

  group('test Patient', () {
    // the Id of the patient. We encourage using either a v4 UUID or a HL7 Id.
    // String id
    test('to test the property `id`', () async {
      // TODO
    });

    // the revision of the patient in the database, used for conflict management / optimistic locking.
    // String rev
    test('to test the property `rev`', () async {
      // TODO
    });

    // Typically used for business / client identifiers. An identifier should identify a patient uniquely and unambiguously. However, iCure can't guarantee the uniqueness of those identifiers : This is something you need to take care of.
    // List<Identifier> identifiers (default value: const [])
    test('to test the property `identifiers`', () async {
      // TODO
    });

    // the creation date of the patient (encoded as epoch).
    // int created
    test('to test the property `created`', () async {
      // TODO
    });

    // the last modification date of the patient (encoded as epoch).
    // int modified
    test('to test the property `modified`', () async {
      // TODO
    });

    // The id of the [User] that created this patient. When creating the patient, this field will be filled automatically by the current user id if not provided.
    // String author
    test('to test the property `author`', () async {
      // TODO
    });

    // The id of the data owner that is responsible of this patient. When creating the patient, will be filled automatically by the current user data owner id ([HealthcareProfessional], [Patient] or [MedicalDevice]) if missing
    // String responsible
    test('to test the property `responsible`', () async {
      // TODO
    });

    // A label is an item from a codification system that qualifies a patient as being member of a certain class, whatever the value it might have taken. If the label qualifies the content of a field, it means that whatever the content of the field, the label will always apply. LOINC is a codification system typically used for labels.
    // Set<CodingReference> labels (default value: const {})
    test('to test the property `labels`', () async {
      // TODO
    });

    // A code is an item from a codification system that qualifies the content of this patient.
    // Set<CodingReference> codes (default value: const {})
    test('to test the property `codes`', () async {
      // TODO
    });

    // Soft delete (unix epoch in ms) timestamp of the patient
    // int endOfLife
    test('to test the property `endOfLife`', () async {
      // TODO
    });

    // the soft delete timestamp. When a patient is ”deleted“, this is set to a non null value: the moment of the deletion
    // int deletionDate
    test('to test the property `deletionDate`', () async {
      // TODO
    });

    // the firstname (name) of the patient.
    // String firstName
    test('to test the property `firstName`', () async {
      // TODO
    });

    // the lastname (surname) of the patient. This is the official lastname that should be used for official administrative purposes.
    // String lastName
    test('to test the property `lastName`', () async {
      // TODO
    });

    // the list of all names of the patient, also containing the official full name information. Ordered by preference of use. First element is therefore the official name used for the patient in the application
    // List<PersonName> names (default value: const [])
    test('to test the property `names`', () async {
      // TODO
    });

    // the name of the company this patient is member of.
    // String companyName
    test('to test the property `companyName`', () async {
      // TODO
    });

    // the list of languages spoken by the patient ordered by fluency (alpha-2 code http://www.loc.gov/standards/iso639-2/ascii_8bits.html).
    // List<String> languages (default value: const [])
    test('to test the property `languages`', () async {
      // TODO
    });

    // the list of addresses (with address type).
    // List<Address> addresses (default value: const [])
    test('to test the property `addresses`', () async {
      // TODO
    });

    // Mr., Ms., Pr., Dr. ...
    // String civility
    test('to test the property `civility`', () async {
      // TODO
    });

    // the gender of the patient: male, female, indeterminate, changed, changedToMale, changedToFemale, unknown
    // String gender
    test('to test the property `gender`', () async {
      // TODO
    });

    // the birth sex of the patient: male, female, indeterminate, unknown
    // String birthSex
    test('to test the property `birthSex`', () async {
      // TODO
    });

    // The id of the patient this patient has been merged with.
    // String mergeToPatientId
    test('to test the property `mergeToPatientId`', () async {
      // TODO
    });

    // The ids of the patients that have been merged inside this patient.
    // Set<String> mergedIds (default value: const {})
    test('to test the property `mergedIds`', () async {
      // TODO
    });

    // An alias of the person, nickname, ...
    // String alias
    test('to test the property `alias`', () async {
      // TODO
    });

    // Is the patient active (boolean).
    // bool active (default value: true)
    test('to test the property `active`', () async {
      // TODO
    });

    // When not active, the reason for deactivation.
    // String deactivationReason (default value: 'DeactivationReason.none')
    test('to test the property `deactivationReason`', () async {
      // TODO
    });

    // Social security inscription number.
    // String ssin
    test('to test the property `ssin`', () async {
      // TODO
    });

    // Lastname at birth (can be different of the current name), depending on the country, must be used to design the patient .
    // String maidenName
    test('to test the property `maidenName`', () async {
      // TODO
    });

    // Lastname of the spouse for a married woman, depending on the country, can be used to design the patient.
    // String spouseName
    test('to test the property `spouseName`', () async {
      // TODO
    });

    // Lastname of the partner, should not be used to design the patient.
    // String partnerName
    test('to test the property `partnerName`', () async {
      // TODO
    });

    // any of `single`, `in_couple`, `married`, `separated`, `divorced`, `divorcing`, `widowed`, `widower`, `complicated`, `unknown`, `contract`, `other`.
    // String personalStatus
    test('to test the property `personalStatus`', () async {
      // TODO
    });

    // The birthdate encoded as a fuzzy date on 8 positions (YYYYMMDD) MM and/or DD can be set to 00 if unknown (19740000 is a valid date).
    // int dateOfBirth
    test('to test the property `dateOfBirth`', () async {
      // TODO
    });

    // The date of death encoded as a fuzzy date on 8 positions (YYYYMMDD) MM and/or DD can be set to 00 if unknown (19740000 is a valid date).
    // int dateOfDeath
    test('to test the property `dateOfDeath`', () async {
      // TODO
    });

    // The place of birth.
    // String placeOfBirth
    test('to test the property `placeOfBirth`', () async {
      // TODO
    });

    // The place of death.
    // String placeOfDeath
    test('to test the property `placeOfDeath`', () async {
      // TODO
    });

    // Is the patient deceased.
    // bool deceased
    test('to test the property `deceased`', () async {
      // TODO
    });

    // The level of education (college degree, undergraduate, phd).
    // String education
    test('to test the property `education`', () async {
      // TODO
    });

    // The current professional activity.
    // String profession
    test('to test the property `profession`', () async {
      // TODO
    });

    // A text note (can be confidential, encrypted by default).
    // String note
    test('to test the property `note`', () async {
      // TODO
    });

    // An administrative note, not confidential.
    // String administrativeNote
    test('to test the property `administrativeNote`', () async {
      // TODO
    });

    // The nationality of the patient.
    // String nationality
    test('to test the property `nationality`', () async {
      // TODO
    });

    // The race of the patient.
    // String race
    test('to test the property `race`', () async {
      // TODO
    });

    // The ethnicity of the patient.
    // String ethnicity
    test('to test the property `ethnicity`', () async {
      // TODO
    });

    // A picture usually saved in JPEG format.
    // String picture
    test('to test the property `picture`', () async {
      // TODO
    });

    // An external (from another source) id with no guarantee or requirement for unicity .
    // String externalId
    test('to test the property `externalId`', () async {
      // TODO
    });

    // List of partners, or persons of contact (of class Partnership, see below).
    // List<Partnership> partnerships (default value: const [])
    test('to test the property `partnerships`', () async {
      // TODO
    });

    // Links (usually for therapeutic reasons) between this patient and healthcare parties (of class PatientHealthcareParty).
    // List<PatientHealthCareParty> patientHealthCareParties (default value: const [])
    test('to test the property `patientHealthCareParties`', () async {
      // TODO
    });

    // Codified list of professions exercised by this patient.
    // List<CodingReference> patientProfessions (default value: const [])
    test('to test the property `patientProfessions`', () async {
      // TODO
    });

    // Extra parameters
    // Map<String, List<String>> parameters (default value: const {})
    test('to test the property `parameters`', () async {
      // TODO
    });

    // Extra properties
    // Set<Property> properties (default value: const {})
    test('to test the property `properties`', () async {
      // TODO
    });

    // SystemMetaDataOwnerEncrypted systemMetaData
    test('to test the property `systemMetaData`', () async {
      // TODO
    });


  });

}
