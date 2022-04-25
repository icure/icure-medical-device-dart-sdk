//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of icure_medical_device_dart_sdk.api;

class Measure {
  /// Returns a new [Measure] instance.
  Measure({
    this.value,
    this.min,
    this.max,
    this.ref,
    this.severity,
    this.severityCode,
    this.evolution,
    this.unit,
    this.unitCodes = const {},
    this.comment,
    this.comparator,
  });

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  double? value;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  double? min;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  double? max;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  double? ref;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? severity;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? severityCode;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? evolution;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? unit;

  Set<CodingReference> unitCodes;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? comment;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? comparator;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Measure &&
          other.value == value &&
          other.min == min &&
          other.max == max &&
          other.ref == ref &&
          other.severity == severity &&
          other.severityCode == severityCode &&
          other.evolution == evolution &&
          other.unit == unit &&
          SetEquality().equals(other.unitCodes, unitCodes) &&
          other.comment == comment &&
          other.comparator == comparator;

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (value == null ? 0 : value!.hashCode) +
      (min == null ? 0 : min!.hashCode) +
      (max == null ? 0 : max!.hashCode) +
      (ref == null ? 0 : ref!.hashCode) +
      (severity == null ? 0 : severity!.hashCode) +
      (severityCode == null ? 0 : severityCode!.hashCode) +
      (evolution == null ? 0 : evolution!.hashCode) +
      (unit == null ? 0 : unit!.hashCode) +
      (unitCodes.hashCode) +
      (comment == null ? 0 : comment!.hashCode) +
      (comparator == null ? 0 : comparator!.hashCode);

  @override
  String toString() =>
      'Measure[value=$value, min=$min, max=$max, ref=$ref, severity=$severity, severityCode=$severityCode, evolution=$evolution, unit=$unit, unitCodes=$unitCodes, comment=$comment, comparator=$comparator]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (value != null) {
      json[r'value'] = value;
    }
    if (min != null) {
      json[r'min'] = min;
    }
    if (max != null) {
      json[r'max'] = max;
    }
    if (ref != null) {
      json[r'ref'] = ref;
    }
    if (severity != null) {
      json[r'severity'] = severity;
    }
    if (severityCode != null) {
      json[r'severityCode'] = severityCode;
    }
    if (evolution != null) {
      json[r'evolution'] = evolution;
    }
    if (unit != null) {
      json[r'unit'] = unit;
    }
    json[r'unitCodes'] = unitCodes.toList();
    if (comment != null) {
      json[r'comment'] = comment;
    }
    if (comparator != null) {
      json[r'comparator'] = comparator;
    }
    return json;
  }

  /// Returns a new [Measure] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static Measure? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "Measure[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "Measure[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return Measure(
        value: mapValueOfType<double>(json, r'value'),
        min: mapValueOfType<double>(json, r'min'),
        max: mapValueOfType<double>(json, r'max'),
        ref: mapValueOfType<double>(json, r'ref'),
        severity: mapValueOfType<int>(json, r'severity'),
        severityCode: mapValueOfType<String>(json, r'severityCode'),
        evolution: mapValueOfType<int>(json, r'evolution'),
        unit: mapValueOfType<String>(json, r'unit'),
        unitCodes: CodingReference.listFromJson(json[r'unitCodes'])?.toSet() ?? const <CodingReference>{},
        comment: mapValueOfType<String>(json, r'comment'),
        comparator: mapValueOfType<String>(json, r'comparator'),
      );
    }
    return null;
  }

  static List<Measure>? listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <Measure>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = Measure.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, Measure> mapFromJson(dynamic json) {
    final map = <String, Measure>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = Measure.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of Measure-objects as value to a dart map
  static Map<String, List<Measure>> mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String, List<Measure>>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = Measure.listFromJson(
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
  static const requiredKeys = <String>{};
}
