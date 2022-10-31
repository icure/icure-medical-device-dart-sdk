import 'dart:io';

import 'package:icure_medical_device_dart_sdk/api.dart';
import 'package:icure_medical_device_dart_sdk/mappers/user.dart';
import 'package:icure_medical_device_dart_sdk/utils/net_utils.dart';
import "package:test/test.dart";
import 'package:uuid/uuid.dart';

import '../utils/test_utils.dart';

void main() {
  final Uuid uuid = Uuid();
  final hcpUsername = Platform.environment["HCP_2_USERNAME"]!;
  final hcpPassword = Platform.environment["HCP_2_PASSWORD"]!;
  final hcpPrivKey = Platform.environment["HCP_2_PRIV_KEY"]!;

  group('tests for UserApi', () {
    test("Updating user properties", () async {
      final masterApi = await TestUtils.medtechApi(userName: hcpUsername, userPassword: hcpPassword, userPrivKey: hcpPrivKey);
      final api = (await TestUtils.createAHcpUser(masterApi)).medTechApi;
      final currentUser = await retry(() => api.userApi.getLoggedUser(), trials: 5, delay: 1000);

      final userNewProperty = uuid.v4().toString();

      // When
      currentUser!.properties = Set.from([Property(id: "my-user-prop", type: PropertyType(type: PropertyTypeTypeEnum.STRING), typedValue: TypedValueObject(stringValue: userNewProperty, type: TypedValueObjectTypeEnum.STRING))]);
      final updatedUser = await api.userApi.createOrModifyUser(currentUser);

      // Then
      try {
        final foundProperty = updatedUser!.properties.firstWhere((prop) => userNewProperty == prop.typedValue?.stringValue);
        expect(foundProperty.id, "my-user-prop");
        expect(foundProperty.type?.type, PropertyTypeTypeEnum.STRING);
        expect(foundProperty.typedValue?.type, TypedValueObjectTypeEnum.STRING);
        expect(foundProperty.typedValue?.stringValue, userNewProperty);

      } catch (exception) {
        expect(exception == null, true);
      }
    });

    test("Mapping user", () async {
      final api = await TestUtils.medtechApi(userName: hcpUsername, userPassword: hcpPassword, userPrivKey: hcpPrivKey);

      final currentUser = await api.userApi.getLoggedUser();
      final iCureUser = UserMapper(currentUser!).toUserDto();
      final mappedUser = iCureUser.toUser();

      // Then
      expect(currentUser == mappedUser, isTrue);
    });
  });
}
