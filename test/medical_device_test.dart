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

// tests for MedicalDevice
void main() {
  // final instance = MedicalDevice();

  group('test MedicalDevice', () {
    // The Id of the MedicalDevice. We encourage using either a v4 UUID or a HL7 Id.
    // String id
    test('to test the property `id`', () async {
      // TODO
    });

    // the revision of the medical device in the database, used for conflict management / optimistic locking.
    // String rev
    test('to test the property `rev`', () async {
      // TODO
    });

    // the soft delete timestamp. When a medical device is ”deleted“, this is set to a non null value: the moment of the deletion
    // int deletionDate
    test('to test the property `deletionDate`', () async {
      // TODO
    });

    // Typically used for business / client identifiers. An identifier should identify a device uniquely and unambiguously. However, iCure can't guarantee the uniqueness of those identifiers : This is something you need to take care of.
    // List<Identifier> identifiers (default value: const [])
    test('to test the property `identifiers`', () async {
      // TODO
    });

    // the creation date of the medical device (encoded as epoch).
    // int created
    test('to test the property `created`', () async {
      // TODO
    });

    // the last modification date of the medical device (encoded as epoch).
    // int modified
    test('to test the property `modified`', () async {
      // TODO
    });

    // The id of the [User] that created this medical device. When creating the device, this field will be filled automatically by the current user id if not provided.
    // String author
    test('to test the property `author`', () async {
      // TODO
    });

    // The id of the data owner that is responsible of this medical device. When creating the medical device, will be filled automatically by the current user data owner id ([HealthcareProfessional], [Patient] or [MedicalDevice]) if missing
    // String responsible
    test('to test the property `responsible`', () async {
      // TODO
    });

    // A label is an item from a codification system that qualifies a medical device as being member of a certain class, whatever the value it might have taken. If the label qualifies the content of a field, it means that whatever the content of the field, the label will always apply. LOINC is a codification system typically used for labels.
    // Set<CodingReference> labels (default value: const {})
    test('to test the property `labels`', () async {
      // TODO
    });

    // A code is an item from a codification system that qualifies the content of this medical device. SNOMED-CT, ICPC-2 or ICD-10 codifications systems can be used for codes
    // Set<CodingReference> codes (default value: const {})
    test('to test the property `codes`', () async {
      // TODO
    });

    // Soft delete (unix epoch in ms) timestamp of the medical device
    // int endOfLife
    test('to test the property `endOfLife`', () async {
      // TODO
    });

    // An external (from another source) id with no guarantee or requirement for unicity.
    // String externalId
    test('to test the property `externalId`', () async {
      // TODO
    });

    // Name of the device/application recording the data
    // String name
    test('to test the property `name`', () async {
      // TODO
    });

    // Type of device/application recording the data. (eg. \"smartphone\", \"watch\",...)
    // String type
    test('to test the property `type`', () async {
      // TODO
    });

    // Brand of the device recording the data
    // String brand
    test('to test the property `brand`', () async {
      // TODO
    });

    // Model of the device recording the data
    // String model
    test('to test the property `model`', () async {
      // TODO
    });

    // Serial number of the device recording the data
    // String serialNumber
    test('to test the property `serialNumber`', () async {
      // TODO
    });

    // String parentId
    test('to test the property `parentId`', () async {
      // TODO
    });

    // Picture of the device/application
    // List<String> picture (default value: const [])
    test('to test the property `picture`', () async {
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
