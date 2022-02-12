import 'package:icure_dart_sdk/api.dart' as base_api;
import 'package:icure_medical_device_dart_sdk/api.dart';
import 'package:icure_medical_device_dart_sdk/utils/functional_utils.dart';
import 'package:icure_medical_device_dart_sdk/mappers/user.dart';
import 'package:icure_medical_device_dart_sdk/mappers/filter.dart';
import 'package:icure_medical_device_dart_sdk/mappers/paginated_list.dart';
import 'package:icure_medical_device_dart_sdk/medtech_api.dart';
import 'package:uuid/uuid.dart';
import 'package:uuid/uuid_util.dart';

class UserApiImpl extends UserApi {
  UserApiImpl(this.api);

  final MedTechApi api;
  final uuid = Uuid();

  @override
  Future<bool?> checkTokenValidity(String userId, String token) => api.userApi.checkTokenValidity(userId, token);

  @override
  Future<User?> createOrModifyUser(User user) async =>
      (await (user.rev?.let((it) => api.userApi.modifyUser(user.toUserDto())) ?? api.userApi.createUser(user.toUserDto())))?.toUser();

  @override
  Future<String?> createToken(String userId) =>
      api.userApi.getToken(userId, uuid.v4(options: {'rng': UuidUtil.cryptoRNG}), tokenValidity: 3600 * 24 * 30);

  @override
  Future<String?> deleteUser(String userId) async => (await api.userApi.deleteUser(userId))?.rev ?? throwFormatException("Invalid user id");

  @override
  Future<PaginatedListUser?> filterUsers(
    Filter filter, {
    String? nextUserId,
    int? limit,
  }) async {
    return (await api.userApi.filterUsersBy(base_api.FilterChain<base_api.UserDto>(filter.toAbstractFilterDto()), startDocumentId: nextUserId, limit: limit))
        ?.toPaginatedListUser();
  }

  @override
  Future<User?> getLoggedUser() async => (await api.userApi.getCurrentUser())?.toUser();

  @override
  Future<User?> getUser(String userId) async => (await api.userApi.getUser(userId))?.toUser();

  @override
  Future<List<String>?> matchUsers(Filter filter) => api.userApi.matchUsersBy(filter.toAbstractFilterDto());
}
