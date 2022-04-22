//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of icure_medical_device_dart_sdk.api;

class SystemMetaDataEncrypted {
  /// Returns a new [SystemMetaDataEncrypted] instance.
  SystemMetaDataEncrypted({
    this.secretForeignKeys = const [],
    this.cryptedForeignKeys = const {},
    this.delegations = const {},
    this.encryptionKeys = const {},
  });

  List<String> secretForeignKeys;

  Map<String, List<Delegation>> cryptedForeignKeys;

  Map<String, List<Delegation>> delegations;

  Map<String, List<Delegation>> encryptionKeys;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SystemMetaDataEncrypted &&
          UnorderedIterableEquality().equals(other.secretForeignKeys, secretForeignKeys) &&
          MapEquality(values: UnorderedIterableEquality()).equals(other.cryptedForeignKeys, cryptedForeignKeys) &&
          MapEquality(values: UnorderedIterableEquality()).equals(other.delegations, delegations) &&
          MapEquality(values: UnorderedIterableEquality()).equals(other.encryptionKeys, encryptionKeys);

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (secretForeignKeys.hashCode) + (cryptedForeignKeys.hashCode) + (delegations.hashCode) + (encryptionKeys.hashCode);

  @override
  String toString() =>
      'SystemMetaDataEncrypted[secretForeignKeys=$secretForeignKeys, cryptedForeignKeys=$cryptedForeignKeys, delegations=$delegations, encryptionKeys=$encryptionKeys]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    json[r'secretForeignKeys'] = secretForeignKeys;
    json[r'cryptedForeignKeys'] = cryptedForeignKeys;
    json[r'delegations'] = delegations;
    json[r'encryptionKeys'] = encryptionKeys;
    return json;
  }

  /// Returns a new [SystemMetaDataEncrypted] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static SystemMetaDataEncrypted? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "SystemMetaDataEncrypted[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "SystemMetaDataEncrypted[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return SystemMetaDataEncrypted(
        secretForeignKeys: json[r'secretForeignKeys'] == null ? const [] : (json[r'secretForeignKeys'] as List).cast<String>(),
        cryptedForeignKeys: json[r'cryptedForeignKeys'] == null ? const {} : Delegation.mapListFromJson(json[r'cryptedForeignKeys']),
        delegations: json[r'delegations'] == null ? const {} : Delegation.mapListFromJson(json[r'delegations']),
        encryptionKeys: json[r'encryptionKeys'] == null ? const {} : Delegation.mapListFromJson(json[r'encryptionKeys']),
      );
    }
    return null;
  }

  static List<SystemMetaDataEncrypted>? listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <SystemMetaDataEncrypted>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = SystemMetaDataEncrypted.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, SystemMetaDataEncrypted> mapFromJson(dynamic json) {
    final map = <String, SystemMetaDataEncrypted>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = SystemMetaDataEncrypted.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of SystemMetaDataEncrypted-objects as value to a dart map
  static Map<String, List<SystemMetaDataEncrypted>> mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String, List<SystemMetaDataEncrypted>>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = SystemMetaDataEncrypted.listFromJson(
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
    'secretForeignKeys',
    'cryptedForeignKeys',
    'delegations',
    'encryptionKeys',
  };
}
