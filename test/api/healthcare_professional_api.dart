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

  HealthcareProfessional getHcp() {
    final hcpKeys = generateRandomPrivateAndPublicKeyPair();
    return HealthcareProfessional(
        id: uuid.v4(options: {'rng': UuidUtil.cryptoRNG}),
        name: 'Mark',
        firstName: 'Lister',
        gender: HealthcareProfessionalGenderEnum.male,
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

    group('tests for HealthcareProfessionalApi', () {
      test('test createOrModifyHealthcareProfessional', () async {
        // Init

        final HealthcareProfessional healthcareProfessional = getHcp();

        // When
        final HealthcareProfessional? createdHcp = await api!.healthcareProfessionalApi.createOrModifyHealthcareProfessional(healthcareProfessional);

        // Then
        expect(createdHcp!.id, healthcareProfessional.id);
        expect(createdHcp.name, healthcareProfessional.name);
        expect(createdHcp.firstName, healthcareProfessional.firstName);
        expect(createdHcp.gender, healthcareProfessional.gender);
        expect(createdHcp.systemMetaData!.publicKey, healthcareProfessional.systemMetaData!.publicKey);
      });

      test('test getHealthcareProfessional', () async {
        // Init
        expect(api != null, true);
        final HealthcareProfessional healthcareProfessional = getHcp();

        // When
        final HealthcareProfessional? createdHcp = await api!.healthcareProfessionalApi.createOrModifyHealthcareProfessional(healthcareProfessional);
        final HealthcareProfessional? gotHcp = await api!.healthcareProfessionalApi.getHealthcareProfessional(createdHcp!.id!);

        // Then
        expect(createdHcp.id, gotHcp!.id);
        expect(createdHcp.rev, gotHcp.rev);
        expect(createdHcp.name, gotHcp.name);
        expect(createdHcp.firstName, gotHcp.firstName);
        expect(createdHcp.systemMetaData!.publicKey, gotHcp.systemMetaData!.publicKey);
      });
    });

    test('test createOrModifyHealthcareProfessional UPDATE', () async {
      // Init
      expect(api != null, true);
      final updateFirstname = "Johnny";
      final HealthcareProfessional healthcareProfessional = getHcp();

      // When
      final HealthcareProfessional? createdHcp = await api!.healthcareProfessionalApi.createOrModifyHealthcareProfessional(healthcareProfessional);
      createdHcp!.firstName = updateFirstname;
      final HealthcareProfessional? updatedHcp = await api!.healthcareProfessionalApi.createOrModifyHealthcareProfessional(createdHcp);

      // Then
      expect(createdHcp.id, updatedHcp!.id);
      assert(healthcareProfessional.firstName != updatedHcp.firstName);
      assert(createdHcp.rev != updatedHcp.rev);
      expect(createdHcp.name, updatedHcp.name);
      expect(createdHcp.systemMetaData!.publicKey, updatedHcp.systemMetaData!.publicKey);
    });

    test('test deleteHealthcareProfessional', () async {
      // Init
      expect(api != null, true);
      final HealthcareProfessional healthcareProfessional = getHcp();

      // When
      final HealthcareProfessional? createdHcp = await api!.healthcareProfessionalApi.createOrModifyHealthcareProfessional(healthcareProfessional);
      final String? deletedHcpRev = await api!.healthcareProfessionalApi.deleteHealthcareProfessional(createdHcp!.id!);

      // Then
      assert(deletedHcpRev != null);
    });
}
