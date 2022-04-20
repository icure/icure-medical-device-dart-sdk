import 'package:icure_medical_device_dart_sdk/api.dart';
import 'package:icure_medical_device_dart_sdk/mappers/user.dart';
import "package:test/test.dart";
import 'package:uuid/uuid.dart';

import '../utils/test_utils.dart';

void main() {
  final Uuid uuid = Uuid();

  group('tests for PatientApi', () {
    test("Updating user properties", () async {
      final api = await TestUtils.getApiFromCredentialsToken(credentialsFilePath: "hcp_test-n8joty04x_kino.json");

      final currentUser = await api.userApi.getLoggedUser();
      currentUser!.properties
          .add(Property(type: PropertyType(type: PropertyTypeTypeEnum.STRING), typedValue: TypedValueObject(stringValue: uuid.v4().toString())));
      final updatedUser = await api.userApi.createOrModifyUser(currentUser);

      // Then
      currentUser.rev = null;
      updatedUser?.rev = null;
      expect(currentUser, updatedUser);
    });

    test("Mapping user", () async {
      final api = await TestUtils.getApiFromCredentialsToken(credentialsFilePath: "hcp_test-n8joty04x_kino.json");

      final currentUser = await api.userApi.getLoggedUser();
      final iCureUser = UserMapper(currentUser!).toUserDto();
      final mappedUser = iCureUser.toUser();

      // Then
      assert(currentUser == mappedUser);
    });
  });
}
