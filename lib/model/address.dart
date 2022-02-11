//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of icure_medical_device_dart_sdk.api;

class Address {
  /// Returns a new [Address] instance.
  Address({
    this.addressType,
    this.description,
    this.street,
    this.houseNumber,
    this.postboxNumber,
    this.postalCode,
    this.city,
    this.state,
    this.country,
    this.note,
    this.telecoms = const [],
  });

  AddressAddressTypeEnum? addressType;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? description;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? street;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? houseNumber;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? postboxNumber;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? postalCode;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? city;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? state;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? country;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? note;

  List<Telecom> telecoms;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Address &&
          other.addressType == addressType &&
          other.description == description &&
          other.street == street &&
          other.houseNumber == houseNumber &&
          other.postboxNumber == postboxNumber &&
          other.postalCode == postalCode &&
          other.city == city &&
          other.state == state &&
          other.country == country &&
          other.note == note &&
          other.telecoms == telecoms;

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (addressType == null ? 0 : addressType!.hashCode) +
      (description == null ? 0 : description!.hashCode) +
      (street == null ? 0 : street!.hashCode) +
      (houseNumber == null ? 0 : houseNumber!.hashCode) +
      (postboxNumber == null ? 0 : postboxNumber!.hashCode) +
      (postalCode == null ? 0 : postalCode!.hashCode) +
      (city == null ? 0 : city!.hashCode) +
      (state == null ? 0 : state!.hashCode) +
      (country == null ? 0 : country!.hashCode) +
      (note == null ? 0 : note!.hashCode) +
      (telecoms.hashCode);

  @override
  String toString() =>
      'Address[addressType=$addressType, description=$description, street=$street, houseNumber=$houseNumber, postboxNumber=$postboxNumber, postalCode=$postalCode, city=$city, state=$state, country=$country, note=$note, telecoms=$telecoms]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (addressType != null) {
      json[r'addressType'] = addressType;
    }
    if (description != null) {
      json[r'description'] = description;
    }
    if (street != null) {
      json[r'street'] = street;
    }
    if (houseNumber != null) {
      json[r'houseNumber'] = houseNumber;
    }
    if (postboxNumber != null) {
      json[r'postboxNumber'] = postboxNumber;
    }
    if (postalCode != null) {
      json[r'postalCode'] = postalCode;
    }
    if (city != null) {
      json[r'city'] = city;
    }
    if (state != null) {
      json[r'state'] = state;
    }
    if (country != null) {
      json[r'country'] = country;
    }
    if (note != null) {
      json[r'note'] = note;
    }
    json[r'telecoms'] = telecoms;
    return json;
  }

  /// Returns a new [Address] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static Address? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "Address[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "Address[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return Address(
        addressType: AddressAddressTypeEnum.fromJson(json[r'addressType']),
        description: mapValueOfType<String>(json, r'description'),
        street: mapValueOfType<String>(json, r'street'),
        houseNumber: mapValueOfType<String>(json, r'houseNumber'),
        postboxNumber: mapValueOfType<String>(json, r'postboxNumber'),
        postalCode: mapValueOfType<String>(json, r'postalCode'),
        city: mapValueOfType<String>(json, r'city'),
        state: mapValueOfType<String>(json, r'state'),
        country: mapValueOfType<String>(json, r'country'),
        note: mapValueOfType<String>(json, r'note'),
        telecoms: Telecom.listFromJson(json[r'telecoms'])!,
      );
    }
    return null;
  }

  static List<Address>? listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <Address>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = Address.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, Address> mapFromJson(dynamic json) {
    final map = <String, Address>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = Address.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of Address-objects as value to a dart map
  static Map<String, List<Address>> mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String, List<Address>>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = Address.listFromJson(
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
    'telecoms',
  };
}

class AddressAddressTypeEnum {
  /// Instantiate a new enum with the provided [value].
  const AddressAddressTypeEnum._(this.value);

  /// The underlying value of this enum member.
  final String value;

  @override
  String toString() => value;

  String toJson() => value;

  static const home = AddressAddressTypeEnum._(r'home');
  static const work = AddressAddressTypeEnum._(r'work');
  static const vacation = AddressAddressTypeEnum._(r'vacation');
  static const hospital = AddressAddressTypeEnum._(r'hospital');
  static const clinic = AddressAddressTypeEnum._(r'clinic');
  static const hq = AddressAddressTypeEnum._(r'hq');
  static const other = AddressAddressTypeEnum._(r'other');
  static const temporary = AddressAddressTypeEnum._(r'temporary');
  static const postal = AddressAddressTypeEnum._(r'postal');
  static const diplomatic = AddressAddressTypeEnum._(r'diplomatic');
  static const reference = AddressAddressTypeEnum._(r'reference');

  /// List of all possible values in this [enum][AddressAddressTypeEnum].
  static const values = <AddressAddressTypeEnum>[
    home,
    work,
    vacation,
    hospital,
    clinic,
    hq,
    other,
    temporary,
    postal,
    diplomatic,
    reference,
  ];

  static AddressAddressTypeEnum? fromJson(dynamic value) => AddressAddressTypeEnumTypeTransformer().decode(value);

  static List<AddressAddressTypeEnum>? listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <AddressAddressTypeEnum>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = AddressAddressTypeEnum.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }
}

/// Transformation class that can [encode] an instance of [AddressAddressTypeEnum] to String,
/// and [decode] dynamic data back to [AddressAddressTypeEnum].
class AddressAddressTypeEnumTypeTransformer {
  factory AddressAddressTypeEnumTypeTransformer() => _instance ??= const AddressAddressTypeEnumTypeTransformer._();

  const AddressAddressTypeEnumTypeTransformer._();

  String encode(AddressAddressTypeEnum data) => data.value;

  /// Decodes a [dynamic value][data] to a AddressAddressTypeEnum.
  ///
  /// If [allowNull] is true and the [dynamic value][data] cannot be decoded successfully,
  /// then null is returned. However, if [allowNull] is false and the [dynamic value][data]
  /// cannot be decoded successfully, then an [UnimplementedError] is thrown.
  ///
  /// The [allowNull] is very handy when an API changes and a new enum value is added or removed,
  /// and users are still using an old app with the old code.
  AddressAddressTypeEnum? decode(dynamic data, {bool allowNull = true}) {
    if (data != null) {
      switch (data.toString()) {
        case r'home':
          return AddressAddressTypeEnum.home;
        case r'work':
          return AddressAddressTypeEnum.work;
        case r'vacation':
          return AddressAddressTypeEnum.vacation;
        case r'hospital':
          return AddressAddressTypeEnum.hospital;
        case r'clinic':
          return AddressAddressTypeEnum.clinic;
        case r'hq':
          return AddressAddressTypeEnum.hq;
        case r'other':
          return AddressAddressTypeEnum.other;
        case r'temporary':
          return AddressAddressTypeEnum.temporary;
        case r'postal':
          return AddressAddressTypeEnum.postal;
        case r'diplomatic':
          return AddressAddressTypeEnum.diplomatic;
        case r'reference':
          return AddressAddressTypeEnum.reference;
        default:
          if (!allowNull) {
            throw ArgumentError('Unknown enum value to decode: $data');
          }
      }
    }
    return null;
  }

  /// Singleton [AddressAddressTypeEnumTypeTransformer] instance.
  static AddressAddressTypeEnumTypeTransformer? _instance;
}
