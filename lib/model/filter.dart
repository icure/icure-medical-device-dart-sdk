//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of icure_medical_device_dart_sdk.api;

class Filter {
  /// Returns a new [Filter] instance.
  Filter({
    required this.description,
  });

  String description;

  @override
  bool operator ==(Object other) => identical(this, other) || other is Filter && other.description == description;

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (description.hashCode);

  @override
  String toString() => 'Filter[description=$description]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    json[r'description'] = description;
    return json;
  }

  /// Returns a new [Filter] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static Filter? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "Filter[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "Filter[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return Filter(
        description: mapValueOfType<String>(json, r'description')!,
      );
    }
    return null;
  }

  static List<Filter>? listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <Filter>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = Filter.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, Filter> mapFromJson(dynamic json) {
    final map = <String, Filter>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = Filter.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of Filter-objects as value to a dart map
  static Map<String, List<Filter>> mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String, List<Filter>>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = Filter.listFromJson(
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
    'description',
  };
}
