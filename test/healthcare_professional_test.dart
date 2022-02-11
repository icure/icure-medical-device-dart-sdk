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

// tests for HealthcareProfessional
void main() {
  // final instance = HealthcareProfessional();

  group('test HealthcareProfessional', () {
    // the Id of the healthcare party. We encourage using either a v4 UUID or a HL7 Id.
    // String id
    test('to test the property `id`', () async {
      // TODO
    });

    // the revision of the healthcare party in the database, used for conflict management / optimistic locking.
    // String rev
    test('to test the property `rev`', () async {
      // TODO
    });

    // creation timestamp of the object.
    // int created
    test('to test the property `created`', () async {
      // TODO
    });

    // last modification timestamp of the object.
    // int modified
    test('to test the property `modified`', () async {
      // TODO
    });

    // the soft delete timestamp. When a user is ”deleted“, this is set to a non null value: the moment of the deletion
    // int deletionDate
    test('to test the property `deletionDate`', () async {
      // TODO
    });

    // The full name of the healthcare party, used mainly when the healthcare party is an organization
    // String name
    test('to test the property `name`', () async {
      // TODO
    });

    // the lastname (surname) of the healthcare party. This is the official lastname that should be used for official administrative purposes.
    // String lastName
    test('to test the property `lastName`', () async {
      // TODO
    });

    // the firstname (name) of the healthcare party.
    // String firstName
    test('to test the property `firstName`', () async {
      // TODO
    });

    // the list of all names of the healthcare party, also containing the official full name information. Ordered by preference of use. First element is therefore the official name used for the healthcare party in the application
    // List<PersonName> names (default value: const [])
    test('to test the property `names`', () async {
      // TODO
    });

    // the gender of the healthcare party: male, female, indeterminate, changed, changedToMale, changedToFemale, unknown
    // String gender
    test('to test the property `gender`', () async {
      // TODO
    });

    // Mr., Ms., Pr., Dr. ...
    // String civility
    test('to test the property `civility`', () async {
      // TODO
    });

    // Medical specialty of the healthcare party
    // String speciality
    test('to test the property `speciality`', () async {
      // TODO
    });

    // Id of parent of the user representing the healthcare party.
    // String parentId
    test('to test the property `parentId`', () async {
      // TODO
    });

    // The list of addresses (with address type).
    // List<Address> addresses (default value: const [])
    test('to test the property `addresses`', () async {
      // TODO
    });

    // The list of languages spoken by the patient ordered by fluency (alpha-2 code http://www.loc.gov/standards/iso639-2/ascii_8bits.html).
    // List<String> languages (default value: const [])
    test('to test the property `languages`', () async {
      // TODO
    });

    // A picture usually saved in JPEG format.
    // String picture
    test('to test the property `picture`', () async {
      // TODO
    });

    // Medical specialty of the healthcare party codified using FHIR or Kmehr codificaiton scheme
    // Set<CodingReference> specialityCodes (default value: const {})
    test('to test the property `specialityCodes`', () async {
      // TODO
    });

    // Text notes.
    // String notes
    test('to test the property `notes`', () async {
      // TODO
    });

    // Set<Property> properties (default value: const {})
    test('to test the property `properties`', () async {
      // TODO
    });

    // SystemMetaDataOwner systemMetaData
    test('to test the property `systemMetaData`', () async {
      // TODO
    });


  });

}
