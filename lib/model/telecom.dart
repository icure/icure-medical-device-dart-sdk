//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of icure_medical_device_dart_sdk.api;

class Telecom {
  /// Returns a new [Telecom] instance.
  Telecom({
    this.telecomType,
    this.telecomNumber,
    this.telecomDescription,
  });

  TelecomTelecomTypeEnum? telecomType;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? telecomNumber;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? telecomDescription;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Telecom && other.telecomType == telecomType && other.telecomNumber == telecomNumber && other.telecomDescription == telecomDescription;

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (telecomType == null ? 0 : telecomType!.hashCode) +
      (telecomNumber == null ? 0 : telecomNumber!.hashCode) +
      (telecomDescription == null ? 0 : telecomDescription!.hashCode);

  @override
  String toString() => 'Telecom[telecomType=$telecomType, telecomNumber=$telecomNumber, telecomDescription=$telecomDescription]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (telecomType != null) {
      json[r'telecomType'] = telecomType;
    }
    if (telecomNumber != null) {
      json[r'telecomNumber'] = telecomNumber;
    }
    if (telecomDescription != null) {
      json[r'telecomDescription'] = telecomDescription;
    }
    return json;
  }

  /// Returns a new [Telecom] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static Telecom? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "Telecom[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "Telecom[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return Telecom(
        telecomType: TelecomTelecomTypeEnum.fromJson(json[r'telecomType']),
        telecomNumber: mapValueOfType<String>(json, r'telecomNumber'),
        telecomDescription: mapValueOfType<String>(json, r'telecomDescription'),
      );
    }
    return null;
  }

  static List<Telecom>? listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <Telecom>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = Telecom.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, Telecom> mapFromJson(dynamic json) {
    final map = <String, Telecom>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = Telecom.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of Telecom-objects as value to a dart map
  static Map<String, List<Telecom>> mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String, List<Telecom>>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = Telecom.listFromJson(
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

class TelecomTelecomTypeEnum {
  /// Instantiate a new enum with the provided [value].
  const TelecomTelecomTypeEnum._(this.value);

  /// The underlying value of this enum member.
  final String value;

  @override
  String toString() => value;

  String toJson() => value;

  static const mobile = TelecomTelecomTypeEnum._(r'mobile');
  static const phone = TelecomTelecomTypeEnum._(r'phone');
  static const email = TelecomTelecomTypeEnum._(r'email');
  static const fax = TelecomTelecomTypeEnum._(r'fax');
  static const skype = TelecomTelecomTypeEnum._(r'skype');
  static const im = TelecomTelecomTypeEnum._(r'im');
  static const medibridge = TelecomTelecomTypeEnum._(r'medibridge');
  static const ehealthbox = TelecomTelecomTypeEnum._(r'ehealthbox');
  static const apicrypt = TelecomTelecomTypeEnum._(r'apicrypt');
  static const web = TelecomTelecomTypeEnum._(r'web');
  static const print = TelecomTelecomTypeEnum._(r'print');
  static const disk = TelecomTelecomTypeEnum._(r'disk');
  static const other = TelecomTelecomTypeEnum._(r'other');
  static const pager = TelecomTelecomTypeEnum._(r'pager');

  /// List of all possible values in this [enum][TelecomTelecomTypeEnum].
  static const values = <TelecomTelecomTypeEnum>[
    mobile,
    phone,
    email,
    fax,
    skype,
    im,
    medibridge,
    ehealthbox,
    apicrypt,
    web,
    print,
    disk,
    other,
    pager,
  ];

  static TelecomTelecomTypeEnum? fromJson(dynamic value) => TelecomTelecomTypeEnumTypeTransformer().decode(value);

  static List<TelecomTelecomTypeEnum>? listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <TelecomTelecomTypeEnum>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = TelecomTelecomTypeEnum.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }
}

/// Transformation class that can [encode] an instance of [TelecomTelecomTypeEnum] to String,
/// and [decode] dynamic data back to [TelecomTelecomTypeEnum].
class TelecomTelecomTypeEnumTypeTransformer {
  factory TelecomTelecomTypeEnumTypeTransformer() => _instance ??= const TelecomTelecomTypeEnumTypeTransformer._();

  const TelecomTelecomTypeEnumTypeTransformer._();

  String encode(TelecomTelecomTypeEnum data) => data.value;

  /// Decodes a [dynamic value][data] to a TelecomTelecomTypeEnum.
  ///
  /// If [allowNull] is true and the [dynamic value][data] cannot be decoded successfully,
  /// then null is returned. However, if [allowNull] is false and the [dynamic value][data]
  /// cannot be decoded successfully, then an [UnimplementedError] is thrown.
  ///
  /// The [allowNull] is very handy when an API changes and a new enum value is added or removed,
  /// and users are still using an old app with the old code.
  TelecomTelecomTypeEnum? decode(dynamic data, {bool allowNull = true}) {
    if (data != null) {
      switch (data.toString()) {
        case r'mobile':
          return TelecomTelecomTypeEnum.mobile;
        case r'phone':
          return TelecomTelecomTypeEnum.phone;
        case r'email':
          return TelecomTelecomTypeEnum.email;
        case r'fax':
          return TelecomTelecomTypeEnum.fax;
        case r'skype':
          return TelecomTelecomTypeEnum.skype;
        case r'im':
          return TelecomTelecomTypeEnum.im;
        case r'medibridge':
          return TelecomTelecomTypeEnum.medibridge;
        case r'ehealthbox':
          return TelecomTelecomTypeEnum.ehealthbox;
        case r'apicrypt':
          return TelecomTelecomTypeEnum.apicrypt;
        case r'web':
          return TelecomTelecomTypeEnum.web;
        case r'print':
          return TelecomTelecomTypeEnum.print;
        case r'disk':
          return TelecomTelecomTypeEnum.disk;
        case r'other':
          return TelecomTelecomTypeEnum.other;
        case r'pager':
          return TelecomTelecomTypeEnum.pager;
        default:
          if (!allowNull) {
            throw ArgumentError('Unknown enum value to decode: $data');
          }
      }
    }
    return null;
  }

  /// Singleton [TelecomTelecomTypeEnumTypeTransformer] instance.
  static TelecomTelecomTypeEnumTypeTransformer? _instance;
}
