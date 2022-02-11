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

// tests for DataSample
void main() {
  // final instance = DataSample();

  group('test DataSample', () {
    // The Id of the Data sample. We encourage using either a v4 UUID or a HL7 Id.
    // String id
    test('to test the property `id`', () async {
      // TODO
    });

    // The transactionId is used when a single data sample had to be split into parts for technical reasons. Several data samples with the same non null transaction id form one single data sample
    // String transactionId
    test('to test the property `transactionId`', () async {
      // TODO
    });

    // Typically used for business / client identifiers. An identifier should identify a data sample uniquely and unambiguously. However, iCure can't guarantee the uniqueness of those identifiers : This is something you need to take care of.
    // List<Identifier> identifier (default value: const [])
    test('to test the property `identifier`', () async {
      // TODO
    });

    // Id of the batch that embeds this data sample
    // String batchId
    test('to test the property `batchId`', () async {
      // TODO
    });

    // List of IDs of all healthcare elements for which the data sample is provided. Only used when the Data sample is emitted outside of its batch
    // Set<String> healthElementsIds (default value: const {})
    test('to test the property `healthElementsIds`', () async {
      // TODO
    });

    // List of Ids of all canvases linked to the Data sample. Only used when the Data sample is emitted outside of its batch.
    // Set<String> canvasesIds (default value: const {})
    test('to test the property `canvasesIds`', () async {
      // TODO
    });

    // Used for sorting data samples inside an upper object (A batch, a transaction, a FHIR bundle, ...)
    // int index
    test('to test the property `index`', () async {
      // TODO
    });

    // Information contained in the data sample (Measure, number, ...). Content is localized, using ISO language code as key
    // Map<String, Content> content (default value: const {})
    test('to test the property `content`', () async {
      // TODO
    });

    // The date (YYYYMMDDhhmmss) when the Data sample is noted to have started and also closes on the same date
    // int valueDate
    test('to test the property `valueDate`', () async {
      // TODO
    });

    // The date (YYYYMMDDhhmmss) of the start of the Data sample
    // int openingDate
    test('to test the property `openingDate`', () async {
      // TODO
    });

    // The date (YYYYMMDDhhmmss) marking the end of the Data sample
    // int closingDate
    test('to test the property `closingDate`', () async {
      // TODO
    });

    // The timestamp (unix epoch in ms) of creation of this data sample in iCure system. Will be filled automatically if not provided.
    // int created
    test('to test the property `created`', () async {
      // TODO
    });

    // The timestamp (unix epoch in ms) of the latest modification of this data sample in iCure system. Will be filled automatically if not provided.
    // int modified
    test('to test the property `modified`', () async {
      // TODO
    });

    // Soft delete (unix epoch in ms) timestamp of the data sample
    // int endOfLife
    test('to test the property `endOfLife`', () async {
      // TODO
    });

    // The id of the [User] that created this data sample. When creating the data sample, will be filled automatically by the current user id if not provided.
    // String author
    test('to test the property `author`', () async {
      // TODO
    });

    // The id of the data owner that is responsible of this data sample. When creating the data sample, will be filled automatically by the current user data owner id ([HealthcareProfessional], [Patient] or [MedicalDevice]) if missing
    // String responsible
    test('to test the property `responsible`', () async {
      // TODO
    });

    // Text, comments on the Data sample provided
    // String comment
    test('to test the property `comment`', () async {
      // TODO
    });

    // Links towards related data samples (possibly in other batches)
    // Map<String, Map<String, String>> qualifiedLinks (default value: const {})
    test('to test the property `qualifiedLinks`', () async {
      // TODO
    });

    // A code is an item from a codification system that qualifies the content of this data sample. SNOMED-CT, ICPC-2 or ICD-10 codifications systems can be used for codes
    // Set<CodingReference> codes (default value: const {})
    test('to test the property `codes`', () async {
      // TODO
    });

    // A label is an item from a codification system that qualifies a data sample as being member of a certain class, whatever the value it might have taken. If the label qualifies the content of a field, it means that whatever the content of the field, the label will always apply. LOINC is a codification system typically used for labels.
    // Set<CodingReference> labels (default value: const {})
    test('to test the property `labels`', () async {
      // TODO
    });


  });

}
