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
    final MedTechApiBuilder builder = MedTechApiBuilder()
        .withICureBasePath("https://kraken.icure.dev")
        .withUserName("abdemotst2")
        .withPassword("27b90f6e-6847-44bf-b90f-6e6847b4bf1c")
        .withMsgGtwUrl("https://msg-gw.icure.cloud/km")
        .withSignUpProcessId("f0ced6c6-d7cb-4f78-841e-2674ad09621e");

    var fileUri = Uri.file("test/resources/keys/782f1bcd-9f3f-408a-af1b-cd9f3f908a98-icc-priv.2048.key", windows: false);
    var hcpKeyFile = File.fromUri(fileUri);

    builder.addKeyPair("782f1bcd-9f3f-408a-af1b-cd9f3f908a98", (await hcpKeyFile.readAsString(encoding: utf8)).keyFromHexString());

    return builder.build();
  }

  HealthcareProfessional getHcp() => HealthcareProfessional(
      id: uuid.v4(options: {'rng': UuidUtil.cryptoRNG}), name: 'Wick', firstName: 'John', gender: HealthcareProfessionalGenderEnum.male);

  group('tests for HealthcareProfessionalApi', () {
    test('test createOrModifyHealthcareProfessional', () async {
      // Init
      final MedTechApi api = await medtechApi();
      final HealthcareProfessionalApi healthcareProfessionalApi = HealthcareProfessionalApiImpl(api);

      final HealthcareProfessional healthcareProfessional = getHcp();

      // When
      final HealthcareProfessional? createdHcp = await healthcareProfessionalApi.createOrModifyHealthcareProfessional(healthcareProfessional);

      // Then
      expect(createdHcp!.id, healthcareProfessional.id);
      expect(createdHcp.name, healthcareProfessional.name);
      expect(createdHcp.firstName, healthcareProfessional.firstName);
      expect(createdHcp.gender, healthcareProfessional.gender);
    });

    test('test getHealthcareProfessional', () async {
      // Init
      final MedTechApi api = await medtechApi();
      final HealthcareProfessionalApi healthcareProfessionalApi = HealthcareProfessionalApiImpl(api);

      final HealthcareProfessional healthcareProfessional = getHcp();

      // When
      final HealthcareProfessional? createdHcp = await healthcareProfessionalApi.createOrModifyHealthcareProfessional(healthcareProfessional);
      final HealthcareProfessional? gotHcp = await healthcareProfessionalApi.getHealthcareProfessional(createdHcp!.id!);

      // Then
      expect(createdHcp.id, gotHcp!.id);
      expect(createdHcp.rev, gotHcp.rev);
      expect(createdHcp.name, gotHcp.name);
      expect(createdHcp.firstName, gotHcp.firstName);
    });
  });

  test('test createOrModifyHealthcareProfessional UPDATE', () async {
    // Init
    final MedTechApi api = await medtechApi();
    final HealthcareProfessionalApi healthcareProfessionalApi = HealthcareProfessionalApiImpl(api);
    final updateFirstname = "Johnny";

    final HealthcareProfessional healthcareProfessional = getHcp();

    // When
    final HealthcareProfessional? createdHcp = await healthcareProfessionalApi.createOrModifyHealthcareProfessional(healthcareProfessional);
    createdHcp!.firstName = updateFirstname;
    final HealthcareProfessional? updatedHcp = await healthcareProfessionalApi.createOrModifyHealthcareProfessional(createdHcp);

    // Then
    expect(createdHcp.id, updatedHcp!.id);
    assert(healthcareProfessional.firstName != updatedHcp.firstName);
    assert(createdHcp.rev != updatedHcp.rev);
    expect(createdHcp.name, updatedHcp.name);
  });

  test('test deleteHealthcareElement', () async {
    // Init
    final MedTechApi api = await medtechApi();
    final HealthcareProfessionalApi healthcareProfessionalApi = HealthcareProfessionalApiImpl(api);

    final HealthcareProfessional healthcareProfessional = getHcp();

    // When
    final HealthcareProfessional? createdHcp = await healthcareProfessionalApi.createOrModifyHealthcareProfessional(healthcareProfessional);
    final String? deletedHcpRev = await healthcareProfessionalApi.deleteHealthcareProfessional(createdHcp!.id!);

    // Then
    assert(deletedHcpRev != null);
  });
}
