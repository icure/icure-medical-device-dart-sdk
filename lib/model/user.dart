//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of icure_medical_device_dart_sdk.api;

class User {
  /// Returns a new [User] instance.
  User(
      {this.id,
      this.rev,
      this.deletionDate,
      this.created,
      this.name,
      this.properties = const {},
      this.roles = const {},
      this.login,
      this.passwordHash,
      this.secret,
      this.use2fa,
      this.groupId,
      this.healthcarePartyId,
      this.patientId,
      this.deviceId,
      this.autoDelegations = const {},
      this.email,
      this.mobilePhone,
      this.authenticationTokens = const {},
      this.status});

  /// the Id of the user. We encourage using either a v4 UUID or a HL7 Id.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? id;

  /// the revision of the user in the database, used for conflict management / optimistic locking.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? rev;

  /// the soft delete timestamp. When a user is ”deleted“, this is set to a non null value: the moment of the deletion
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? deletionDate;

  /// the creation date of the user (encoded as epoch).
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? created;

  /// Last name of the user. This is the official last name that should be used for official administrative purposes.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? name;

  /// Extra properties for the user. Those properties are typed (see class Property)
  Set<Property> properties;

  /// Roles assigned to this user
  Set<String> roles;

  /// Username for this user. We encourage using an email address
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? login;

  /// Hashed version of the password (BCrypt is used for hashing)
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? passwordHash;

  /// Secret token used to verify 2fa
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? secret;

  /// Whether the user has activated two factors authentication
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  bool? use2fa;

  /// id of the group (practice/hospital) the user is member of
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? groupId;

  /// Id of the healthcare party if the user is a healthcare party.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? healthcarePartyId;

  /// Id of the patient if the user is a patient
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? patientId;

  /// Id of the patient if the user is a patient
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? deviceId;

  /// Delegations that are automatically generated client side when a new database object is created by this user
  Map<String, Set<String>> autoDelegations;

  /// email address of the user (used for token exchange or password recovery).
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? email;

  /// mobile phone of the user (used for token exchange or password recovery).
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? mobilePhone;

  /// Encrypted and time-limited Authentication tokens used for inter-applications authentication
  Map<String, AuthenticationToken> authenticationTokens;

  ///Status of the current user
  UserStatus? status;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is User &&
          other.id == id &&
          other.rev == rev &&
          other.deletionDate == deletionDate &&
          other.created == created &&
          other.name == name &&
          SetEquality().equals(other.properties, properties) &&
          SetEquality().equals(other.roles, roles) &&
          other.login == login &&
          other.passwordHash == passwordHash &&
          other.secret == secret &&
          other.use2fa == use2fa &&
          other.groupId == groupId &&
          other.healthcarePartyId == healthcarePartyId &&
          other.patientId == patientId &&
          other.deviceId == deviceId &&
          MapEquality(values: SetEquality()).equals(other.autoDelegations, autoDelegations) &&
          other.email == email &&
          other.mobilePhone == mobilePhone &&
          MapEquality().equals(other.authenticationTokens, authenticationTokens) &&
          other.status == status;

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (id == null ? 0 : id!.hashCode) +
      (rev == null ? 0 : rev!.hashCode) +
      (deletionDate == null ? 0 : deletionDate!.hashCode) +
      (created == null ? 0 : created!.hashCode) +
      (name == null ? 0 : name!.hashCode) +
      (properties.hashCode) +
      (roles.hashCode) +
      (login == null ? 0 : login!.hashCode) +
      (passwordHash == null ? 0 : passwordHash!.hashCode) +
      (secret == null ? 0 : secret!.hashCode) +
      (use2fa == null ? 0 : use2fa!.hashCode) +
      (groupId == null ? 0 : groupId!.hashCode) +
      (healthcarePartyId == null ? 0 : healthcarePartyId!.hashCode) +
      (patientId == null ? 0 : patientId!.hashCode) +
      (deviceId == null ? 0 : deviceId!.hashCode) +
      (autoDelegations.hashCode) +
      (email == null ? 0 : email!.hashCode) +
      (mobilePhone == null ? 0 : mobilePhone!.hashCode) +
      (authenticationTokens.hashCode) +
      (status?.hashCode ?? 0);

  @override
  String toString() =>
      'User[id=$id, rev=$rev, deletionDate=$deletionDate, created=$created, name=$name, properties=$properties, roles=$roles, login=$login, passwordHash=$passwordHash, secret=$secret, use2fa=$use2fa, groupId=$groupId, healthcarePartyId=$healthcarePartyId, patientId=$patientId, deviceId=$deviceId, autoDelegations=$autoDelegations, email=$email, mobilePhone=$mobilePhone, authenticationTokens=$authenticationTokens, status=$status]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (id != null) {
      json[r'id'] = id;
    }
    if (rev != null) {
      json[r'rev'] = rev;
    }
    if (deletionDate != null) {
      json[r'deletionDate'] = deletionDate;
    }
    if (created != null) {
      json[r'created'] = created;
    }
    if (name != null) {
      json[r'name'] = name;
    }
    json[r'properties'] = properties.toList();
    json[r'roles'] = roles.toList();
    if (login != null) {
      json[r'login'] = login;
    }
    if (passwordHash != null) {
      json[r'passwordHash'] = passwordHash;
    }
    if (secret != null) {
      json[r'secret'] = secret;
    }
    if (use2fa != null) {
      json[r'use2fa'] = use2fa;
    }
    if (groupId != null) {
      json[r'groupId'] = groupId;
    }
    if (healthcarePartyId != null) {
      json[r'healthcarePartyId'] = healthcarePartyId;
    }
    if (patientId != null) {
      json[r'patientId'] = patientId;
    }
    if (deviceId != null) {
      json[r'deviceId'] = deviceId;
    }
    json[r'autoDelegations'] = autoDelegations.map((k, v) => MapEntry(k, v.toList()));
    if (email != null) {
      json[r'email'] = email;
    }
    if (mobilePhone != null) {
      json[r'mobilePhone'] = mobilePhone;
    }
    json[r'authenticationTokens'] = authenticationTokens;
    if (status != null) {
      json[r'status'] = status;
    }
    return json;
  }

  /// Returns a new [User] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static User? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "User[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "User[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return User(
        id: mapValueOfType<String>(json, r'id'),
        rev: mapValueOfType<String>(json, r'rev'),
        deletionDate: mapValueOfType<int>(json, r'deletionDate'),
        created: mapValueOfType<int>(json, r'created'),
        name: mapValueOfType<String>(json, r'name'),
        properties: Property.listFromJson(json[r'properties'])!.toSet(),
        roles: json[r'roles'] is Set
            ? (json[r'roles'] as Set).cast<String>()
            : json[r'roles'] is List
                ? ((json[r'roles'] as List).toSet()).cast<String>()
                : const {},
        login: mapValueOfType<String>(json, r'login'),
        passwordHash: mapValueOfType<String>(json, r'passwordHash'),
        secret: mapValueOfType<String>(json, r'secret'),
        use2fa: mapValueOfType<bool>(json, r'use2fa'),
        groupId: mapValueOfType<String>(json, r'groupId'),
        healthcarePartyId: mapValueOfType<String>(json, r'healthcarePartyId'),
        patientId: mapValueOfType<String>(json, r'patientId'),
        deviceId: mapValueOfType<String>(json, r'deviceId'),
        autoDelegations: json[r'autoDelegations'] == null ? const {} : mapWithSetOfStringsFromJson(json[r'autoDelegations']),
        email: mapValueOfType<String>(json, r'email'),
        mobilePhone: mapValueOfType<String>(json, r'mobilePhone'),
        authenticationTokens: mapValueOfType<Map<String, AuthenticationToken>>(json, r'authenticationTokens')!,
        status: mapValueOfType<UserStatus>(json, r'status'),
      );
    }
    return null;
  }

  static List<User>? listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <User>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = User.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, User> mapFromJson(dynamic json) {
    final map = <String, User>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = User.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of User-objects as value to a dart map
  static Map<String, List<User>> mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String, List<User>>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = User.listFromJson(
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
    'properties',
    'roles',
    'autoDelegations',
    'authenticationTokens',
  };
}
