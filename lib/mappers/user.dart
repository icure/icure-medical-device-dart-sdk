//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

import 'package:icure_dart_sdk/api.dart';
import 'package:icure_medical_device_dart_sdk/api.dart';
import 'package:icure_medical_device_dart_sdk/utils/functional_utils.dart';
import 'package:uuid/uuid.dart';
import 'package:uuid/uuid_util.dart';

import 'authentication_token.dart';
import 'property.dart';

final uuid = Uuid();

extension UserDtoMapper on UserDto {
  User toUser() =>
      User(
        id: this.id,
        properties: this.properties.map((it) => it.toProperty()).toSet(),
        roles: this.roles,
        autoDelegations: this.autoDelegations,
        rev: this.rev,
        deletionDate: this.deletionDate,
        created: this.created,
        name: this.name,
        login: this.login,
        passwordHash: this.passwordHash,
        secret: this.secret,
        use2fa: this.use2fa,
        groupId: this.groupId,
        healthcarePartyId: this.healthcarePartyId,
        patientId: this.patientId,
        deviceId: this.deviceId,
        email: this.email,
        mobilePhone: this.mobilePhone,
      );

  String findDataOwnerId() {
    final id = this.healthcarePartyId
        ?? this.patientId
        ?? this.deviceId;

    if (id == null) {
      throw FormatException("At least one of healthcarePartyId, patientId, deviceId must be defined on user");
    }

    return id;
  }

}
extension UserMapper on User {
  UserDto toUserDto() =>
      UserDto(
        id: this.id?.also((it) {
          if (!Uuid.isValidUUID(fromString: it)) {
            throw FormatException("Invalid id, id must be a valid UUID");
          }
        }) ?? uuid.v4(options: {'rng': UuidUtil.cryptoRNG}),
        properties: this.properties.map((it) => it.toPropertyStubDto()).toSet(),
        roles: this.roles,
        autoDelegations: this.autoDelegations,
        authenticationTokens: this.authenticationTokens.map((k,v) => MapEntry(k, v.toAuthenticationTokenDto())),
        rev: this.rev,
        deletionDate: this.deletionDate,
        created: this.created,
        name: this.name,
        login: this.login,
        passwordHash: this.passwordHash,
        secret: this.secret,
        use2fa: this.use2fa,
        groupId: this.groupId,
        healthcarePartyId: this.healthcarePartyId,
        patientId: this.patientId,
        deviceId: this.deviceId,
        email: this.email,
        mobilePhone: this.mobilePhone,
      );
}
