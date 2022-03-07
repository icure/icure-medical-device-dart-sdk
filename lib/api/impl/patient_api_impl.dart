// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of icure_medical_device_dart_sdk.api;

class PatientApiImpl extends PatientApi {
  final MedTechApi _api;

  PatientApiImpl(this._api);

  @override
  Future<Patient?> createOrModifyPatient(Patient patient) async {
    final localCrypto = _api.crypto;
    final currentUser = await _api.baseUserApi.getCurrentUser();
    final ccPatient = patientCryptoConfig(localCrypto);

    if (currentUser == null) {
      throw StateError("Couldn't get current user");
    }

    if (patient.rev != null) {
      if (patient.id == null || !Uuid.isValidUUID(fromString: patient.id!)) {
        throw ArgumentError("Update id should be provided as an UUID");
      }
      final modifiedPatientDto =
          await base_api.PatientApiCrypto(_api.basePatientApi).modifyPatient(currentUser, PatientMapper(patient).toPatientDto(), ccPatient);
      return modifiedPatientDto != null ? PatientDtoMapper(modifiedPatientDto).toPatient() : null;
    }
    final createdPatientDto =
        await base_api.PatientApiCrypto(_api.basePatientApi).createPatient(currentUser, PatientMapper(patient).toPatientDto(), ccPatient);
    return createdPatientDto != null ? PatientDtoMapper(createdPatientDto).toPatient() : null;
  }

  @override
  Future<String?> deletePatient(String patientId) {
    throw UnimplementedError();
  }

  @override
  Future<PaginatedListPatient?> filterPatients(Filter<Patient> filter, {String? nextPatientId, int? limit, String? startKey}) async {
    final localCrypto = _api.crypto;
    final currentUser = await _api.baseUserApi.getCurrentUser();
    final ccPatient = patientCryptoConfig(localCrypto);

    return (await base_api.PatientApiCrypto(_api.basePatientApi).filterPatientsBy(
            currentUser!, base_api.FilterChain<base_api.PatientDto>(filter.toAbstractFilterDto()), startKey, nextPatientId, limit, ccPatient))
        ?.toPaginatedListPatient();
  }

  @override
  Future<Patient?> getPatient(String patientId) async => await PatientDtoMapper(await _api.basePatientApi.getPatient(
          (await _api.baseUserApi.getCurrentUser() ?? (throw StateError("Couldn't get current user"))), patientId, patientCryptoConfig(_api.crypto)))
      ?.toPatient();

  @override
  Future<List<String>?> matchPatients(Filter filter) {
    return _api.basePatientApi.rawMatchPatientsBy(filter.toAbstractFilterDto());
  }
}
