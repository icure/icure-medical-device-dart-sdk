//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

import 'package:openapi/api.dart';
import 'package:test/test.dart';

// tests for User
void main() {
  // final instance = User();

  group('test User', () {
    // the Id of the user. We encourage using either a v4 UUID or a HL7 Id.
    // String id
    test('to test the property `id`', () async {
      // TODO
    });

    // the revision of the user in the database, used for conflict management / optimistic locking.
    // String rev
    test('to test the property `rev`', () async {
      // TODO
    });

    // the soft delete timestamp. When a user is ”deleted“, this is set to a non null value: the moment of the deletion
    // int deletionDate
    test('to test the property `deletionDate`', () async {
      // TODO
    });

    // the creation date of the user (encoded as epoch).
    // int created
    test('to test the property `created`', () async {
      // TODO
    });

    // Last name of the user. This is the official last name that should be used for official administrative purposes.
    // String name
    test('to test the property `name`', () async {
      // TODO
    });

    // Extra properties for the user. Those properties are typed (see class Property)
    // Set<Property> properties (default value: const {})
    test('to test the property `properties`', () async {
      // TODO
    });

    // Roles assigned to this user
    // Set<String> roles (default value: const {})
    test('to test the property `roles`', () async {
      // TODO
    });

    // Username for this user. We encourage using an email address
    // String login
    test('to test the property `login`', () async {
      // TODO
    });

    // Hashed version of the password (BCrypt is used for hashing)
    // String passwordHash
    test('to test the property `passwordHash`', () async {
      // TODO
    });

    // Secret token used to verify 2fa
    // String secret
    test('to test the property `secret`', () async {
      // TODO
    });

    // Whether the user has activated two factors authentication
    // bool use2fa
    test('to test the property `use2fa`', () async {
      // TODO
    });

    // id of the group (practice/hospital) the user is member of
    // String groupId
    test('to test the property `groupId`', () async {
      // TODO
    });

    // Id of the healthcare party if the user is a healthcare party.
    // String healthcarePartyId
    test('to test the property `healthcarePartyId`', () async {
      // TODO
    });

    // Id of the patient if the user is a patient
    // String patientId
    test('to test the property `patientId`', () async {
      // TODO
    });

    // Id of the patient if the user is a patient
    // String deviceId
    test('to test the property `deviceId`', () async {
      // TODO
    });

    // Delegations that are automatically generated client side when a new database object is created by this user
    // Map<String, Set<String>> autoDelegations (default value: const {})
    test('to test the property `autoDelegations`', () async {
      // TODO
    });

    // email address of the user (used for token exchange or password recovery).
    // String email
    test('to test the property `email`', () async {
      // TODO
    });

    // mobile phone of the user (used for token exchange or password recovery).
    // String mobilePhone
    test('to test the property `mobilePhone`', () async {
      // TODO
    });

    // Encrypted and time-limited Authentication tokens used for inter-applications authentication
    // Map<String, AuthenticationToken> authenticationTokens (default value: const {})
    test('to test the property `authenticationTokens`', () async {
      // TODO
    });


  });

}
