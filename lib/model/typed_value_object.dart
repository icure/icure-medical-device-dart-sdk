//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of icure_medical_device_dart_sdk.api;

class TypedValueObject {
  /// Returns a new [TypedValueObject] instance.
  TypedValueObject({
    this.type,
    this.booleanValue,
    this.integerValue,
    this.doubleValue,
    this.stringValue,
    this.dateValue,
  });

  TypedValueObjectTypeEnum? type;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  bool? booleanValue;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? integerValue;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  double? doubleValue;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? stringValue;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  DateTime? dateValue;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TypedValueObject &&
          other.type == type &&
          other.booleanValue == booleanValue &&
          other.integerValue == integerValue &&
          other.doubleValue == doubleValue &&
          other.stringValue == stringValue &&
          other.dateValue == dateValue;

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (type == null ? 0 : type!.hashCode) +
      (booleanValue == null ? 0 : booleanValue!.hashCode) +
      (integerValue == null ? 0 : integerValue!.hashCode) +
      (doubleValue == null ? 0 : doubleValue!.hashCode) +
      (stringValue == null ? 0 : stringValue!.hashCode) +
      (dateValue == null ? 0 : dateValue!.hashCode);

  @override
  String toString() =>
      'TypedValueObject[type=$type, booleanValue=$booleanValue, integerValue=$integerValue, doubleValue=$doubleValue, stringValue=$stringValue, dateValue=$dateValue]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (type != null) {
      json[r'type'] = type;
    }
    if (booleanValue != null) {
      json[r'booleanValue'] = booleanValue;
    }
    if (integerValue != null) {
      json[r'integerValue'] = integerValue;
    }
    if (doubleValue != null) {
      json[r'doubleValue'] = doubleValue;
    }
    if (stringValue != null) {
      json[r'stringValue'] = stringValue;
    }
    if (dateValue != null) {
      json[r'dateValue'] = dateValue!.toUtc().toIso8601String();
    }
    return json;
  }

  /// Returns a new [TypedValueObject] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static TypedValueObject? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "TypedValueObject[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "TypedValueObject[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return TypedValueObject(
        type: TypedValueObjectTypeEnum.fromJson(json[r'type']),
        booleanValue: mapValueOfType<bool>(json, r'booleanValue'),
        integerValue: mapValueOfType<int>(json, r'integerValue'),
        doubleValue: mapValueOfType<double>(json, r'doubleValue'),
        stringValue: mapValueOfType<String>(json, r'stringValue'),
        dateValue: mapDateTime(json, r'dateValue', ''),
      );
    }
    return null;
  }

  static List<TypedValueObject>? listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <TypedValueObject>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = TypedValueObject.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, TypedValueObject> mapFromJson(dynamic json) {
    final map = <String, TypedValueObject>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = TypedValueObject.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of TypedValueObject-objects as value to a dart map
  static Map<String, List<TypedValueObject>> mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String, List<TypedValueObject>>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = TypedValueObject.listFromJson(
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

class TypedValueObjectTypeEnum {
  /// Instantiate a new enum with the provided [value].
  const TypedValueObjectTypeEnum._(this.value);

  /// The underlying value of this enum member.
  final String value;

  @override
  String toString() => value;

  String toJson() => value;

  static const BOOLEAN = TypedValueObjectTypeEnum._(r'BOOLEAN');
  static const INTEGER = TypedValueObjectTypeEnum._(r'INTEGER');
  static const DOUBLE = TypedValueObjectTypeEnum._(r'DOUBLE');
  static const STRING = TypedValueObjectTypeEnum._(r'STRING');
  static const DATE = TypedValueObjectTypeEnum._(r'DATE');
  static const CLOB = TypedValueObjectTypeEnum._(r'CLOB');
  static const JSON = TypedValueObjectTypeEnum._(r'JSON');

  /// List of all possible values in this [enum][TypedValueObjectTypeEnum].
  static const values = <TypedValueObjectTypeEnum>[
    BOOLEAN,
    INTEGER,
    DOUBLE,
    STRING,
    DATE,
    CLOB,
    JSON,
  ];

  static TypedValueObjectTypeEnum? fromJson(dynamic value) => TypedValueObjectTypeEnumTypeTransformer().decode(value);

  static List<TypedValueObjectTypeEnum>? listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <TypedValueObjectTypeEnum>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = TypedValueObjectTypeEnum.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }
}

/// Transformation class that can [encode] an instance of [TypedValueObjectTypeEnum] to String,
/// and [decode] dynamic data back to [TypedValueObjectTypeEnum].
class TypedValueObjectTypeEnumTypeTransformer {
  factory TypedValueObjectTypeEnumTypeTransformer() => _instance ??= const TypedValueObjectTypeEnumTypeTransformer._();

  const TypedValueObjectTypeEnumTypeTransformer._();

  String encode(TypedValueObjectTypeEnum data) => data.value;

  /// Decodes a [dynamic value][data] to a TypedValueObjectTypeEnum.
  ///
  /// If [allowNull] is true and the [dynamic value][data] cannot be decoded successfully,
  /// then null is returned. However, if [allowNull] is false and the [dynamic value][data]
  /// cannot be decoded successfully, then an [UnimplementedError] is thrown.
  ///
  /// The [allowNull] is very handy when an API changes and a new enum value is added or removed,
  /// and users are still using an old app with the old code.
  TypedValueObjectTypeEnum? decode(dynamic data, {bool allowNull = true}) {
    if (data != null) {
      switch (data.toString()) {
        case r'BOOLEAN':
          return TypedValueObjectTypeEnum.BOOLEAN;
        case r'INTEGER':
          return TypedValueObjectTypeEnum.INTEGER;
        case r'DOUBLE':
          return TypedValueObjectTypeEnum.DOUBLE;
        case r'STRING':
          return TypedValueObjectTypeEnum.STRING;
        case r'DATE':
          return TypedValueObjectTypeEnum.DATE;
        case r'CLOB':
          return TypedValueObjectTypeEnum.CLOB;
        case r'JSON':
          return TypedValueObjectTypeEnum.JSON;
        default:
          if (!allowNull) {
            throw ArgumentError('Unknown enum value to decode: $data');
          }
      }
    }
    return null;
  }

  /// Singleton [TypedValueObjectTypeEnumTypeTransformer] instance.
  static TypedValueObjectTypeEnumTypeTransformer? _instance;
}
