//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of icure_medical_device_dart_sdk.api;

class Document {
  /// Returns a new [Document] instance.
  Document({
    this.id,
    this.rev,
    this.created,
    this.modified,
    this.author,
    this.responsible,
    this.medicalLocationId,
    this.deletionDate,
    this.objectStoreReference,
    this.mainUti,
    this.name,
    this.version,
    this.otherUtis = const {},
    this.externalUuid,
    this.size,
    this.hash,
    this.attachmentId,
  });

  /// The Id of the document. We encourage using either a v4 UUID or a HL7 Id.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? id;

  /// The revision of the document in the database, used for conflict management / optimistic locking.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? rev;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? created;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? modified;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? author;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? responsible;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? medicalLocationId;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? deletionDate;

  /// Reference in object store
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? objectStoreReference;

  /// The main Uniform Type Identifier of the document (https://developer.apple.com/library/archive/documentation/FileManagement/Conceptual/understanding_utis/understand_utis_conc/understand_utis_conc.html#//apple_ref/doc/uid/TP40001319-CH202-CHDHIJDE)
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? mainUti;

  /// Name of the document
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? name;

  /// The document version
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? version;

  /// Extra Uniform Type Identifiers
  Set<String> otherUtis;

  /// A unique external id (from another external source).
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? externalUuid;

  /// Size of the document file
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? size;

  /// Hashed version of the document
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? hash;

  /// Id of attachment to this document
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? attachmentId;

  @override
  bool operator ==(Object other) => identical(this, other) || other is Document &&
     other.id == id &&
     other.rev == rev &&
     other.created == created &&
     other.modified == modified &&
     other.author == author &&
     other.responsible == responsible &&
     other.medicalLocationId == medicalLocationId &&
     other.deletionDate == deletionDate &&
     other.objectStoreReference == objectStoreReference &&
     other.mainUti == mainUti &&
     other.name == name &&
     other.version == version &&
     other.otherUtis == otherUtis &&
     other.externalUuid == externalUuid &&
     other.size == size &&
     other.hash == hash &&
     other.attachmentId == attachmentId;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (id == null ? 0 : id!.hashCode) +
    (rev == null ? 0 : rev!.hashCode) +
    (created == null ? 0 : created!.hashCode) +
    (modified == null ? 0 : modified!.hashCode) +
    (author == null ? 0 : author!.hashCode) +
    (responsible == null ? 0 : responsible!.hashCode) +
    (medicalLocationId == null ? 0 : medicalLocationId!.hashCode) +
    (deletionDate == null ? 0 : deletionDate!.hashCode) +
    (objectStoreReference == null ? 0 : objectStoreReference!.hashCode) +
    (mainUti == null ? 0 : mainUti!.hashCode) +
    (name == null ? 0 : name!.hashCode) +
    (version == null ? 0 : version!.hashCode) +
    (otherUtis.hashCode) +
    (externalUuid == null ? 0 : externalUuid!.hashCode) +
    (size == null ? 0 : size!.hashCode) +
    (hash == null ? 0 : hash!.hashCode) +
    (attachmentId == null ? 0 : attachmentId!.hashCode);

  @override
  String toString() => 'Document[id=$id, rev=$rev, created=$created, modified=$modified, author=$author, responsible=$responsible, medicalLocationId=$medicalLocationId, deletionDate=$deletionDate, objectStoreReference=$objectStoreReference, mainUti=$mainUti, name=$name, version=$version, otherUtis=$otherUtis, externalUuid=$externalUuid, size=$size, hash=$hash, attachmentId=$attachmentId]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (id != null) {
      json[r'id'] = id;
    }
    if (rev != null) {
      json[r'rev'] = rev;
    }
    if (created != null) {
      json[r'created'] = created;
    }
    if (modified != null) {
      json[r'modified'] = modified;
    }
    if (author != null) {
      json[r'author'] = author;
    }
    if (responsible != null) {
      json[r'responsible'] = responsible;
    }
    if (medicalLocationId != null) {
      json[r'medicalLocationId'] = medicalLocationId;
    }
    if (deletionDate != null) {
      json[r'deletionDate'] = deletionDate;
    }
    if (objectStoreReference != null) {
      json[r'objectStoreReference'] = objectStoreReference;
    }
    if (mainUti != null) {
      json[r'mainUti'] = mainUti;
    }
    if (name != null) {
      json[r'name'] = name;
    }
    if (version != null) {
      json[r'version'] = version;
    }
      json[r'otherUtis'] = otherUtis.toList();
    if (externalUuid != null) {
      json[r'externalUuid'] = externalUuid;
    }
    if (size != null) {
      json[r'size'] = size;
    }
    if (hash != null) {
      json[r'hash'] = hash;
    }
    if (attachmentId != null) {
      json[r'attachmentId'] = attachmentId;
    }
    return json;
  }

  /// Returns a new [Document] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static Document? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "Document[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "Document[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return Document(
        id: mapValueOfType<String>(json, r'id'),
        rev: mapValueOfType<String>(json, r'rev'),
        created: mapValueOfType<int>(json, r'created'),
        modified: mapValueOfType<int>(json, r'modified'),
        author: mapValueOfType<String>(json, r'author'),
        responsible: mapValueOfType<String>(json, r'responsible'),
        medicalLocationId: mapValueOfType<String>(json, r'medicalLocationId'),
        deletionDate: mapValueOfType<int>(json, r'deletionDate'),
        objectStoreReference: mapValueOfType<String>(json, r'objectStoreReference'),
        mainUti: mapValueOfType<String>(json, r'mainUti'),
        name: mapValueOfType<String>(json, r'name'),
        version: mapValueOfType<String>(json, r'version'),
        otherUtis: json[r'otherUtis'] is Set
            ? (json[r'otherUtis'] as Set).cast<String>()
            : const {},
        externalUuid: mapValueOfType<String>(json, r'externalUuid'),
        size: mapValueOfType<int>(json, r'size'),
        hash: mapValueOfType<String>(json, r'hash'),
        attachmentId: mapValueOfType<String>(json, r'attachmentId'),
      );
    }
    return null;
  }

  static List<Document>? listFromJson(dynamic json, {bool growable = false,}) {
    final result = <Document>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = Document.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, Document> mapFromJson(dynamic json) {
    final map = <String, Document>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = Document.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of Document-objects as value to a dart map
  static Map<String, List<Document>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<Document>>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = Document.listFromJson(entry.value, growable: growable,);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'otherUtis',
  };
}

