//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;


abstract class UserApi {
  UserApi([ApiClient? apiClient]) : apiClient = apiClient ?? defaultApiClient;

  final ApiClient apiClient;

  /// Check token validity for a user.
  ///
  /// Checks that the provided token is (still) valid for the provided user id (or user login).
  ///
  /// Parameters:
  ///
  /// * [String] userId (required):
  ///   The UUID that identifies the user uniquely
  ///
  /// * [String] token (required):
  ///   The token that will be checked
  Future<bool?> checkTokenValidity(String userId, String token,);

  /// Create a new user or modify an existing one.
  ///
  /// A user must have a login, an email or a mobilePhone defined, a user should be linked to either a Healthcare Professional, a Patient or a Device. When modifying an user, you must ensure that the rev obtained when getting or creating the user is present as the rev is used to guarantee that the user has not been modified by a third party.
  ///
  /// Parameters:
  ///
  /// * [User] user (required):
  ///   The user that must be created in the database.
  Future<User?> createOrModifyUser(User user,);

  /// Create a token for a user.
  ///
  /// A token is used to authenticate the user. It is just like a password but it is destined to be used by programs instead of humans. Tokens have a limited validity period (one month).
  ///
  /// Parameters:
  ///
  /// * [String] userId (required):
  ///   The UUID that identifies the user uniquely
  Future<String?> createToken(String userId,);

  /// Delete an existing user.
  ///
  /// Deletes the user identified by the provided unique userId.
  ///
  /// Parameters:
  ///
  /// * [String] userId (required):
  ///   The UUID that uniquely identifies the user to be deleted.
  Future<String?> deleteUser(String userId,);

  /// Load users from the database by filtering them using the provided Filter.
  ///
  /// Filters are complex selectors that are built by combining basic building blocks. Examples of filters available for Users are AllUsersFilter and UsersByIdsFilter. This method returns a paginated list of users (with a cursor that lets you query the following items).
  ///
  /// Parameters:
  ///
  /// * [Filter] filter (required):
  ///   The Filter object that describes which condition(s) the elements whose the ids should be returned must fulfill
  ///
  /// * [String] nextUserId:
  ///   The id of the first User in the next page
  ///
  /// * [int] limit:
  ///   The number of users to return in the queried page
  Future<PaginatedListUser?> filterUsers(Filter filter, { String? nextUserId, int? limit, });

  /// Get the details of the logged User.
  ///
  /// When you make a call to the server, an authentication token is used to identify you. This call returns the complete User object that corresponds to your authentication credentials.
  Future<User?> getLoggedUser();

  /// Get a User by id.
  ///
  /// Each user is uniquely identified by a user id. The user id is a UUID. This userId is the preferred method to retrieve one specific user.
  ///
  /// Parameters:
  ///
  /// * [String] userId (required):
  ///   The UUID that identifies the user uniquely
  Future<User?> getUser(String userId,);

  /// Load user ids from the database by filtering them using the provided Filter.
  ///
  /// Filters are complex selectors that are built by combining basic building blocks. Examples of filters available for Users are AllUsersFilter and UsersByIdsFilter. This method returns the list of the ids of the users matching the filter.
  ///
  /// Parameters:
  ///
  /// * [Filter] filter (required):
  ///   The Filter object that describes which condition(s) the elements whose the ids should be returned must fulfill
  Future<List<String>?> matchUsers(Filter filter,);
}
