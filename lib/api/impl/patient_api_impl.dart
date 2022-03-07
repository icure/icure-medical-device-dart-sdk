// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of icure_medical_device_dart_sdk.api;

class PatientApiImpl extends PatientApi {
  final MedTechApi api;

  PatientApiImpl(this.api);

  @override
  Future<Patient?> createOrModifyPatient(Patient patient) async {
    final localCrypto = api.crypto;
    final currentUser = await api.baseUserApi.getCurrentUser();
    final ccPatient = patientCryptoConfig(localCrypto);

    if (currentUser == null) {
      throw StateError("Couldn't get current user");
    }

    if (patient.rev != null) {
      if (patient.id == null || !Uuid.isValidUUID(fromString: patient.id!)) {
        throw ArgumentError("Update id should be provided as an UUID");
      }
      final modifiedPatientDto =
          await base_api.PatientApiCrypto(api.basePatientApi).modifyPatient(currentUser, PatientMapper(patient).toPatientDto(), ccPatient);
      return modifiedPatientDto != null ? PatientDtoMapper(modifiedPatientDto).toPatient() : null;
    }
    final createdPatientDto =
        await base_api.PatientApiCrypto(api.basePatientApi).createPatient(currentUser, PatientMapper(patient).toPatientDto(), ccPatient);
    return createdPatientDto != null ? PatientDtoMapper(createdPatientDto).toPatient() : null;
  }

  @override
  Future<String?> deletePatient(String patientId) {
    throw UnimplementedError();
  }

  @override
  Future<PaginatedListPatient?> filterPatients(Filter<Patient> filter, {String? nextPatientId, int? limit, String? startKey}) async {
    final localCrypto = api.crypto;
    final currentUser = await api.baseUserApi.getCurrentUser();
    final ccPatient = patientCryptoConfig(localCrypto);

    return (await base_api.PatientApiCrypto(api.basePatientApi).filterPatientsBy(currentUser!, base_api.FilterChain<base_api.PatientDto>(filter.toAbstractFilterDto()), startKey, nextPatientId, limit, ccPatient))
        ?.toPaginatedListPatient();
  }

  @override
  Future<Patient?> getPatient(String patientId) async => await PatientDtoMapper(await api.basePatientApi.getPatient(
          (await api.baseUserApi.getCurrentUser() ?? (throw StateError("Couldn't get current user"))), patientId, patientCryptoConfig(api.crypto)))
      ?.toPatient();

  @override
  Future<List<String>?> matchPatients(Filter filter) {
    return api.basePatientApi.rawMatchPatientsBy(filter.toAbstractFilterDto());
  }
}
