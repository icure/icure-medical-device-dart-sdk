@Timeout(Duration(hours: 1))
import 'dart:convert';
import 'dart:io';

import 'package:icure_dart_sdk/api.dart';
import 'package:icure_dart_sdk/util/binary_utils.dart';
import 'package:icure_medical_device_dart_sdk/api.dart';
import 'package:icure_medical_device_dart_sdk/mappers/healthcare_element.dart';
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

  group('tests for HealthElementApi', () {
    test('test createHealthcareElement', () async {
      // Init
      final MedTechApi api = await medtechApi();
      final HealthcareElementApi healthcareElementApi = HealthcareElementApiImpl(api);

      final DecryptedHealthElementDto healthElementDto = DecryptedHealthElementDto(
          id: uuid.v4(options: {'rng': UuidUtil.cryptoRNG}), note: 'Premature optimization is the root of all evil', relevant: true, status: 0);

      // When
      final HealthcareElement? createdHealthElement =
          await healthcareElementApi.createOrModifyHealthcareElement(HealthElementDtoMapper(healthElementDto).toHealthcareElement());

      // Then
      expect(createdHealthElement!.id, healthElementDto.id);
      expect(createdHealthElement.note, healthElementDto.note);
    });

    test('test getHealthcareElement', () async {
      // Init
      final MedTechApi api = await medtechApi();
      final HealthcareElementApi healthcareElementApi = HealthcareElementApiImpl(api);

      final DecryptedHealthElementDto healthElementDto = DecryptedHealthElementDto(
          id: uuid.v4(options: {'rng': UuidUtil.cryptoRNG}), note: 'Premature optimization is the root of all evil', relevant: true, status: 0);

      // When
      final HealthcareElement? createdHealthElement =
      await healthcareElementApi.createOrModifyHealthcareElement(HealthElementDtoMapper(healthElementDto).toHealthcareElement());
      final HealthcareElement? gotHealthElement = await healthcareElementApi.getHealthcareElement(createdHealthElement!.id!);

      // Then
      expect(createdHealthElement.id, gotHealthElement!.id);
      expect(createdHealthElement.rev, gotHealthElement.rev);
      expect(createdHealthElement.note, gotHealthElement.note);
    });
  });

  test('test createHealthcareElement UPDATE', () async {
    // Init
    final MedTechApi api = await medtechApi();
    final HealthcareElementApi healthcareElementApi = HealthcareElementApiImpl(api);
    final updateNote = 'Premature optimization is not the root of all evil';

    final DecryptedHealthElementDto healthElementDto = DecryptedHealthElementDto(
        id: uuid.v4(options: {'rng': UuidUtil.cryptoRNG}), note: 'Premature optimization is the root of all evil', relevant: true, status: 0);

    final healthElementTocreate = HealthElementDtoMapper(healthElementDto).toHealthcareElement();

    // When
    final HealthcareElement? createdHealthcareElement = await healthcareElementApi.createOrModifyHealthcareElement(healthElementTocreate);
    createdHealthcareElement!.note = updateNote;
    final HealthcareElement? updatedHealthcareElement = await healthcareElementApi.createOrModifyHealthcareElement(createdHealthcareElement);

    // Then
    expect(createdHealthcareElement.id, updatedHealthcareElement!.id);
    assert(healthElementTocreate.note != updatedHealthcareElement.note);
    assert(createdHealthcareElement.rev != updatedHealthcareElement.rev);
    expect(createdHealthcareElement.note, updateNote);
  });

  test('test deleteHealthcareElement', () async {
    // Init
    final MedTechApi api = await medtechApi();
    final HealthcareElementApi healthcareElementApi = HealthcareElementApiImpl(api);

    final DecryptedHealthElementDto healthElementDto = DecryptedHealthElementDto(
        id: uuid.v4(options: {'rng': UuidUtil.cryptoRNG}), note: 'Premature optimization is the root of all evil', relevant: true, status: 0);

    // When
    final HealthcareElement? createdHealthElement =
    await healthcareElementApi.createOrModifyHealthcareElement(HealthElementDtoMapper(healthElementDto).toHealthcareElement());
    final String? deletedHealthcareElementRev = await healthcareElementApi.deleteHealthcareElement(createdHealthElement!.id!);

    // Then
    assert(deletedHealthcareElementRev != null);
  });
}
