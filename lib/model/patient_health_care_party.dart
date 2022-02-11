//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class PatientHealthCareParty {
  /// Returns a new [PatientHealthCareParty] instance.
  PatientHealthCareParty({
    required this.type,
    this.healthcarePartyId,
  });

  PatientHealthCarePartyTypeEnum type;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? healthcarePartyId;

  @override
  bool operator ==(Object other) => identical(this, other) || other is PatientHealthCareParty &&
     other.type == type &&
     other.healthcarePartyId == healthcarePartyId;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (type.hashCode) +
    (healthcarePartyId == null ? 0 : healthcarePartyId!.hashCode);

  @override
  String toString() => 'PatientHealthCareParty[type=$type, healthcarePartyId=$healthcarePartyId]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
      json[r'type'] = type;
    if (healthcarePartyId != null) {
      json[r'healthcarePartyId'] = healthcarePartyId;
    }
    return json;
  }

  /// Returns a new [PatientHealthCareParty] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static PatientHealthCareParty? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "PatientHealthCareParty[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "PatientHealthCareParty[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return PatientHealthCareParty(
        type: PatientHealthCarePartyTypeEnum.fromJson(json[r'type'])!,
        healthcarePartyId: mapValueOfType<String>(json, r'healthcarePartyId'),
      );
    }
    return null;
  }

  static List<PatientHealthCareParty>? listFromJson(dynamic json, {bool growable = false,}) {
    final result = <PatientHealthCareParty>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = PatientHealthCareParty.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, PatientHealthCareParty> mapFromJson(dynamic json) {
    final map = <String, PatientHealthCareParty>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = PatientHealthCareParty.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of PatientHealthCareParty-objects as value to a dart map
  static Map<String, List<PatientHealthCareParty>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<PatientHealthCareParty>>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = PatientHealthCareParty.listFromJson(entry.value, growable: growable,);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'type',
  };
}


class PatientHealthCarePartyTypeEnum {
  /// Instantiate a new enum with the provided [value].
  const PatientHealthCarePartyTypeEnum._(this.value);

  /// The underlying value of this enum member.
  final String value;

  @override
  String toString() => value;

  String toJson() => value;

  static const doctor = PatientHealthCarePartyTypeEnum._(r'doctor');
  static const referral = PatientHealthCarePartyTypeEnum._(r'referral');
  static const medicalhouse = PatientHealthCarePartyTypeEnum._(r'medicalhouse');
  static const retirementhome = PatientHealthCarePartyTypeEnum._(r'retirementhome');
  static const hospital = PatientHealthCarePartyTypeEnum._(r'hospital');
  static const other = PatientHealthCarePartyTypeEnum._(r'other');
  static const referringphysician = PatientHealthCarePartyTypeEnum._(r'referringphysician');
  static const managingorganization = PatientHealthCarePartyTypeEnum._(r'managingorganization');

  /// List of all possible values in this [enum][PatientHealthCarePartyTypeEnum].
  static const values = <PatientHealthCarePartyTypeEnum>[
    doctor,
    referral,
    medicalhouse,
    retirementhome,
    hospital,
    other,
    referringphysician,
    managingorganization,
  ];

  static PatientHealthCarePartyTypeEnum? fromJson(dynamic value) => PatientHealthCarePartyTypeEnumTypeTransformer().decode(value);

  static List<PatientHealthCarePartyTypeEnum>? listFromJson(dynamic json, {bool growable = false,}) {
    final result = <PatientHealthCarePartyTypeEnum>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = PatientHealthCarePartyTypeEnum.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }
}

/// Transformation class that can [encode] an instance of [PatientHealthCarePartyTypeEnum] to String,
/// and [decode] dynamic data back to [PatientHealthCarePartyTypeEnum].
class PatientHealthCarePartyTypeEnumTypeTransformer {
  factory PatientHealthCarePartyTypeEnumTypeTransformer() => _instance ??= const PatientHealthCarePartyTypeEnumTypeTransformer._();

  const PatientHealthCarePartyTypeEnumTypeTransformer._();

  String encode(PatientHealthCarePartyTypeEnum data) => data.value;

  /// Decodes a [dynamic value][data] to a PatientHealthCarePartyTypeEnum.
  ///
  /// If [allowNull] is true and the [dynamic value][data] cannot be decoded successfully,
  /// then null is returned. However, if [allowNull] is false and the [dynamic value][data]
  /// cannot be decoded successfully, then an [UnimplementedError] is thrown.
  ///
  /// The [allowNull] is very handy when an API changes and a new enum value is added or removed,
  /// and users are still using an old app with the old code.
  PatientHealthCarePartyTypeEnum? decode(dynamic data, {bool allowNull = true}) {
    if (data != null) {
      switch (data.toString()) {
        case r'doctor': return PatientHealthCarePartyTypeEnum.doctor;
        case r'referral': return PatientHealthCarePartyTypeEnum.referral;
        case r'medicalhouse': return PatientHealthCarePartyTypeEnum.medicalhouse;
        case r'retirementhome': return PatientHealthCarePartyTypeEnum.retirementhome;
        case r'hospital': return PatientHealthCarePartyTypeEnum.hospital;
        case r'other': return PatientHealthCarePartyTypeEnum.other;
        case r'referringphysician': return PatientHealthCarePartyTypeEnum.referringphysician;
        case r'managingorganization': return PatientHealthCarePartyTypeEnum.managingorganization;
        default:
          if (!allowNull) {
            throw ArgumentError('Unknown enum value to decode: $data');
          }
      }
    }
    return null;
  }

  /// Singleton [PatientHealthCarePartyTypeEnumTypeTransformer] instance.
  static PatientHealthCarePartyTypeEnumTypeTransformer? _instance;
}


