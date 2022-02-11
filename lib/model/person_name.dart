//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of icure_medical_device_dart_sdk.api;

class PersonName {
  /// Returns a new [PersonName] instance.
  PersonName({
    this.lastName,
    this.firstNames = const [],
    this.start,
    this.end,
    this.prefix = const [],
    this.suffix = const [],
    this.text,
    this.use,
  });

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? lastName;

  List<String> firstNames;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? start;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? end;

  List<String> prefix;

  List<String> suffix;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? text;

  PersonNameUseEnum? use;

  @override
  bool operator ==(Object other) => identical(this, other) || other is PersonName &&
     other.lastName == lastName &&
     other.firstNames == firstNames &&
     other.start == start &&
     other.end == end &&
     other.prefix == prefix &&
     other.suffix == suffix &&
     other.text == text &&
     other.use == use;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (lastName == null ? 0 : lastName!.hashCode) +
    (firstNames.hashCode) +
    (start == null ? 0 : start!.hashCode) +
    (end == null ? 0 : end!.hashCode) +
    (prefix.hashCode) +
    (suffix.hashCode) +
    (text == null ? 0 : text!.hashCode) +
    (use == null ? 0 : use!.hashCode);

  @override
  String toString() => 'PersonName[lastName=$lastName, firstNames=$firstNames, start=$start, end=$end, prefix=$prefix, suffix=$suffix, text=$text, use=$use]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (lastName != null) {
      json[r'lastName'] = lastName;
    }
      json[r'firstNames'] = firstNames;
    if (start != null) {
      json[r'start'] = start;
    }
    if (end != null) {
      json[r'end'] = end;
    }
      json[r'prefix'] = prefix;
      json[r'suffix'] = suffix;
    if (text != null) {
      json[r'text'] = text;
    }
    if (use != null) {
      json[r'use'] = use;
    }
    return json;
  }

  /// Returns a new [PersonName] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static PersonName? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "PersonName[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "PersonName[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return PersonName(
        lastName: mapValueOfType<String>(json, r'lastName'),
        firstNames: json[r'firstNames'] is List
            ? (json[r'firstNames'] as List).cast<String>()
            : const [],
        start: mapValueOfType<int>(json, r'start'),
        end: mapValueOfType<int>(json, r'end'),
        prefix: json[r'prefix'] is List
            ? (json[r'prefix'] as List).cast<String>()
            : const [],
        suffix: json[r'suffix'] is List
            ? (json[r'suffix'] as List).cast<String>()
            : const [],
        text: mapValueOfType<String>(json, r'text'),
        use: PersonNameUseEnum.fromJson(json[r'use']),
      );
    }
    return null;
  }

  static List<PersonName>? listFromJson(dynamic json, {bool growable = false,}) {
    final result = <PersonName>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = PersonName.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, PersonName> mapFromJson(dynamic json) {
    final map = <String, PersonName>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = PersonName.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of PersonName-objects as value to a dart map
  static Map<String, List<PersonName>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<PersonName>>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = PersonName.listFromJson(entry.value, growable: growable,);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'firstNames',
    'prefix',
    'suffix',
  };
}


class PersonNameUseEnum {
  /// Instantiate a new enum with the provided [value].
  const PersonNameUseEnum._(this.value);

  /// The underlying value of this enum member.
  final String value;

  @override
  String toString() => value;

  String toJson() => value;

  static const usual = PersonNameUseEnum._(r'usual');
  static const official = PersonNameUseEnum._(r'official');
  static const temp = PersonNameUseEnum._(r'temp');
  static const nickname = PersonNameUseEnum._(r'nickname');
  static const anonymous = PersonNameUseEnum._(r'anonymous');
  static const maiden = PersonNameUseEnum._(r'maiden');
  static const old = PersonNameUseEnum._(r'old');
  static const other = PersonNameUseEnum._(r'other');

  /// List of all possible values in this [enum][PersonNameUseEnum].
  static const values = <PersonNameUseEnum>[
    usual,
    official,
    temp,
    nickname,
    anonymous,
    maiden,
    old,
    other,
  ];

  static PersonNameUseEnum? fromJson(dynamic value) => PersonNameUseEnumTypeTransformer().decode(value);

  static List<PersonNameUseEnum>? listFromJson(dynamic json, {bool growable = false,}) {
    final result = <PersonNameUseEnum>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = PersonNameUseEnum.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }
}

/// Transformation class that can [encode] an instance of [PersonNameUseEnum] to String,
/// and [decode] dynamic data back to [PersonNameUseEnum].
class PersonNameUseEnumTypeTransformer {
  factory PersonNameUseEnumTypeTransformer() => _instance ??= const PersonNameUseEnumTypeTransformer._();

  const PersonNameUseEnumTypeTransformer._();

  String encode(PersonNameUseEnum data) => data.value;

  /// Decodes a [dynamic value][data] to a PersonNameUseEnum.
  ///
  /// If [allowNull] is true and the [dynamic value][data] cannot be decoded successfully,
  /// then null is returned. However, if [allowNull] is false and the [dynamic value][data]
  /// cannot be decoded successfully, then an [UnimplementedError] is thrown.
  ///
  /// The [allowNull] is very handy when an API changes and a new enum value is added or removed,
  /// and users are still using an old app with the old code.
  PersonNameUseEnum? decode(dynamic data, {bool allowNull = true}) {
    if (data != null) {
      switch (data.toString()) {
        case r'usual': return PersonNameUseEnum.usual;
        case r'official': return PersonNameUseEnum.official;
        case r'temp': return PersonNameUseEnum.temp;
        case r'nickname': return PersonNameUseEnum.nickname;
        case r'anonymous': return PersonNameUseEnum.anonymous;
        case r'maiden': return PersonNameUseEnum.maiden;
        case r'old': return PersonNameUseEnum.old;
        case r'other': return PersonNameUseEnum.other;
        default:
          if (!allowNull) {
            throw ArgumentError('Unknown enum value to decode: $data');
          }
      }
    }
    return null;
  }

  /// Singleton [PersonNameUseEnumTypeTransformer] instance.
  static PersonNameUseEnumTypeTransformer? _instance;
}


