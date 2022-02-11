//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class Partnership {
  /// Returns a new [Partnership] instance.
  Partnership({
    this.type,
    this.status,
    this.partnerId,
  });

  PartnershipTypeEnum? type;

  PartnershipStatusEnum? status;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? partnerId;

  @override
  bool operator ==(Object other) => identical(this, other) || other is Partnership &&
     other.type == type &&
     other.status == status &&
     other.partnerId == partnerId;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (type == null ? 0 : type!.hashCode) +
    (status == null ? 0 : status!.hashCode) +
    (partnerId == null ? 0 : partnerId!.hashCode);

  @override
  String toString() => 'Partnership[type=$type, status=$status, partnerId=$partnerId]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (type != null) {
      json[r'type'] = type;
    }
    if (status != null) {
      json[r'status'] = status;
    }
    if (partnerId != null) {
      json[r'partnerId'] = partnerId;
    }
    return json;
  }

  /// Returns a new [Partnership] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static Partnership? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "Partnership[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "Partnership[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return Partnership(
        type: PartnershipTypeEnum.fromJson(json[r'type']),
        status: PartnershipStatusEnum.fromJson(json[r'status']),
        partnerId: mapValueOfType<String>(json, r'partnerId'),
      );
    }
    return null;
  }

  static List<Partnership>? listFromJson(dynamic json, {bool growable = false,}) {
    final result = <Partnership>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = Partnership.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, Partnership> mapFromJson(dynamic json) {
    final map = <String, Partnership>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = Partnership.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of Partnership-objects as value to a dart map
  static Map<String, List<Partnership>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<Partnership>>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = Partnership.listFromJson(entry.value, growable: growable,);
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


class PartnershipTypeEnum {
  /// Instantiate a new enum with the provided [value].
  const PartnershipTypeEnum._(this.value);

  /// The underlying value of this enum member.
  final String value;

  @override
  String toString() => value;

  String toJson() => value;

  static const primaryContact = PartnershipTypeEnum._(r'primary_contact');
  static const primaryContactFor = PartnershipTypeEnum._(r'primary_contact_for');
  static const family = PartnershipTypeEnum._(r'family');
  static const friend = PartnershipTypeEnum._(r'friend');
  static const counselor = PartnershipTypeEnum._(r'counselor');
  static const contact = PartnershipTypeEnum._(r'contact');
  static const brother = PartnershipTypeEnum._(r'brother');
  static const brotherinlaw = PartnershipTypeEnum._(r'brotherinlaw');
  static const child = PartnershipTypeEnum._(r'child');
  static const daughter = PartnershipTypeEnum._(r'daughter');
  static const employer = PartnershipTypeEnum._(r'employer');
  static const father = PartnershipTypeEnum._(r'father');
  static const grandchild = PartnershipTypeEnum._(r'grandchild');
  static const grandparent = PartnershipTypeEnum._(r'grandparent');
  static const husband = PartnershipTypeEnum._(r'husband');
  static const lawyer = PartnershipTypeEnum._(r'lawyer');
  static const mother = PartnershipTypeEnum._(r'mother');
  static const neighbour = PartnershipTypeEnum._(r'neighbour');
  static const notary = PartnershipTypeEnum._(r'notary');
  static const partner = PartnershipTypeEnum._(r'partner');
  static const sister = PartnershipTypeEnum._(r'sister');
  static const sisterinlaw = PartnershipTypeEnum._(r'sisterinlaw');
  static const son = PartnershipTypeEnum._(r'son');
  static const spouse = PartnershipTypeEnum._(r'spouse');
  static const stepdaughter = PartnershipTypeEnum._(r'stepdaughter');
  static const stepfather = PartnershipTypeEnum._(r'stepfather');
  static const stepmother = PartnershipTypeEnum._(r'stepmother');
  static const stepson = PartnershipTypeEnum._(r'stepson');
  static const tutor = PartnershipTypeEnum._(r'tutor');
  static const nextOfKin = PartnershipTypeEnum._(r'next_of_kin');
  static const federalAgency = PartnershipTypeEnum._(r'federal_agency');
  static const insuranceCompany = PartnershipTypeEnum._(r'insurance_company');
  static const stateAgency = PartnershipTypeEnum._(r'state_agency');
  static const unknown = PartnershipTypeEnum._(r'unknown');
  static const seealso = PartnershipTypeEnum._(r'seealso');
  static const refer = PartnershipTypeEnum._(r'refer');

  /// List of all possible values in this [enum][PartnershipTypeEnum].
  static const values = <PartnershipTypeEnum>[
    primaryContact,
    primaryContactFor,
    family,
    friend,
    counselor,
    contact,
    brother,
    brotherinlaw,
    child,
    daughter,
    employer,
    father,
    grandchild,
    grandparent,
    husband,
    lawyer,
    mother,
    neighbour,
    notary,
    partner,
    sister,
    sisterinlaw,
    son,
    spouse,
    stepdaughter,
    stepfather,
    stepmother,
    stepson,
    tutor,
    nextOfKin,
    federalAgency,
    insuranceCompany,
    stateAgency,
    unknown,
    seealso,
    refer,
  ];

  static PartnershipTypeEnum? fromJson(dynamic value) => PartnershipTypeEnumTypeTransformer().decode(value);

  static List<PartnershipTypeEnum>? listFromJson(dynamic json, {bool growable = false,}) {
    final result = <PartnershipTypeEnum>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = PartnershipTypeEnum.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }
}

/// Transformation class that can [encode] an instance of [PartnershipTypeEnum] to String,
/// and [decode] dynamic data back to [PartnershipTypeEnum].
class PartnershipTypeEnumTypeTransformer {
  factory PartnershipTypeEnumTypeTransformer() => _instance ??= const PartnershipTypeEnumTypeTransformer._();

  const PartnershipTypeEnumTypeTransformer._();

  String encode(PartnershipTypeEnum data) => data.value;

  /// Decodes a [dynamic value][data] to a PartnershipTypeEnum.
  ///
  /// If [allowNull] is true and the [dynamic value][data] cannot be decoded successfully,
  /// then null is returned. However, if [allowNull] is false and the [dynamic value][data]
  /// cannot be decoded successfully, then an [UnimplementedError] is thrown.
  ///
  /// The [allowNull] is very handy when an API changes and a new enum value is added or removed,
  /// and users are still using an old app with the old code.
  PartnershipTypeEnum? decode(dynamic data, {bool allowNull = true}) {
    if (data != null) {
      switch (data.toString()) {
        case r'primary_contact': return PartnershipTypeEnum.primaryContact;
        case r'primary_contact_for': return PartnershipTypeEnum.primaryContactFor;
        case r'family': return PartnershipTypeEnum.family;
        case r'friend': return PartnershipTypeEnum.friend;
        case r'counselor': return PartnershipTypeEnum.counselor;
        case r'contact': return PartnershipTypeEnum.contact;
        case r'brother': return PartnershipTypeEnum.brother;
        case r'brotherinlaw': return PartnershipTypeEnum.brotherinlaw;
        case r'child': return PartnershipTypeEnum.child;
        case r'daughter': return PartnershipTypeEnum.daughter;
        case r'employer': return PartnershipTypeEnum.employer;
        case r'father': return PartnershipTypeEnum.father;
        case r'grandchild': return PartnershipTypeEnum.grandchild;
        case r'grandparent': return PartnershipTypeEnum.grandparent;
        case r'husband': return PartnershipTypeEnum.husband;
        case r'lawyer': return PartnershipTypeEnum.lawyer;
        case r'mother': return PartnershipTypeEnum.mother;
        case r'neighbour': return PartnershipTypeEnum.neighbour;
        case r'notary': return PartnershipTypeEnum.notary;
        case r'partner': return PartnershipTypeEnum.partner;
        case r'sister': return PartnershipTypeEnum.sister;
        case r'sisterinlaw': return PartnershipTypeEnum.sisterinlaw;
        case r'son': return PartnershipTypeEnum.son;
        case r'spouse': return PartnershipTypeEnum.spouse;
        case r'stepdaughter': return PartnershipTypeEnum.stepdaughter;
        case r'stepfather': return PartnershipTypeEnum.stepfather;
        case r'stepmother': return PartnershipTypeEnum.stepmother;
        case r'stepson': return PartnershipTypeEnum.stepson;
        case r'tutor': return PartnershipTypeEnum.tutor;
        case r'next_of_kin': return PartnershipTypeEnum.nextOfKin;
        case r'federal_agency': return PartnershipTypeEnum.federalAgency;
        case r'insurance_company': return PartnershipTypeEnum.insuranceCompany;
        case r'state_agency': return PartnershipTypeEnum.stateAgency;
        case r'unknown': return PartnershipTypeEnum.unknown;
        case r'seealso': return PartnershipTypeEnum.seealso;
        case r'refer': return PartnershipTypeEnum.refer;
        default:
          if (!allowNull) {
            throw ArgumentError('Unknown enum value to decode: $data');
          }
      }
    }
    return null;
  }

  /// Singleton [PartnershipTypeEnumTypeTransformer] instance.
  static PartnershipTypeEnumTypeTransformer? _instance;
}



class PartnershipStatusEnum {
  /// Instantiate a new enum with the provided [value].
  const PartnershipStatusEnum._(this.value);

  /// The underlying value of this enum member.
  final String value;

  @override
  String toString() => value;

  String toJson() => value;

  static const active = PartnershipStatusEnum._(r'active');
  static const complicated = PartnershipStatusEnum._(r'complicated');
  static const past = PartnershipStatusEnum._(r'past');

  /// List of all possible values in this [enum][PartnershipStatusEnum].
  static const values = <PartnershipStatusEnum>[
    active,
    complicated,
    past,
  ];

  static PartnershipStatusEnum? fromJson(dynamic value) => PartnershipStatusEnumTypeTransformer().decode(value);

  static List<PartnershipStatusEnum>? listFromJson(dynamic json, {bool growable = false,}) {
    final result = <PartnershipStatusEnum>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = PartnershipStatusEnum.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }
}

/// Transformation class that can [encode] an instance of [PartnershipStatusEnum] to String,
/// and [decode] dynamic data back to [PartnershipStatusEnum].
class PartnershipStatusEnumTypeTransformer {
  factory PartnershipStatusEnumTypeTransformer() => _instance ??= const PartnershipStatusEnumTypeTransformer._();

  const PartnershipStatusEnumTypeTransformer._();

  String encode(PartnershipStatusEnum data) => data.value;

  /// Decodes a [dynamic value][data] to a PartnershipStatusEnum.
  ///
  /// If [allowNull] is true and the [dynamic value][data] cannot be decoded successfully,
  /// then null is returned. However, if [allowNull] is false and the [dynamic value][data]
  /// cannot be decoded successfully, then an [UnimplementedError] is thrown.
  ///
  /// The [allowNull] is very handy when an API changes and a new enum value is added or removed,
  /// and users are still using an old app with the old code.
  PartnershipStatusEnum? decode(dynamic data, {bool allowNull = true}) {
    if (data != null) {
      switch (data.toString()) {
        case r'active': return PartnershipStatusEnum.active;
        case r'complicated': return PartnershipStatusEnum.complicated;
        case r'past': return PartnershipStatusEnum.past;
        default:
          if (!allowNull) {
            throw ArgumentError('Unknown enum value to decode: $data');
          }
      }
    }
    return null;
  }

  /// Singleton [PartnershipStatusEnumTypeTransformer] instance.
  static PartnershipStatusEnumTypeTransformer? _instance;
}


