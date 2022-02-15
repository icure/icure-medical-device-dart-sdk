@Timeout(Duration(hours: 1))
import 'dart:convert';
import 'dart:io';

import 'package:icure_dart_sdk/util/binary_utils.dart';
import 'package:icure_medical_device_dart_sdk/api.dart';
import "package:test/test.dart";
import 'package:uuid/uuid.dart';
import 'package:uuid/uuid_util.dart';

void main() {
  final Uuid uuid = Uuid();

  Future<MedTechApi> medtechApi() async {
    final MedTechApiBuilder builder = MedTechApiBuilder();
    builder.iCureBasePath = 'https://kraken.icure.dev';
    builder.userName = 'abdemotst2';
    builder.password = '27b90f6e-6847-44bf-b90f-6e6847b4bf1c';

    var fileUri = Uri.file("test/resources/keys/782f1bcd-9f3f-408a-af1b-cd9f3f908a98-icc-priv.2048.key", windows: false);
    var hcpKeyFile = File.fromUri(fileUri);

    builder.addKeyPair("782f1bcd-9f3f-408a-af1b-cd9f3f908a98", (await hcpKeyFile.readAsString(encoding: utf8)).toPrivateKey());

    return builder.build();
  }

  group('tests for MedicalDeviceApi', () {
    test('test createDevice CREATE', () async {
      // Init
      final MedTechApi api = await medtechApi();
      final MedicalDeviceApi deviceApi = MedicalDeviceApiImpl(api);

      final MedicalDevice device = MedicalDevice(
          id: uuid.v4(options: {'rng': UuidUtil.cryptoRNG}),
          brand: 'Apple',
          model: '13 Pro',
          type: 'iPhone');

      // When
      final MedicalDevice? createdDevice = await deviceApi.createOrModifyMedicalDevice(device);

      // Then
      expect(createdDevice!.id, device.id);
      expect(createdDevice.brand, device.brand);
      expect(createdDevice.type, device.type);
      expect(createdDevice.model, device.model);
    });

    test('test getDevice', () async {
      // Init
      final MedTechApi api = await medtechApi();
      final MedicalDeviceApi deviceApi = MedicalDeviceApiImpl(api);

      final MedicalDevice device = MedicalDevice(
          id: uuid.v4(options: {'rng': UuidUtil.cryptoRNG}),
          brand: 'Apple',
          model: '13 Pro',
          type: 'iPhone');

      // When
      final MedicalDevice? createdDevice = await deviceApi.createOrModifyMedicalDevice(device);
      final MedicalDevice? gotDevice = await deviceApi.getMedicalDevice(createdDevice!.id!);

      // Then
      expect(createdDevice.id, gotDevice!.id);
      expect(createdDevice.brand, gotDevice.brand);
      expect(createdDevice.type, gotDevice.type);
      expect(createdDevice.model, gotDevice.model);
    });

    test('test createDevice UPDATE', () async {
      // Init
      final MedTechApi api = await medtechApi();
      final MedicalDeviceApi deviceApi = MedicalDeviceApiImpl(api);
      final updateModel = "14";

      final MedicalDevice device = MedicalDevice(
          id: uuid.v4(options: {'rng': UuidUtil.cryptoRNG}),
          brand: 'Apple',
          model: '13 Pro',
          type: 'iPhone'
      );

      // When
      final MedicalDevice? createdDevice = await deviceApi.createOrModifyMedicalDevice(device);
      createdDevice!.model = updateModel;
      final MedicalDevice? updatedDevice = await deviceApi.createOrModifyMedicalDevice(createdDevice);

      // Then
      expect(createdDevice.id, device.id);
      expect(createdDevice.brand, device.brand);
      expect(createdDevice.type, device.type);
      assert(device.model != updatedDevice!.model);
      assert(createdDevice.rev != updatedDevice!.rev);
      expect(createdDevice.model, updateModel);
    });

    test('test deleteDevice', () async {
      // Init
      final MedTechApi api = await medtechApi();
      final MedicalDeviceApi deviceApi = MedicalDeviceApiImpl(api);

      final MedicalDevice device = MedicalDevice(
          id: uuid.v4(options: {'rng': UuidUtil.cryptoRNG}),
          brand: 'Apple',
          model: '13 Pro',
          type: 'iPhone'
      );

      // When
      final MedicalDevice? createdDevice = await deviceApi.createOrModifyMedicalDevice(device);
      final String? deletedDeviceRev = await deviceApi.deleteMedicalDevice(createdDevice!.id!);

      // Then
      assert(deletedDeviceRev != null);
    });
  });
}
