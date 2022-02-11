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


/// tests for UserApi
void main() {
  // final instance = UserApi();

  group('tests for UserApi', () {
    // Check token validity for a user.
    //
    // Checks that the provided token is (still) valid for the provided user id (or user login).
    //
    //Future<bool> checkTokenValidity(String userId, String token) async
    test('test checkTokenValidity', () async {
      // TODO
    });

    // Create a new user or modify an existing one.
    //
    // A user must have a login, an email or a mobilePhone defined, a user should be linked to either a Healthcare Professional, a Patient or a Device. When modifying an user, you must ensure that the rev obtained when getting or creating the user is present as the rev is used to guarantee that the user has not been modified by a third party.
    //
    //Future<User> createOrModifyUser(User user) async
    test('test createOrModifyUser', () async {
      // TODO
    });

    // Create a token for a user.
    //
    // A token is used to authenticate the user. It is just like a password but it is destined to be used by programs instead of humans. Tokens have a limited validity period (one month).
    //
    //Future<String> createToken(String userId) async
    test('test createToken', () async {
      // TODO
    });

    // Delete an existing user.
    //
    // Deletes the user identified by the provided unique userId.
    //
    //Future<String> deleteUser(String userId) async
    test('test deleteUser', () async {
      // TODO
    });

    // Load users from the database by filtering them using the provided Filter.
    //
    // Filters are complex selectors that are built by combining basic building blocks. Examples of filters available for Users are AllUsersFilter and UsersByIdsFilter. This method returns a paginated list of users (with a cursor that lets you query the following items).
    //
    //Future<PaginatedListUser> filterUsers(Filter filter, { String nextUserId, int limit }) async
    test('test filterUsers', () async {
      // TODO
    });

    // Get the details of the logged User.
    //
    // When you make a call to the server, an authentication token is used to identify you. This call returns the complete User object that corresponds to your authentication credentials.
    //
    //Future<User> getLoggedUser() async
    test('test getLoggedUser', () async {
      // TODO
    });

    // Get a User by id.
    //
    // Each user is uniquely identified by a user id. The user id is a UUID. This userId is the preferred method to retrieve one specific user.
    //
    //Future<User> getUser(String userId) async
    test('test getUser', () async {
      // TODO
    });

    // Load user ids from the database by filtering them using the provided Filter.
    //
    // Filters are complex selectors that are built by combining basic building blocks. Examples of filters available for Users are AllUsersFilter and UsersByIdsFilter. This method returns the list of the ids of the users matching the filter.
    //
    //Future<List<String>> matchUsers(Filter filter) async
    test('test matchUsers', () async {
      // TODO
    });

  });
}
