@Timeout(Duration(hours: 1))
import 'package:icure_medical_device_dart_sdk/api.dart';
import "package:test/test.dart";
import 'package:uuid/uuid.dart';
import 'package:uuid/uuid_util.dart';

import '../utils/test_utils.dart';

void main() {
  final Uuid uuid = Uuid();

  Future<MedTechApi> medtechApi() async {
    return await TestUtils.medtechApi();
  }

  HealthcareProfessional getHcp() => HealthcareProfessional(
      id: uuid.v4(options: {'rng': UuidUtil.cryptoRNG}), name: 'Wick', firstName: 'John', gender: HealthcareProfessionalGenderEnum.male);

  group('tests for HealthcareProfessionalApi', () {
    test('test createOrModifyHealthcareProfessional', () async {
      // Init
      final MedTechApi api = await medtechApi();
      final HealthcareProfessional healthcareProfessional = getHcp();

      // When
      final HealthcareProfessional? createdHcp = await api.healthcareProfessionalApi.createOrModifyHealthcareProfessional(healthcareProfessional);

      // Then
      expect(createdHcp!.id, healthcareProfessional.id);
      expect(createdHcp.name, healthcareProfessional.name);
      expect(createdHcp.firstName, healthcareProfessional.firstName);
      expect(createdHcp.gender, healthcareProfessional.gender);
    });

    test('test getHealthcareProfessional', () async {
      // Init
      final MedTechApi api = await medtechApi();
      final HealthcareProfessional healthcareProfessional = getHcp();

      // When
      final HealthcareProfessional? createdHcp = await api.healthcareProfessionalApi.createOrModifyHealthcareProfessional(healthcareProfessional);
      final HealthcareProfessional? gotHcp = await api.healthcareProfessionalApi.getHealthcareProfessional(createdHcp!.id!);

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
    final updateFirstname = "Johnny";
    final HealthcareProfessional healthcareProfessional = getHcp();

    // When
    final HealthcareProfessional? createdHcp = await api.healthcareProfessionalApi.createOrModifyHealthcareProfessional(healthcareProfessional);
    createdHcp!.firstName = updateFirstname;
    final HealthcareProfessional? updatedHcp = await api.healthcareProfessionalApi.createOrModifyHealthcareProfessional(createdHcp);

    // Then
    expect(createdHcp.id, updatedHcp!.id);
    assert(healthcareProfessional.firstName != updatedHcp.firstName);
    assert(createdHcp.rev != updatedHcp.rev);
    expect(createdHcp.name, updatedHcp.name);
  });

  test('test deleteHealthcareProfessional', () async {
    // Init
    final MedTechApi api = await medtechApi();
    final HealthcareProfessional healthcareProfessional = getHcp();

    // When
    final HealthcareProfessional? createdHcp = await api.healthcareProfessionalApi.createOrModifyHealthcareProfessional(healthcareProfessional);
    final String? deletedHcpRev = await api.healthcareProfessionalApi.deleteHealthcareProfessional(createdHcp!.id!);

    // Then
    assert(deletedHcpRev != null);
  });
}
