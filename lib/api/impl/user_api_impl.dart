// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of icure_medical_device_dart_sdk.api;

class UserApiImpl extends UserApi {
  UserApiImpl(this.api);

  final MedTechApi api;

  final uuid = Uuid();

  @override
  Future<bool?> checkTokenValidity(String userId, String token) => api.baseUserApi.checkTokenValidity(userId, token);

  @override
  Future<User?> createOrModifyUser(User user) async {
    if (user.rev != null) {
      final modifiedUser = user.toUserDto();
      final userToUpdate = await _constraintsUserModificationsBasedOnCurrentUserPermission(modifiedUser);

      return (await api.baseUserApi.modifyUser(userToUpdate))?.toUser()
        ?? (throw StateError("Cannot modify user with id ${user.id}"));
    } else {
      return (await api.baseUserApi.createUser(user.toUserDto()))?.toUser()
        ?? (throw StateError("Cannot create user"));
    }
  }

  Future<UserDto> _constraintsUserModificationsBasedOnCurrentUserPermission(UserDto modifiedUser) async {
    final currentUser = (await api.baseUserApi.getCurrentUser())
        ?? (throw StateError("There is no user currently logged in. You must call this method from an authenticated MedTechApi"));

    if (currentUser.permissions.any((permission) => permission.grants.any((grant) => grant.type == PermissionItemDtoTypeEnum.ADMIN))) {
      return modifiedUser;
    } else if (currentUser.healthcarePartyId != null) {
      final userToUpdate = await api.baseUserApi.getUser(modifiedUser.id);

      userToUpdate!.deletionDate = modifiedUser.deletionDate;
      userToUpdate.name = modifiedUser.name;
      userToUpdate.properties = modifiedUser.properties;
      userToUpdate.roles = modifiedUser.roles;
      userToUpdate.login = modifiedUser.login;
      userToUpdate.secret = modifiedUser.secret;
      userToUpdate.passwordHash = modifiedUser.passwordHash;
      userToUpdate.email = modifiedUser.email;
      userToUpdate.autoDelegations = modifiedUser.autoDelegations;
      userToUpdate.termsOfUseDate = modifiedUser.termsOfUseDate;
      userToUpdate.groupId = modifiedUser.groupId;
      userToUpdate.patientId = modifiedUser.patientId;
      userToUpdate.use2fa = modifiedUser.use2fa;
      userToUpdate.applicationTokens = modifiedUser.applicationTokens;
      userToUpdate.authenticationTokens = modifiedUser.authenticationTokens;

      return userToUpdate;
    } else {
      final userToUpdate = await api.baseUserApi.getUser(modifiedUser.id);

      userToUpdate!.passwordHash = modifiedUser.passwordHash;
      userToUpdate.email = modifiedUser.email;
      userToUpdate.autoDelegations = modifiedUser.autoDelegations;
      userToUpdate.termsOfUseDate = modifiedUser.termsOfUseDate;
      userToUpdate.properties = modifiedUser.properties;

      return userToUpdate;
    }
  }

  @override
  Future<String?> createToken(
      String userId, {
        Duration validity = const Duration(days: 30),
      }) =>
      api.baseUserApi.getToken(userId, uuid.v4(options: {'rng': UuidUtil.cryptoRNG}), tokenValidity: validity.inSeconds);

  @override
  Future<String?> deleteUser(String userId) async => (await api.baseUserApi.deleteUser(userId))?.rev ?? throwFormatException("Invalid user id");

  @override
  Future<PaginatedListUser?> filterUsers(
      Filter<User> filter, {
        String? nextUserId,
        int? limit,
      }) async {
    return (await api.baseUserApi
        .filterUsersBy(base_api.FilterChain<base_api.UserDto>(filter.toAbstractFilterDto()), startDocumentId: nextUserId, limit: limit))
        ?.toPaginatedListUser();
  }

  @override
  Future<User?> getLoggedUser() async => (await api.baseUserApi.getCurrentUser())?.toUser();

  @override
  Future<User?> getUser(String userId) async => (await api.baseUserApi.getUser(userId))?.toUser();

  @override
  Future<User?> getUserByEmail(String email) async => (await api.baseUserApi.getUserByEmail(email))?.toUser();

  @override
  Future<List<String>?> matchUsers(Filter filter) => api.baseUserApi.matchUsersBy(filter.toAbstractFilterDto());
}
