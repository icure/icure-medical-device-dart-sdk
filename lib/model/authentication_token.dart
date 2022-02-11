//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class AuthenticationToken {
  /// Returns a new [AuthenticationToken] instance.
  AuthenticationToken({
    required this.token,
    required this.creationTime,
    required this.validity,
  });

  /// Encrypted token
  String token;

  /// Validity starting time of the token
  int creationTime;

  /// Token validity in seconds
  int validity;

  @override
  bool operator ==(Object other) => identical(this, other) || other is AuthenticationToken &&
     other.token == token &&
     other.creationTime == creationTime &&
     other.validity == validity;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (token.hashCode) +
    (creationTime.hashCode) +
    (validity.hashCode);

  @override
  String toString() => 'AuthenticationToken[token=$token, creationTime=$creationTime, validity=$validity]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
      json[r'token'] = token;
      json[r'creationTime'] = creationTime;
      json[r'validity'] = validity;
    return json;
  }

  /// Returns a new [AuthenticationToken] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static AuthenticationToken? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "AuthenticationToken[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "AuthenticationToken[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return AuthenticationToken(
        token: mapValueOfType<String>(json, r'token')!,
        creationTime: mapValueOfType<int>(json, r'creationTime')!,
        validity: mapValueOfType<int>(json, r'validity')!,
      );
    }
    return null;
  }

  static List<AuthenticationToken>? listFromJson(dynamic json, {bool growable = false,}) {
    final result = <AuthenticationToken>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = AuthenticationToken.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, AuthenticationToken> mapFromJson(dynamic json) {
    final map = <String, AuthenticationToken>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = AuthenticationToken.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of AuthenticationToken-objects as value to a dart map
  static Map<String, List<AuthenticationToken>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<AuthenticationToken>>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = AuthenticationToken.listFromJson(entry.value, growable: growable,);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'token',
    'creationTime',
    'validity',
  };
}

