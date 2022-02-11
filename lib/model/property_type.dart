//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of icure_medical_device_dart_sdk.api;

class PropertyType {
  /// Returns a new [PropertyType] instance.
  PropertyType({
    this.identifier,
    this.type,
  });

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? identifier;

  PropertyTypeTypeEnum? type;

  @override
  bool operator ==(Object other) => identical(this, other) || other is PropertyType && other.identifier == identifier && other.type == type;

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (identifier == null ? 0 : identifier!.hashCode) + (type == null ? 0 : type!.hashCode);

  @override
  String toString() => 'PropertyType[identifier=$identifier, type=$type]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (identifier != null) {
      json[r'identifier'] = identifier;
    }
    if (type != null) {
      json[r'type'] = type;
    }
    return json;
  }

  /// Returns a new [PropertyType] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static PropertyType? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "PropertyType[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "PropertyType[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return PropertyType(
        identifier: mapValueOfType<String>(json, r'identifier'),
        type: PropertyTypeTypeEnum.fromJson(json[r'type']),
      );
    }
    return null;
  }

  static List<PropertyType>? listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <PropertyType>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = PropertyType.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, PropertyType> mapFromJson(dynamic json) {
    final map = <String, PropertyType>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = PropertyType.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of PropertyType-objects as value to a dart map
  static Map<String, List<PropertyType>> mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String, List<PropertyType>>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = PropertyType.listFromJson(
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

class PropertyTypeTypeEnum {
  /// Instantiate a new enum with the provided [value].
  const PropertyTypeTypeEnum._(this.value);

  /// The underlying value of this enum member.
  final String value;

  @override
  String toString() => value;

  String toJson() => value;

  static const BOOLEAN = PropertyTypeTypeEnum._(r'BOOLEAN');
  static const INTEGER = PropertyTypeTypeEnum._(r'INTEGER');
  static const DOUBLE = PropertyTypeTypeEnum._(r'DOUBLE');
  static const STRING = PropertyTypeTypeEnum._(r'STRING');
  static const DATE = PropertyTypeTypeEnum._(r'DATE');
  static const CLOB = PropertyTypeTypeEnum._(r'CLOB');
  static const JSON = PropertyTypeTypeEnum._(r'JSON');

  /// List of all possible values in this [enum][PropertyTypeTypeEnum].
  static const values = <PropertyTypeTypeEnum>[
    BOOLEAN,
    INTEGER,
    DOUBLE,
    STRING,
    DATE,
    CLOB,
    JSON,
  ];

  static PropertyTypeTypeEnum? fromJson(dynamic value) => PropertyTypeTypeEnumTypeTransformer().decode(value);

  static List<PropertyTypeTypeEnum>? listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <PropertyTypeTypeEnum>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = PropertyTypeTypeEnum.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }
}

/// Transformation class that can [encode] an instance of [PropertyTypeTypeEnum] to String,
/// and [decode] dynamic data back to [PropertyTypeTypeEnum].
class PropertyTypeTypeEnumTypeTransformer {
  factory PropertyTypeTypeEnumTypeTransformer() => _instance ??= const PropertyTypeTypeEnumTypeTransformer._();

  const PropertyTypeTypeEnumTypeTransformer._();

  String encode(PropertyTypeTypeEnum data) => data.value;

  /// Decodes a [dynamic value][data] to a PropertyTypeTypeEnum.
  ///
  /// If [allowNull] is true and the [dynamic value][data] cannot be decoded successfully,
  /// then null is returned. However, if [allowNull] is false and the [dynamic value][data]
  /// cannot be decoded successfully, then an [UnimplementedError] is thrown.
  ///
  /// The [allowNull] is very handy when an API changes and a new enum value is added or removed,
  /// and users are still using an old app with the old code.
  PropertyTypeTypeEnum? decode(dynamic data, {bool allowNull = true}) {
    if (data != null) {
      switch (data.toString()) {
        case r'BOOLEAN':
          return PropertyTypeTypeEnum.BOOLEAN;
        case r'INTEGER':
          return PropertyTypeTypeEnum.INTEGER;
        case r'DOUBLE':
          return PropertyTypeTypeEnum.DOUBLE;
        case r'STRING':
          return PropertyTypeTypeEnum.STRING;
        case r'DATE':
          return PropertyTypeTypeEnum.DATE;
        case r'CLOB':
          return PropertyTypeTypeEnum.CLOB;
        case r'JSON':
          return PropertyTypeTypeEnum.JSON;
        default:
          if (!allowNull) {
            throw ArgumentError('Unknown enum value to decode: $data');
          }
      }
    }
    return null;
  }

  /// Singleton [PropertyTypeTypeEnumTypeTransformer] instance.
  static PropertyTypeTypeEnumTypeTransformer? _instance;
}
