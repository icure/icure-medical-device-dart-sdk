//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifiers_names
// ignore_for_file: lines_longer_than_80_chars

part of icure_medical_device_dart_sdk.api;

class DataSample {
  /// Returns a new [DataSample] instance.
  DataSample({
    this.id,
    this.transactionId,
    this.identifiers = const [],
    this.batchId,
    this.healthElementsIds = const {},
    this.canvasesIds = const {},
    this.index,
    this.content = const {},
    this.valueDate,
    this.openingDate,
    this.closingDate,
    this.created,
    this.modified,
    this.endOfLife,
    this.author,
    this.responsible,
    this.comment,
    this.qualifiedLinks = const {},
    this.codes = const {},
    this.labels = const {},
  });

  /// The Id of the Data sample. We encourage using either a v4 UUID or a HL7 Id.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? id;

  /// The transactionId is used when a single data sample had to be split into parts for technical reasons. Several data samples with the same non null transaction id form one single data sample
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? transactionId;

  /// Typically used for business / client identifierss. An identifiers should identify a data sample uniquely and unambiguously. However, iCure can't guarantee the uniqueness of those identifierss : This is something you need to take care of.
  List<Identifier> identifiers;

  /// Id of the batch that embeds this data sample
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? batchId;

  /// List of IDs of all healthcare elements for which the data sample is provided. Only used when the Data sample is emitted outside of its batch
  Set<String> healthElementsIds;

  /// List of Ids of all canvases linked to the Data sample. Only used when the Data sample is emitted outside of its batch.
  Set<String> canvasesIds;

  /// Used for sorting data samples inside an upper object (A batch, a transaction, a FHIR bundle, ...)
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? index;

  /// Information contained in the data sample (Measure, number, ...). Content is localized, using ISO language code as key
  Map<String, Content> content;

  /// The date (YYYYMMDDhhmmss) when the Data sample is noted to have started and also closes on the same date
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? valueDate;

  /// The date (YYYYMMDDhhmmss) of the start of the Data sample
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? openingDate;

  /// The date (YYYYMMDDhhmmss) marking the end of the Data sample
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? closingDate;

  /// The timestamp (unix epoch in ms) of creation of this data sample in iCure system. Will be filled automatically if not provided.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? created;

  /// The timestamp (unix epoch in ms) of the latest modification of this data sample in iCure system. Will be filled automatically if not provided.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? modified;

  /// Soft delete (unix epoch in ms) timestamp of the data sample
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? endOfLife;

  /// The id of the [User] that created this data sample. When creating the data sample, will be filled automatically by the current user id if not provided.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? author;

  /// The id of the data owner that is responsible of this data sample. When creating the data sample, will be filled automatically by the current user data owner id ([HealthcareProfessional], [Patient] or [MedicalDevice]) if missing
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? responsible;

  /// Text, comments on the Data sample provided
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? comment;

  /// Links towards related data samples (possibly in other batches)
  Map<String, Map<String, String>> qualifiedLinks;

  /// A code is an item from a codification system that qualifies the content of this data sample. SNOMED-CT, ICPC-2 or ICD-10 codifications systems can be used for codes
  Set<CodingReference> codes;

  /// A label is an item from a codification system that qualifies a data sample as being member of a certain class, whatever the value it might have taken. If the label qualifies the content of a field, it means that whatever the content of the field, the label will always apply. LOINC is a codification system typically used for labels.
  Set<CodingReference> labels;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DataSample &&
          other.id == id &&
          other.transactionId == transactionId &&
          ListEquality().equals(other.identifiers, identifiers) &&
          other.batchId == batchId &&
          SetEquality().equals(other.healthElementsIds, healthElementsIds) &&
          SetEquality().equals(other.canvasesIds, canvasesIds) &&
          other.index == index &&
          MapEquality().equals(other.content, content) &&
          other.valueDate == valueDate &&
          other.openingDate == openingDate &&
          other.closingDate == closingDate &&
          other.created == created &&
          other.modified == modified &&
          other.endOfLife == endOfLife &&
          other.author == author &&
          other.responsible == responsible &&
          other.comment == comment &&
          MapEquality().equals(other.qualifiedLinks, qualifiedLinks) &&
          SetEquality().equals(other.codes, codes) &&
          SetEquality().equals(other.labels, labels);
  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (id == null ? 0 : id!.hashCode) +
      (transactionId == null ? 0 : transactionId!.hashCode) +
      (identifiers.hashCode) +
      (batchId == null ? 0 : batchId!.hashCode) +
      (healthElementsIds.hashCode) +
      (canvasesIds.hashCode) +
      (index == null ? 0 : index!.hashCode) +
      (content.hashCode) +
      (valueDate == null ? 0 : valueDate!.hashCode) +
      (openingDate == null ? 0 : openingDate!.hashCode) +
      (closingDate == null ? 0 : closingDate!.hashCode) +
      (created == null ? 0 : created!.hashCode) +
      (modified == null ? 0 : modified!.hashCode) +
      (endOfLife == null ? 0 : endOfLife!.hashCode) +
      (author == null ? 0 : author!.hashCode) +
      (responsible == null ? 0 : responsible!.hashCode) +
      (comment == null ? 0 : comment!.hashCode) +
      (qualifiedLinks.hashCode) +
      (codes.hashCode) +
      (labels.hashCode);

  @override
  String toString() =>
      'DataSample[id=$id, transactionId=$transactionId, identifiers=$identifiers, batchId=$batchId, healthElementsIds=$healthElementsIds, canvasesIds=$canvasesIds, index=$index, content=$content, valueDate=$valueDate, openingDate=$openingDate, closingDate=$closingDate, created=$created, modified=$modified, endOfLife=$endOfLife, author=$author, responsible=$responsible, comment=$comment, qualifiedLinks=$qualifiedLinks, codes=$codes, labels=$labels]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (id != null) {
      json[r'id'] = id;
    }
    if (transactionId != null) {
      json[r'transactionId'] = transactionId;
    }
    json[r'identifiers'] = identifiers;
    if (batchId != null) {
      json[r'batchId'] = batchId;
    }
    json[r'healthElementsIds'] = healthElementsIds.toList();
    json[r'canvasesIds'] = canvasesIds.toList();
    if (index != null) {
      json[r'index'] = index;
    }
    json[r'content'] = content;
    if (valueDate != null) {
      json[r'valueDate'] = valueDate;
    }
    if (openingDate != null) {
      json[r'openingDate'] = openingDate;
    }
    if (closingDate != null) {
      json[r'closingDate'] = closingDate;
    }
    if (created != null) {
      json[r'created'] = created;
    }
    if (modified != null) {
      json[r'modified'] = modified;
    }
    if (endOfLife != null) {
      json[r'endOfLife'] = endOfLife;
    }
    if (author != null) {
      json[r'author'] = author;
    }
    if (responsible != null) {
      json[r'responsible'] = responsible;
    }
    if (comment != null) {
      json[r'comment'] = comment;
    }
    json[r'qualifiedLinks'] = qualifiedLinks;
    json[r'codes'] = codes.toList();
    json[r'labels'] = labels.toList();
    return json;
  }

  /// Returns a new [DataSample] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static DataSample? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "DataSample[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "DataSample[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return DataSample(
        id: mapValueOfType<String>(json, r'id'),
        transactionId: mapValueOfType<String>(json, r'transactionId'),
        identifiers: Identifier.listFromJson(json[r'identifiers'])!,
        batchId: mapValueOfType<String>(json, r'batchId'),
        healthElementsIds: json[r'healthElementsIds'] is Set
            ? (json[r'healthElementsIds'] as Set).cast<String>()
            : json[r'healthElementsIds'] is List
                ? ((json[r'healthElementsIds'] as List).toSet()).cast<String>()
                : const {},
        canvasesIds: json[r'canvasesIds'] is Set
            ? (json[r'canvasesIds'] as Set).cast<String>()
            : json[r'canvasesIds'] is List
                ? ((json[r'canvasesIds'] as List).toSet()).cast<String>()
                : const {},
        index: mapValueOfType<int>(json, r'index'),
        content: mapValueOfType<Map<String, Content>>(json, r'content')!,
        valueDate: mapValueOfType<int>(json, r'valueDate'),
        openingDate: mapValueOfType<int>(json, r'openingDate'),
        closingDate: mapValueOfType<int>(json, r'closingDate'),
        created: mapValueOfType<int>(json, r'created'),
        modified: mapValueOfType<int>(json, r'modified'),
        endOfLife: mapValueOfType<int>(json, r'endOfLife'),
        author: mapValueOfType<String>(json, r'author'),
        responsible: mapValueOfType<String>(json, r'responsible'),
        comment: mapValueOfType<String>(json, r'comment'),
        qualifiedLinks: mapWithMapOfStringsFromJson(json[r'qualifiedLinks']),
        codes: CodingReference.listFromJson(json[r'codes'])!.toSet(),
        labels: CodingReference.listFromJson(json[r'labels'])!.toSet(),
      );
    }
    return null;
  }

  static List<DataSample>? listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <DataSample>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = DataSample.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, DataSample> mapFromJson(dynamic json) {
    final map = <String, DataSample>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = DataSample.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of DataSample-objects as value to a dart map
  static Map<String, List<DataSample>> mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String, List<DataSample>>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = DataSample.listFromJson(
          entry.value,
          growable: growable,
        );
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'identifiers',
    'content',
    'qualifiedLinks',
    'codes',
    'labels',
  };
}
