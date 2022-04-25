//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of icure_medical_device_dart_sdk.api;

class PaginatedListPatient {
  /// Returns a new [PaginatedListPatient] instance.
  PaginatedListPatient({
    required this.pageSize,
    required this.totalSize,
    this.rows = const [],
    this.nextKeyPair,
  });

  int pageSize;

  int totalSize;

  List<Patient> rows;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  PaginatedDocumentKeyAndIdPairObject? nextKeyPair;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PaginatedListPatient &&
          other.pageSize == pageSize &&
          other.totalSize == totalSize &&
          ListEquality().equals(other.rows, rows) &&
          other.nextKeyPair == nextKeyPair;

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (pageSize.hashCode) + (totalSize.hashCode) + (rows.hashCode) + (nextKeyPair == null ? 0 : nextKeyPair!.hashCode);

  @override
  String toString() => 'PaginatedListPatient[pageSize=$pageSize, totalSize=$totalSize, rows=$rows, nextKeyPair=$nextKeyPair]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    json[r'pageSize'] = pageSize;
    json[r'totalSize'] = totalSize;
    json[r'rows'] = rows;
    if (nextKeyPair != null) {
      json[r'nextKeyPair'] = nextKeyPair;
    }
    return json;
  }

  /// Returns a new [PaginatedListPatient] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static PaginatedListPatient? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "PaginatedListPatient[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "PaginatedListPatient[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return PaginatedListPatient(
        pageSize: mapValueOfType<int>(json, r'pageSize')!,
        totalSize: mapValueOfType<int>(json, r'totalSize')!,
        rows: Patient.listFromJson(json[r'rows'])!,
        nextKeyPair: PaginatedDocumentKeyAndIdPairObject.fromJson(json[r'nextKeyPair']),
      );
    }
    return null;
  }

  static List<PaginatedListPatient>? listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <PaginatedListPatient>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = PaginatedListPatient.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, PaginatedListPatient> mapFromJson(dynamic json) {
    final map = <String, PaginatedListPatient>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = PaginatedListPatient.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of PaginatedListPatient-objects as value to a dart map
  static Map<String, List<PaginatedListPatient>> mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String, List<PaginatedListPatient>>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = PaginatedListPatient.listFromJson(
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
    'pageSize',
    'totalSize',
    'rows',
  };
}
