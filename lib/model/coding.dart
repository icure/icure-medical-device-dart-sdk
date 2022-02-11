//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class Coding {
  /// Returns a new [Coding] instance.
  Coding({
    this.id,
    this.rev,
    this.type,
    this.code,
    this.version,
    this.description = const {},
    this.qualifiedLinks = const {},
    this.searchTerms = const {},
  });

  /// the Id of the coding. We encourage using either a v4 UUID or a HL7 Id.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? id;

  /// the revision of the coding in the database, used for conflict management / optimistic locking.
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
  String? type;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? code;

  /// Must be lexicographically searchable
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? version;

  /// Description (ex: {en: Rheumatic Aortic Stenosis, fr: Sténose rhumatoïde de l'Aorte})
  Map<String, String> description;

  /// Links towards related codes
  Map<String, List<String>> qualifiedLinks;

  /// Extra search terms/ language
  Map<String, Set<String>> searchTerms;

  @override
  bool operator ==(Object other) => identical(this, other) || other is Coding &&
     other.id == id &&
     other.rev == rev &&
     other.type == type &&
     other.code == code &&
     other.version == version &&
     other.description == description &&
     other.qualifiedLinks == qualifiedLinks &&
     other.searchTerms == searchTerms;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (id == null ? 0 : id!.hashCode) +
    (rev == null ? 0 : rev!.hashCode) +
    (type == null ? 0 : type!.hashCode) +
    (code == null ? 0 : code!.hashCode) +
    (version == null ? 0 : version!.hashCode) +
    (description.hashCode) +
    (qualifiedLinks.hashCode) +
    (searchTerms.hashCode);

  @override
  String toString() => 'Coding[id=$id, rev=$rev, type=$type, code=$code, version=$version, description=$description, qualifiedLinks=$qualifiedLinks, searchTerms=$searchTerms]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (id != null) {
      json[r'id'] = id;
    }
    if (rev != null) {
      json[r'rev'] = rev;
    }
    if (type != null) {
      json[r'type'] = type;
    }
    if (code != null) {
      json[r'code'] = code;
    }
    if (version != null) {
      json[r'version'] = version;
    }
      json[r'description'] = description;
      json[r'qualifiedLinks'] = qualifiedLinks;
      json[r'searchTerms'] = searchTerms;
    return json;
  }

  /// Returns a new [Coding] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static Coding? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "Coding[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "Coding[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return Coding(
        id: mapValueOfType<String>(json, r'id'),
        rev: mapValueOfType<String>(json, r'rev'),
        type: mapValueOfType<String>(json, r'type'),
        code: mapValueOfType<String>(json, r'code'),
        version: mapValueOfType<String>(json, r'version'),
        description: mapCastOfType<String, String>(json, r'description') ?? const {},
        qualifiedLinks: json[r'qualifiedLinks'] == null ? const {} : mapWithListOfStringsFromJson(json[r'qualifiedLinks']),
        searchTerms: json[r'searchTerms'] == null ? const {} : mapWithSetOfStringsFromJson(json[r'searchTerms']),
      );
    }
    return null;
  }

  static List<Coding>? listFromJson(dynamic json, {bool growable = false,}) {
    final result = <Coding>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = Coding.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, Coding> mapFromJson(dynamic json) {
    final map = <String, Coding>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = Coding.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of Coding-objects as value to a dart map
  static Map<String, List<Coding>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<Coding>>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = Coding.listFromJson(entry.value, growable: growable,);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'qualifiedLinks',
    'searchTerms',
  };
}

