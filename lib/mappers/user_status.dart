import 'package:collection/collection.dart';
import 'package:icure_dart_sdk/api.dart';
import 'package:icure_medical_device_dart_sdk/api.dart';

extension UserStatusMapper on UserStatus? {
  UserDtoStatusEnum? toUserDtoStatusEnum() => UserDtoStatusEnum?.values.firstWhereOrNull((it) => it.value == this?.name);
}

extension UserDtoStatusEnumMapper on UserDtoStatusEnum? {
  UserStatus? toUserStatus() => UserStatus?.values.firstWhereOrNull((it) => it.name == this?.value);
}
