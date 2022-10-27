@Timeout(Duration(hours: 1))
import 'dart:io';

import 'package:icure_medical_device_dart_sdk/api.dart';
import "package:test/test.dart";
import 'package:uuid/uuid.dart';
import 'package:uuid/uuid_util.dart';

import '../utils/test_utils.dart';

final Uuid uuid = Uuid();

void main() {

  MedTechApi? api;

  MedicalDevice getMedicalDevice() {
    final hcpKeys = generateRandomPrivateAndPublicKeyPair();
    return MedicalDevice(
      id: uuid.v4(options: {'rng': UuidUtil.cryptoRNG}),
      brand: 'Apple',
      model: '13 Pro',
      type: 'iPhone',
      systemMetaData: new SystemMetaDataOwner(
        publicKey: hcpKeys.item2
      )
    );
  }


  setUpAll(() async {
    api = await TestUtils.medtechApi(
        userName: Platform.environment["HCP_1_USERNAME"]!,
        userPassword: Platform.environment["HCP_1_PASSWORD"]!,
        userPrivKey: Platform.environment["HCP_1_PRIV_KEY"]!
    );

    print("Successfully set up test backend!");
  });

  group('tests for MedicalDeviceApi', () {
    test('test createDevice CREATE', () async {
      // Init
      expect(api != null, true);
      final MedicalDevice device = getMedicalDevice();

      // When
      final MedicalDevice? createdDevice = await api!.medicalDeviceApi.createOrModifyMedicalDevice(device);

      // Then
      expect(createdDevice!.id, device.id);
      expect(createdDevice.brand, device.brand);
      expect(createdDevice.type, device.type);
      expect(createdDevice.model, device.model);
      expect(createdDevice.systemMetaData!.publicKey, device.systemMetaData!.publicKey);
    });

    test('test getDevice', () async {
      // Init
      expect(api != null, true);
      final MedicalDevice device = getMedicalDevice();

      // When
      final MedicalDevice? createdDevice = await api!.medicalDeviceApi.createOrModifyMedicalDevice(device);
      final MedicalDevice? gotDevice = await api!.medicalDeviceApi.getMedicalDevice(createdDevice!.id!);

      // Then
      expect(createdDevice.id, gotDevice!.id);
      expect(createdDevice.brand, gotDevice.brand);
      expect(createdDevice.type, gotDevice.type);
      expect(createdDevice.model, gotDevice.model);
      expect(createdDevice.systemMetaData!.publicKey, gotDevice.systemMetaData!.publicKey);
    });

    test('test createDevice UPDATE', () async {
      // Init
      expect(api != null, true);
      final updateModel = "14";

      final MedicalDevice device = MedicalDevice(
          id: uuid.v4(options: {'rng': UuidUtil.cryptoRNG}),
          brand: 'Apple',
          model: '13 Pro',
          type: 'iPhone'
      );

      // When
      final MedicalDevice? createdDevice = await api!.medicalDeviceApi.createOrModifyMedicalDevice(device);
      createdDevice!.model = updateModel;
      final MedicalDevice? updatedDevice = await api!.medicalDeviceApi.createOrModifyMedicalDevice(createdDevice);

      // Then
      expect(createdDevice.id, device.id);
      expect(createdDevice.brand, device.brand);
      expect(createdDevice.type, device.type);
      assert(device.model != updatedDevice!.model);
      assert(createdDevice.rev != updatedDevice!.rev);
      expect(createdDevice.model, updateModel);
      expect(createdDevice.systemMetaData!.publicKey, updatedDevice!.systemMetaData!.publicKey);
    });

    test('test deleteDevice', () async {
      // Init
      expect(api != null, true);
      final MedicalDevice device = getMedicalDevice();

      // When
      final MedicalDevice? createdDevice = await api!.medicalDeviceApi.createOrModifyMedicalDevice(device);
      final String? deletedDeviceRev = await api!.medicalDeviceApi.deleteMedicalDevice(createdDevice!.id!);

      // Then
      assert(deletedDeviceRev != null);
    });
  });
}
