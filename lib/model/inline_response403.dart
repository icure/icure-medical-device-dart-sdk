//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of icure_medical_device_dart_sdk.api;

class InlineResponse403 {
  /// Returns a new [InlineResponse403] instance.
  InlineResponse403({
    this.short,
    this.char,
    this.int_,
    this.long,
    this.float,
    this.double_,
    this.direct,
    this.readOnly,
  });

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? short;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? char;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? int_;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? long;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  double? float;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  double? double_;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  bool? direct;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  bool? readOnly;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is InlineResponse403 &&
          other.short == short &&
          other.char == char &&
          other.int_ == int_ &&
          other.long == long &&
          other.float == float &&
          other.double_ == double_ &&
          other.direct == direct &&
          other.readOnly == readOnly;

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (short == null ? 0 : short!.hashCode) +
      (char == null ? 0 : char!.hashCode) +
      (int_ == null ? 0 : int_!.hashCode) +
      (long == null ? 0 : long!.hashCode) +
      (float == null ? 0 : float!.hashCode) +
      (double_ == null ? 0 : double_!.hashCode) +
      (direct == null ? 0 : direct!.hashCode) +
      (readOnly == null ? 0 : readOnly!.hashCode);

  @override
  String toString() =>
      'InlineResponse403[short=$short, char=$char, int_=$int_, long=$long, float=$float, double_=$double_, direct=$direct, readOnly=$readOnly]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (short != null) {
      json[r'short'] = short;
    }
    if (char != null) {
      json[r'char'] = char;
    }
    if (int_ != null) {
      json[r'int'] = int_;
    }
    if (long != null) {
      json[r'long'] = long;
    }
    if (float != null) {
      json[r'float'] = float;
    }
    if (double_ != null) {
      json[r'double'] = double_;
    }
    if (direct != null) {
      json[r'direct'] = direct;
    }
    if (readOnly != null) {
      json[r'readOnly'] = readOnly;
    }
    return json;
  }

  /// Returns a new [InlineResponse403] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static InlineResponse403? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "InlineResponse403[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "InlineResponse403[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return InlineResponse403(
        short: mapValueOfType<int>(json, r'short'),
        char: mapValueOfType<String>(json, r'char'),
        int_: mapValueOfType<int>(json, r'int'),
        long: mapValueOfType<int>(json, r'long'),
        float: mapValueOfType<double>(json, r'float'),
        double_: mapValueOfType<double>(json, r'double'),
        direct: mapValueOfType<bool>(json, r'direct'),
        readOnly: mapValueOfType<bool>(json, r'readOnly'),
      );
    }
    return null;
  }

  static List<InlineResponse403>? listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <InlineResponse403>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = InlineResponse403.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, InlineResponse403> mapFromJson(dynamic json) {
    final map = <String, InlineResponse403>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = InlineResponse403.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of InlineResponse403-objects as value to a dart map
  static Map<String, List<InlineResponse403>> mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String, List<InlineResponse403>>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = InlineResponse403.listFromJson(
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
