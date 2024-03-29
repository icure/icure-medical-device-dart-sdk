// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of icure_medical_device_dart_sdk.api;

class HealthcareElementApiImpl extends HealthcareElementApi {
  final MedTechApi api;

  HealthcareElementApiImpl(this.api);

  @override
  Future<HealthcareElement?> createOrModifyHealthcareElement(String patientId, HealthcareElement healthcareElement) async {
    final localCrypto = api.crypto;
    final currentUser = (await api.baseUserApi.getCurrentUser())
        ?? (throw StateError("There is no user currently logged in. You must call this method from an authenticated MedTechApi"));
    final ccHealthElement = healthElementCryptoConfig(localCrypto);
    final ccPatient = patientCryptoConfig(localCrypto);

    if (healthcareElement.rev != null) {
      if (healthcareElement.id == null || !Uuid.isValidUUID(fromString: healthcareElement.id!)) {
        throw ArgumentError("Error while updating: HealthcareElement id should be provided as an UUID v4 (String)");
      }
      final modifiedHealthElementDto = await api.baseHealthElementApi
          .modifyHealthElement(currentUser, HealthcareElementMapper(healthcareElement).toHealthElementDto(), ccHealthElement);
      return modifiedHealthElementDto != null
          ? HealthElementDtoMapper(modifiedHealthElementDto).toHealthcareElement()
          : (throw StateError("Could not modify healthElement ${healthcareElement.id}"));
    }

    final patient = await api.patientApi.getPatientAndTryDecrypt(patientId) ?? (throw StateError("Error while getting patient with id $patientId"));
    final createdHealthElementDto = await api.baseHealthElementApi.createHealthElementWithPatientInfo(
      currentUser,
      patient.id!,
      (patient.systemMetaData?.delegations ?? {}).toDelegationMapDto(),
      HealthcareElementMapper(healthcareElement).toHealthElementDto(),
      ccHealthElement
    );
    return createdHealthElementDto != null ? HealthElementDtoMapper(createdHealthElementDto).toHealthcareElement() : (throw StateError("Could not create healthElement ${healthcareElement.id}"));;
  }

  @override
  Future<List<HealthcareElement>?> createOrModifyHealthcareElements(String patientId, List<HealthcareElement> healthcareElements) async {
    final localCrypto = api.crypto;
    final currentUser = (await api.baseUserApi.getCurrentUser())
        ?? (throw StateError("There is no user currently logged in. You must call this method from an authenticated MedTechApi"));
    final ccHealthElement = healthElementCryptoConfig(localCrypto);
    final ccPatient = patientCryptoConfig(localCrypto);

    final healthcareElementsToCreate = healthcareElements.where((element) => element.rev == null).toSet();
    final healthcareElementsToUpdate = healthcareElements.toSet().difference(healthcareElementsToCreate).toSet();

    if (healthcareElementsToUpdate.any((element) => element.id == null || !Uuid.isValidUUID(fromString: element.id!))) {
      throw FormatException("Error while updating: HealthcareElement id should be provided as an UUID v4 (String)");
    }

    final healthElementDtosToUpdate = healthcareElementsToUpdate.map((e) => e.toHealthElementDto()).toList();
    final healthElementDtosToCreate = healthcareElementsToCreate.map((e) => e.toHealthElementDto()).toList();

    final patient = await api.patientApi.getPatientAndTryDecrypt(patientId) ?? (throw StateError("Error while getting patient with id $patientId"));
    final heCreated = await api.baseHealthElementApi.createHealthElementsWithPatientInfo(
        currentUser,
        patient.id!,
        patient.systemMetaData!.delegations.toDelegationMapDto(),
        healthElementDtosToCreate,
        ccHealthElement
    );
    final heUpdated = await api.baseHealthElementApi.modifyHealthElements(currentUser, healthElementDtosToUpdate, ccHealthElement);
    final heProcessed = [...?heCreated, ...heUpdated];

    return heProcessed.map((e) => e.toHealthcareElement()).toList();
  }

  @override
  Future<String?> deleteHealthcareElement(String id) async {
    return (await api.baseHealthElementApi.rawDeleteHealthElements(base_api.ListOfIdsDto(ids: [id])))?.single.rev ??
        throwFormatException("An error occurred when deleting this HealthcareElement. Id: ${id}");
  }

  @override
  Future<PaginatedListHealthcareElement?> filterHealthcareElement(
    Filter<HealthcareElement> filter, {
    String? nextHealthElementId,
    int? limit,
  }) async {
    final localCrypto = api.crypto;
    final currentUser = (await api.baseUserApi.getCurrentUser())
        ?? (throw StateError("There is no user currently logged in. You must call this method from an authenticated MedTechApi"));
    final ccHealthElement = healthElementCryptoConfig(localCrypto);

    return (await api.baseHealthElementApi.filterHealthElements(
            currentUser, base_api.FilterChain<base_api.HealthElementDto>(filter.toAbstractFilterDto()), ccHealthElement, nextHealthElementId, limit))
        .toPaginatedListHealthcareElement();
  }

  @override
  Future<HealthcareElement?> getHealthcareElement(String id) async {
    final localCrypto = api.crypto;
    final currentUser = (await api.baseUserApi.getCurrentUser())
        ?? (throw StateError("There is no user currently logged in. You must call this method from an authenticated MedTechApi"));
    final ccHealthElement = healthElementCryptoConfig(localCrypto);

    return (await api.baseHealthElementApi.getHeathElement(currentUser, id, ccHealthElement))?.toHealthcareElement();
  }

  @override
  Future<List<String>?> matchHealthcareElement(Filter filter) {
    return api.baseHealthElementApi.rawMatchHealthElementsBy(filter.toAbstractFilterDto());
  }

  @override
  Future<HealthcareElement> giveAccessTo(HealthcareElement healthcareElement, String delegatedTo) async {
    final localCrypto = api.crypto;
    final currentUser = (await api.baseUserApi.getCurrentUser())
        ?? (throw StateError("There is no user currently logged in. You must call this method from an authenticated MedTechApi"));

    // Check if delegatedBy has access
    if (!healthcareElement.systemMetaData!.delegations.entries.any((element) => element.key == currentUser.dataOwnerId())) {
      throw StateError("User ${currentUser.id} may not access healthcare element. Check that the healthcare element is owned by/shared to the actual user.");
    }

    final myId = currentUser.dataOwnerId()!;
    final healthcareElementDto = healthcareElement.toHealthElementDto();
    final patientId = (await localCrypto.decryptEncryptionKeys(myId, healthcareElementDto.cryptedForeignKeys)).firstOrNull!.formatAsKey();
    final newSecretIds = await localCrypto.findAndDecryptPotentiallyUnknownKeysForDelegate(myId, delegatedTo, healthcareElementDto.delegations);
    final newEncryptionKeys = await localCrypto.findAndDecryptPotentiallyUnknownKeysForDelegate(myId, delegatedTo, healthcareElementDto.encryptionKeys);
    final newCfks = await localCrypto.findAndDecryptPotentiallyUnknownKeysForDelegate(myId, delegatedTo, healthcareElementDto.cryptedForeignKeys);

    if (newSecretIds.isEmpty && newEncryptionKeys.isEmpty && newCfks.isEmpty) {
      return healthcareElement;
    }

    final newSecretIdsDelegations = await Future.wait(newSecretIds.map((clearKey) =>
        DelegationExtended.delegationBasedOn(localCrypto, myId, delegatedTo, healthcareElement.id!, clearKey.formatAsKey())
    ));
    final newEncryptionKeysDelegations = await Future.wait(newEncryptionKeys.map((clearKey) =>
        DelegationExtended.delegationBasedOn(localCrypto, myId, delegatedTo, healthcareElement.id!, clearKey.formatAsKey())
    ));
    final newCfksDelegations = await Future.wait(newCfks.map((clearKey) =>
        DelegationExtended.delegationBasedOn(localCrypto, myId, delegatedTo, healthcareElement.id!, clearKey.formatAsKey())
    ));

    if (healthcareElement.systemMetaData == null) {
      healthcareElement.systemMetaData = SystemMetaDataEncrypted(
        delegations: {},
        cryptedForeignKeys: {},
        encryptionKeys: {}
      );
    }

    final existingDelegationsForDelegate = healthcareElement.systemMetaData!.delegations[delegatedTo] ?? [];
    healthcareElement.systemMetaData!.delegations[delegatedTo] = [...existingDelegationsForDelegate, ...newSecretIdsDelegations];
    final existingEncryptionKeysForDelegate = healthcareElement.systemMetaData!.encryptionKeys[delegatedTo] ?? [];
    healthcareElement.systemMetaData!.encryptionKeys[delegatedTo] = [...existingEncryptionKeysForDelegate, ...newEncryptionKeysDelegations];
    final existingCfksForDelegate = healthcareElement.systemMetaData!.cryptedForeignKeys[delegatedTo] ?? [];
    healthcareElement.systemMetaData!.cryptedForeignKeys[delegatedTo] = [...existingCfksForDelegate, ...newCfksDelegations];

    return (await createOrModifyHealthcareElement(patientId.formatAsKey(), healthcareElement)) ??
        (throw StateError("Couldn't give access to $delegatedTo to health element ${healthcareElement.id}"));
  }
}
