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
    final currentUser = await api.baseUserApi.getCurrentUser();
    final ccHealthElement = healthElementCryptoConfig(localCrypto);
    final ccPatient = patientCryptoConfig(localCrypto);

    if (currentUser == null) {
      throw StateError("Couldn't get current user");
    }

    if (healthcareElement.rev != null) {
      if (healthcareElement.id == null || !Uuid.isValidUUID(fromString: healthcareElement.id!)) {
        throw ArgumentError("Update id should be provided as an UUID");
      }
      final modifiedHealthElementDto = await api.baseHealthElementApi
          .modifyHealthElement(currentUser, HealthcareElementMapper(healthcareElement).toHealthElementDto(), ccHealthElement);
      return modifiedHealthElementDto != null ? HealthElementDtoMapper(modifiedHealthElementDto).toHealthcareElement() : null;
    }

    final patient = await base_api.PatientApiCrypto(api.basePatientApi).getPatient(currentUser, patientId, ccPatient) ?? (throw StateError("Patient not found"));
    final createdHealthElementDto = await api.baseHealthElementApi
        .createHealthElementWithPatient(currentUser, patient, HealthcareElementMapper(healthcareElement).toHealthElementDto(), ccHealthElement);
    return createdHealthElementDto != null ? HealthElementDtoMapper(createdHealthElementDto).toHealthcareElement() : null;
  }

  @override
  Future<List<HealthcareElement>?> createOrModifyHealthcareElements(String patientId, List<HealthcareElement> healthcareElement) async {
    final localCrypto = api.crypto;
    final currentUser = await api.baseUserApi.getCurrentUser();
    final ccHealthElement = healthElementCryptoConfig(localCrypto);
    final ccPatient = patientCryptoConfig(localCrypto);

    final healthElementToCreate = healthcareElement.where((element) => element.rev == null).toSet();
    final healthElementToUpdate = healthcareElement.toSet().difference(healthElementToCreate).toSet();

    if (healthElementToUpdate.any((element) => element.id == null || !Uuid.isValidUUID(fromString: element.id!))) {
      throw FormatException("Update id should be provided as an UUID");
    }

    final healthElementDtoToUpdate = healthElementToUpdate.map((e) => e.toHealthElementDto()).toList();
    final healthElementDtoToCreate = healthElementToCreate.map((e) => e.toHealthElementDto()).toList();

    final patient = await base_api.PatientApiCrypto(api.basePatientApi).getPatient(currentUser!, patientId, ccPatient) ?? (throw StateError("Patient not found"));
    final heCreated = await api.baseHealthElementApi.createHealthElements(currentUser, patient, healthElementDtoToCreate, ccHealthElement);
    final heUpdated = await api.baseHealthElementApi.modifyHealthElements(currentUser, healthElementDtoToUpdate, ccHealthElement);
    final heProcessed = [...?heCreated, ...heUpdated];

    return heProcessed.map((e) => e.toHealthcareElement()).toList();
  }

  @override
  Future<String?> deleteHealthcareElement(String id) async {
    return (await api.baseHealthElementApi.rawDeleteHealthElements(base_api.ListOfIdsDto(ids: [id])))?.single.rev ??
        throwFormatException("Invalid health element id");
  }

  @override
  Future<PaginatedListHealthcareElement?> filterHealthcareElement(
    Filter<HealthcareElement> filter, {
    String? nextHealthElementId,
    int? limit,
  }) async {
    final localCrypto = api.crypto;
    final currentUser = await api.baseUserApi.getCurrentUser();
    final ccHealthElement = healthElementCryptoConfig(localCrypto);

    return (await api.baseHealthElementApi.filterHealthElements(
            currentUser!, base_api.FilterChain<base_api.HealthElementDto>(filter.toAbstractFilterDto()), ccHealthElement, nextHealthElementId, limit))
        .toPaginatedListHealthcareElement();
  }

  @override
  Future<HealthcareElement?> getHealthcareElement(String id) async {
    final localCrypto = api.crypto;
    final currentUser = await api.baseUserApi.getCurrentUser();
    final ccHealthElement = healthElementCryptoConfig(localCrypto);

    return (await api.baseHealthElementApi.getHeathElement(currentUser!, id, ccHealthElement))?.toHealthcareElement();
  }

  @override
  Future<List<String>?> matchHealthcareElement(Filter filter) {
    return api.baseHealthElementApi.rawMatchHealthElementsBy(filter.toAbstractFilterDto());
  }

  @override
  Future<HealthcareElement> giveAccessTo(HealthcareElement healthcareElement, String delegatedTo) async {
    final localCrypto = api.crypto;
    final currentUser = await api.baseUserApi.getCurrentUser();

    // Check if delegatedBy has access
    if (!healthcareElement.systemMetaData!.delegations.entries.any((element) => element.key == currentUser!.dataOwnerId())) {
      throw StateError("DataOwner ${currentUser!.dataOwnerId()} does not have the right to access healthcare element ${healthcareElement.id}");
    }

    final healthcareElementDto = healthcareElement.toHealthElementDto();

    final patientId =
        (await localCrypto.decryptEncryptionKeys(currentUser!.dataOwnerId()!, healthcareElementDto.cryptedForeignKeys)).firstOrNull!.formatAsKey();
    final sfk = (await localCrypto.decryptEncryptionKeys(currentUser.dataOwnerId()!, healthcareElementDto.delegations)).firstOrNull!.formatAsKey();
    final ek = (await localCrypto.decryptEncryptionKeys(currentUser.dataOwnerId()!, healthcareElementDto.encryptionKeys)).firstOrNull!.formatAsKey();

    final delegation = await DelegationExtended.delegationBasedOn(localCrypto, currentUser.dataOwnerId()!, delegatedTo, healthcareElement.id!, sfk);

    if (healthcareElement.systemMetaData == null) {
      healthcareElement.systemMetaData = SystemMetaDataEncrypted(delegations: {
        delegatedTo: [delegation]
      });
    } else {
      healthcareElement.systemMetaData!.delegations = {...healthcareElement.systemMetaData!.delegations}..addEntries([
          MapEntry(delegatedTo, [delegation])
        ]);
    }

    healthcareElement.systemMetaData!.encryptionKeys = {...healthcareElement.systemMetaData!.encryptionKeys}..addEntries([
        MapEntry(delegatedTo, [await DelegationExtended.delegationBasedOn(localCrypto, currentUser.dataOwnerId()!, delegatedTo, healthcareElement.id!, ek)])
      ]);

    healthcareElement.systemMetaData!.cryptedForeignKeys = {...healthcareElement.systemMetaData!.cryptedForeignKeys}..addEntries([
        MapEntry(delegatedTo, [ await DelegationExtended.delegationBasedOn(localCrypto, currentUser.dataOwnerId()!, delegatedTo, healthcareElement.id!, patientId)])
      ]);

    return (await createOrModifyHealthcareElement(patientId, healthcareElement)) ??
        (throw StateError("Couldn't give access to $delegatedTo to health element ${healthcareElement.id}"));
  }
}
