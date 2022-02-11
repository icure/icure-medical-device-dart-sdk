//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class Property {
  /// Returns a new [Property] instance.
  Property({
    this.id,
    this.type,
    this.typedValue,
    this.deleted,
  });

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? id;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  PropertyType? type;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  TypedValueObject? typedValue;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? deleted;

  @override
  bool operator ==(Object other) => identical(this, other) || other is Property &&
     other.id == id &&
     other.type == type &&
     other.typedValue == typedValue &&
     other.deleted == deleted;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (id == null ? 0 : id!.hashCode) +
    (type == null ? 0 : type!.hashCode) +
    (typedValue == null ? 0 : typedValue!.hashCode) +
    (deleted == null ? 0 : deleted!.hashCode);

  @override
  String toString() => 'Property[id=$id, type=$type, typedValue=$typedValue, deleted=$deleted]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (id != null) {
      json[r'id'] = id;
    }
    if (type != null) {
      json[r'type'] = type;
    }
    if (typedValue != null) {
      json[r'typedValue'] = typedValue;
    }
    if (deleted != null) {
      json[r'deleted'] = deleted;
    }
    return json;
  }

  /// Returns a new [Property] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static Property? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "Property[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "Property[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return Property(
        id: mapValueOfType<String>(json, r'id'),
        type: PropertyType.fromJson(json[r'type']),
        typedValue: TypedValueObject.fromJson(json[r'typedValue']),
        deleted: mapValueOfType<int>(json, r'deleted'),
      );
    }
    return null;
  }

  static List<Property>? listFromJson(dynamic json, {bool growable = false,}) {
    final result = <Property>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = Property.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, Property> mapFromJson(dynamic json) {
    final map = <String, Property>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = Property.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of Property-objects as value to a dart map
  static Map<String, List<Property>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<Property>>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = Property.listFromJson(entry.value, growable: growable,);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
  };
}

