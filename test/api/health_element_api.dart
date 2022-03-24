@Timeout(Duration(hours: 1))
import 'package:icure_dart_sdk/api.dart';
import 'package:icure_medical_device_dart_sdk/api.dart';
import 'package:icure_medical_device_dart_sdk/mappers/healthcare_element.dart';
import 'package:icure_medical_device_dart_sdk/mappers/patient.dart';
import "package:test/test.dart";
import 'package:uuid/uuid.dart';
import 'package:uuid/uuid_util.dart';

import '../utils/test_utils.dart';

void main() {
  final Uuid uuid = Uuid();

  Future<MedTechApi> medtechApi() async {
    return await TestUtils.medtechApi();
  }

  DecryptedHealthElementDto getHealthElementDto() => DecryptedHealthElementDto(
      id: uuid.v4(options: {'rng': UuidUtil.cryptoRNG}), note: 'Premature optimization is the root of all evil', relevant: true, status: 0);

  group('tests for HealthElementApi', () {
    test('test createHealthcareElement', () async {
      // Init
      final MedTechApi api = await medtechApi();

      final DecryptedHealthElementDto healthElementDto = getHealthElementDto();
      final DecryptedPatientDto patient = DecryptedPatientDto(id: uuid.v4(options: {'rng': UuidUtil.cryptoRNG}), firstName: 'John', lastName: 'Doe');
      final Patient? createdPatient = await api.patientApi.createOrModifyPatient(PatientDtoMapper(patient).toPatient());

      // When
      final HealthcareElement? createdHealthElement =
          await api.healthcareElementApi.createOrModifyHealthcareElement(createdPatient!.id!, HealthElementDtoMapper(healthElementDto).toHealthcareElement());

      // Then
      expect(createdHealthElement!.id, healthElementDto.id);
      expect(createdHealthElement.note, healthElementDto.note);
    });

    test('test getHealthcareElement', () async {
      // Init
      final MedTechApi api = await medtechApi();
      final DecryptedHealthElementDto healthElementDto = getHealthElementDto();
      final DecryptedPatientDto patient = DecryptedPatientDto(id: uuid.v4(options: {'rng': UuidUtil.cryptoRNG}), firstName: 'John', lastName: 'Doe');
      final Patient? createdPatient = await api.patientApi.createOrModifyPatient(PatientDtoMapper(patient).toPatient());

      // When
      final HealthcareElement? createdHealthElement =
      await api.healthcareElementApi.createOrModifyHealthcareElement(createdPatient!.id!, HealthElementDtoMapper(healthElementDto).toHealthcareElement());
      final HealthcareElement? gotHealthElement = await api.healthcareElementApi.getHealthcareElement(createdHealthElement!.id!);

      // Then
      expect(createdHealthElement.id, gotHealthElement!.id);
      expect(createdHealthElement.rev, gotHealthElement.rev);
      expect(createdHealthElement.note, gotHealthElement.note);
    });
  });

  test('test createHealthcareElement UPDATE', () async {
    // Init
    final MedTechApi api = await medtechApi();
    final updateNote = 'Premature optimization is not the root of all evil';

    final DecryptedHealthElementDto healthElementDto = getHealthElementDto();
    final healthElementTocreate = HealthElementDtoMapper(healthElementDto).toHealthcareElement();
    final DecryptedPatientDto patient = DecryptedPatientDto(id: uuid.v4(options: {'rng': UuidUtil.cryptoRNG}), firstName: 'John', lastName: 'Doe');
    final Patient? createdPatient = await api.patientApi.createOrModifyPatient(PatientDtoMapper(patient).toPatient());

    // When
    final HealthcareElement? createdHealthcareElement = await api.healthcareElementApi.createOrModifyHealthcareElement(createdPatient!.id!, healthElementTocreate);
    createdHealthcareElement!.note = updateNote;
    final HealthcareElement? updatedHealthcareElement = await api.healthcareElementApi.createOrModifyHealthcareElement(createdPatient!.id!, createdHealthcareElement);

    // Then
    expect(createdHealthcareElement.id, updatedHealthcareElement!.id);
    assert(healthElementTocreate.note != updatedHealthcareElement.note);
    assert(createdHealthcareElement.rev != updatedHealthcareElement.rev);
    expect(createdHealthcareElement.note, updateNote);
  });

  test('test deleteHealthcareElement', () async {
    // Init
    final MedTechApi api = await medtechApi();
    final DecryptedHealthElementDto healthElementDto = getHealthElementDto();
    final DecryptedPatientDto patient = DecryptedPatientDto(id: uuid.v4(options: {'rng': UuidUtil.cryptoRNG}), firstName: 'John', lastName: 'Doe');
    final Patient? createdPatient = await api.patientApi.createOrModifyPatient(PatientDtoMapper(patient).toPatient());

    // When
    final HealthcareElement? createdHealthElement =
    await api.healthcareElementApi.createOrModifyHealthcareElement(createdPatient!.id!, HealthElementDtoMapper(healthElementDto).toHealthcareElement());
    final String? deletedHealthcareElementRev = await api.healthcareElementApi.deleteHealthcareElement(createdHealthElement!.id!);

    // Then
    assert(deletedHealthcareElementRev != null);
  });
}
