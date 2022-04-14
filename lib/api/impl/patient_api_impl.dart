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

  @override
  Future<Patient> giveAccessTo(Patient patient, String delegatedTo) async {
    final localCrypto = _api.crypto;
    final currentUser = await _api.baseUserApi.getCurrentUser();

    // Check if delegatedBy has access
    if (!patient.systemMetaData!.delegations.entries.any((element) => element.key == currentUser!.dataOwnerId())) {
      throw StateError("Couldn't give access to unowned dataSample");
    }

    final patientDto = patient.toPatientDto();

    final keyAndOwner = await localCrypto.encryptAESKeyForHcp(currentUser!.dataOwnerId()!, delegatedTo, patientDto.id!,
        (await localCrypto.decryptEncryptionKeys(currentUser.dataOwnerId()!, patientDto.delegations)).firstOrNull()!.formatAsKey());
    final delegation = Delegation(owner: currentUser.id, delegatedTo: delegatedTo, key: keyAndOwner.item1);

    if (patient.systemMetaData == null) {
      patient.systemMetaData = SystemMetaDataOwnerEncrypted(delegations: {
        delegatedTo: [delegation]
      });
    } else {
      patient.systemMetaData!.delegations = {...patient.systemMetaData!.delegations}..addEntries([
          MapEntry(delegatedTo, [delegation])
        ]);
    }

    patient.systemMetaData!.encryptionKeys = {...patient.systemMetaData!.encryptionKeys}..addEntries([
        MapEntry(delegatedTo, [
          Delegation(
              owner: currentUser.dataOwnerId(),
              delegatedTo: delegatedTo,
              key: (await localCrypto.encryptAESKeyForHcp(currentUser.dataOwnerId()!, delegatedTo, patient.id!,
                      (await localCrypto.decryptEncryptionKeys(currentUser.dataOwnerId()!, patientDto.encryptionKeys)).firstOrNull()!.formatAsKey()))
                  .item1)
        ])
      ]);

    final dataOwner = keyAndOwner.item2;
    if (dataOwner != null && dataOwner.dataOwnerId == patient.id) {
      patient.rev = dataOwner.rev;
      patient.systemMetaData!.hcPartyKeys = dataOwner.hcPartyKeys;
    }

    return (await createOrModifyPatient(patient)) ?? (throw StateError("Couldn't update patient"));
  }
}
