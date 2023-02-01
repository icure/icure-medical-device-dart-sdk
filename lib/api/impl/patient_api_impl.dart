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
    final currentUser = (await _api.baseUserApi.getCurrentUser())
        ?? (throw StateError("There is no user currently logged in. You must call this method from an authenticated MedTechApi"));
    final ccPatient = patientCryptoConfig(localCrypto);

    if (patient.rev != null) {
      if (patient.id == null || !Uuid.isValidUUID(fromString: patient.id!)) {
        throw ArgumentError("The id of the Patient to modify should be a valid UUID");
      }
      final modifiedPatientDto =
          await base_api.PatientApiCrypto(_api.basePatientApi).modifyPatient(currentUser, PatientMapper(patient).toPatientDto(), ccPatient);
      return modifiedPatientDto != null
          ? PatientDtoMapper(modifiedPatientDto).toPatient()
          : throw StateError("Could not modify patient ${patient.id} with user ${currentUser.id}");
    }
    final createdPatientDto =
        await base_api.PatientApiCrypto(_api.basePatientApi).createPatient(currentUser, PatientMapper(patient).toPatientDto(), ccPatient);
    return createdPatientDto != null
        ? PatientDtoMapper(createdPatientDto).toPatient()
        : throw StateError("Could not modify patient ${patient.id} with user ${currentUser.id}");
  }

  @override
  Future<String?> deletePatient(String patientId) {
    throw UnimplementedError();
  }

  @override
  Future<PaginatedListPatient?> filterPatients(Filter<Patient> filter, {String? nextPatientId, int? limit, String? startKey}) async {
    final localCrypto = _api.crypto;
    final currentUser = (await _api.baseUserApi.getCurrentUser())
        ?? (throw StateError("There is no user currently logged in. You must call this method from an authenticated MedTechApi"));
    final ccPatient = patientCryptoConfig(localCrypto);

    return (await base_api.PatientApiCrypto(_api.basePatientApi).filterPatientsBy(
            currentUser!, base_api.FilterChain<base_api.PatientDto>(filter.toAbstractFilterDto()), startKey, nextPatientId, limit, ccPatient))
        ?.toPaginatedListPatient();
  }

  @override
  Future<Patient?> getPatient(String patientId) async => await PatientDtoMapper(await _api.basePatientApi.getPatient(
        (await _api.baseUserApi.getCurrentUser() ?? (throw StateError("There is no user currently logged in. You must call this method from an authenticated MedTechApi"))),
        patientId,
        patientCryptoConfig(_api.crypto)))
      ?.toPatient()
    ?? (throw StateError("Could not find patient ${patientId} with current user"));

  @override
  Future<List<String>?> matchPatients(Filter filter) {
    return _api.basePatientApi.rawMatchPatientsBy(filter.toAbstractFilterDto());
  }

  @override
  Future<Patient> giveAccessTo(Patient patient, String delegatedTo) async {
    final updateData = await _giveAccessTo(
        patient.id!,
        patient.systemMetaData?.delegations ?? {},
        patient.systemMetaData?.encryptionKeys ?? {},
        delegatedTo
    );
    if (updateData == null) return patient;
    if (patient.systemMetaData == null) {
      patient.systemMetaData = SystemMetaDataOwnerEncrypted();
    }
    patient.systemMetaData!.encryptionKeys = updateData.updatedEncryptionKeys;
    patient.systemMetaData!.delegations = updateData.updatedDelegations;
    if (updateData.updatedRev != null) {
      patient.rev = updateData.updatedRev;
    }
    if (updateData.updatedAesExchangeKeys != null) {
      patient.systemMetaData!.aesExchangeKeys = updateData.updatedAesExchangeKeys!;
    }
    if (updateData.updatedHcPartyKeys != null) {
      patient.systemMetaData!.hcPartyKeys = updateData.updatedHcPartyKeys!;
    }
    return (await createOrModifyPatient(patient)) ?? (throw StateError("Couldn't give access to $delegatedTo to patient ${patient.id}"));
  }

  @override
  Future<PotentiallyEncryptedPatient> giveAccessToPotentiallyEncrypted(PotentiallyEncryptedPatient patient, String delegatedTo) async {
    if (patient is Patient) {
      return await giveAccessTo(patient, delegatedTo);
    } else if (patient is EncryptedPatient) {
      final updateData = await _giveAccessTo(
          patient.id!,
          patient.systemMetaData?.delegations ?? {},
          patient.systemMetaData?.encryptionKeys ?? {},
          delegatedTo
      );
      if (updateData == null) return patient;
      if (patient.systemMetaData == null) {
        patient.systemMetaData = SystemMetaDataOwnerEncrypted();
      }
      patient.systemMetaData!.encryptionKeys = updateData.updatedEncryptionKeys;
      patient.systemMetaData!.delegations = updateData.updatedDelegations;
      if (updateData.updatedRev != null) {
        patient.rev = updateData.updatedRev;
      }
      if (updateData.updatedAesExchangeKeys != null) {
        patient.systemMetaData!.aesExchangeKeys = updateData.updatedAesExchangeKeys!;
      }
      if (updateData.updatedHcPartyKeys != null) {
        patient.systemMetaData!.hcPartyKeys = updateData.updatedHcPartyKeys!;
      }
      return (await modifyEncryptedPatient(patient)) ?? (throw StateError("Couldn't give access to $delegatedTo to patient ${patient.id}"));
    } else {
      throw ArgumentError("Unexpected type for patient $patient");
    }
  }

  Future<_PatientGiveAccessUpdate?> _giveAccessTo(
      String patientId,
      Map<String, List<Delegation>> existingDelegations,
      Map<String, List<Delegation>> existingEncryptionKeys,
      String delegatedTo
  ) async {
    final localCrypto = _api.crypto;
    final currentUser = (await _api.baseUserApi.getCurrentUser())
        ?? (throw StateError("There is no user currently logged in. You must call this method from an authenticated MedTechApi"));

    if (currentUser.dataOwnerId() == null) {
      throw StateError("The current user is not a data owner. You must been either a patient, a device or a healthcare professional to call this method");
    }

    // Check if delegatedBy has access
    if (!existingDelegations.entries.any((element) => element.key == currentUser.dataOwnerId())) {
      throw StateError("DataOwner ${currentUser.dataOwnerId()} does not have the right to access patient ${patientId}");
    }

    final myId = currentUser.dataOwnerId()!;
    final newSecretIds = await localCrypto.findAndDecryptPotentiallyUnknownKeysForDelegate(
        myId,
        delegatedTo,
        existingDelegations.map((key, value) => MapEntry(key, value.map((e) => e.toDelegationDto()).toSet()))
    );
    final newEncryptionKeys = await localCrypto.findAndDecryptPotentiallyUnknownKeysForDelegate(
        myId,
        delegatedTo,
        existingEncryptionKeys.map((key, value) => MapEntry(key, value.map((e) => e.toDelegationDto()).toSet()))
    );

    if (newSecretIds.isEmpty && newSecretIds.isEmpty) {
      return null;
    }

    DataOwnerDto? dataOwner = null;
    final Map<String, String> encryptedKeys = {};
    for (var clearKey in { ...newSecretIds, ...newEncryptionKeys }) {
      final encryptedKeyAndOwner = await localCrypto.encryptAESKeyForHcp(
          myId,
          delegatedTo,
          patientId,
          clearKey.formatAsKey()
      );
      encryptedKeys[clearKey] = encryptedKeyAndOwner.item1;
      dataOwner = encryptedKeyAndOwner.item2 ?? dataOwner;
    }
    final newSecretIdsDelegations = newSecretIds.map((clearKey) =>
        Delegation(owner: myId, delegatedTo: delegatedTo, key: encryptedKeys[clearKey]!)
    ).toList();
    final newEncryptionKeysDelegations = newEncryptionKeys.map((clearKey) =>
        Delegation(owner: myId, delegatedTo: delegatedTo, key: encryptedKeys[clearKey]!)
    ).toList();

    final Map<String, List<Delegation>> updatedDelegations = {
      ...existingDelegations,
      delegatedTo: [...(existingDelegations[delegatedTo] ?? []), ...newSecretIdsDelegations]
    };
    final Map<String, List<Delegation>> updatedEncryptionKeys = {
      ...existingEncryptionKeys,
      delegatedTo: [...(existingEncryptionKeys[delegatedTo] ?? []), ...newEncryptionKeysDelegations]
    };

    if (dataOwner != null && dataOwner.dataOwnerId == patientId) {
      return _PatientGiveAccessUpdate(
        updatedRev: dataOwner.rev,
        updatedHcPartyKeys: dataOwner.hcPartyKeys,
        updatedAesExchangeKeys: dataOwner.aesExchangeKeys,
        updatedDelegations: updatedDelegations,
        updatedEncryptionKeys: updatedEncryptionKeys
      );
    } else {
      return _PatientGiveAccessUpdate(updatedDelegations: updatedDelegations, updatedEncryptionKeys: updatedEncryptionKeys);
    }
  }

  @override
  Future<PotentiallyEncryptedPatient?> getPatientAndTryDecrypt(String patientId) async {
    final patient = await _api.basePatientApi.rawGetPatient(patientId);
    if (patient == null) return null;
    final config = patientCryptoConfig(_api.crypto);
    final currentUser = (await _api.baseUserApi.getCurrentUser() ?? (throw StateError("Couldn't get current user")));
    try {
      return PatientDtoMapper(await config.decryptPatient(currentUser.dataOwnerId()!, patient)).toPatient();
    } catch (e) {
      return EncryptedPatientDtoMapper(patient).toEncryptedPatient();
    }
  }

  @override
  Future<EncryptedPatient?> modifyEncryptedPatient(EncryptedPatient modifiedPatient) async {
    final config = patientCryptoConfig(_api.crypto);
    final rawDto = EncryptedPatientMapper(modifiedPatient).toPatientDto();
    final asDecrypted = DecryptedPatientDto.fromJson(rawDto.toJson());
    if (asDecrypted == null || (await config.marshaller(asDecrypted)).item2 != null) {
      throw ArgumentError('Impossible to modify non-decryptable patient if new data requires encryption');
    }
    final modified = await _api.basePatientApi.rawModifyPatient(rawDto);
    if (modified == null) return null;
    return EncryptedPatientDtoMapper(modified).toEncryptedPatient();
  }
}

class _PatientGiveAccessUpdate {
  _PatientGiveAccessUpdate({
    this.updatedRev,
    this.updatedHcPartyKeys,
    this.updatedAesExchangeKeys,
    required this.updatedDelegations,
    required this.updatedEncryptionKeys
  });

  String? updatedRev;
  Map<String, List<String>>? updatedHcPartyKeys;
  Map<String, Map<String, Map<String, String>>>? updatedAesExchangeKeys;
  Map<String, List<Delegation>> updatedDelegations;
  Map<String, List<Delegation>> updatedEncryptionKeys;
}
