// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of icure_medical_device_dart_sdk.api;

class DataSampleApiImpl extends DataSampleApi {
  DataSampleApiImpl(this.api);

  CachedMap<String, base_api.DecryptedContactDto> contactsLinkedToDataSamplesCache = CachedMap(expirationInMillis: 1000 * 60 * 5, maxSize: 5000);

  final MedTechApi api;
  final uuid = Uuid();

  @override
  Future<DataSample?> createOrModifyDataSampleFor(String patientId, DataSample dataSample) async {
    return (await createOrModifyDataSamplesFor(patientId, [dataSample]))?.single;
  }

  @override
  Future<List<DataSample>?> createOrModifyDataSamplesFor(String patientId, List<DataSample> dataSample) async {
    if (dataSample.distinctBy((e) => e.batchId).length > 1) {
      throw FormatException("Only data samples of a same batch can be processed together");
    }

    // Arbitrary : 1 service = 1K
    if (_countHierarchyOfDataSamples(0, 0, dataSample) > 1000) {
      throw FormatException("Can't process more than 1000 data samples in the same batch");
    }

    final localCrypto = api.crypto;
    final currentUser = await api.baseUserApi.getCurrentUser();

    final contactTuple = await _getContactOfDataSample(localCrypto, currentUser!, dataSample.first);
    final contactCached = contactTuple.item1;
    final existingContact = contactTuple.item2;

    final contactPatientId = await existingContact?.let((that) => _getPatientIdOfContact(localCrypto, currentUser, that));

    if (existingContact != null && contactPatientId == null) {
      throw FormatException("Can't update a batch of data samples that is not linked to any patient yet.");
    }

    if (contactPatientId != null && contactPatientId != patientId) {
      throw FormatException("Can't update the patient of a batch of data samples. Delete those samples and create new ones");
    }

    final existingPatient = await api.basePatientApi.getPatient(currentUser, patientId, patientCryptoConfig(localCrypto));
    final ccContact = contactCryptoConfig(currentUser, localCrypto);
    base_api.DecryptedContactDto? createdOrModifiedContact;

    if (contactCached && existingContact != null) {
      final serviceToModify = dataSample.map((e) => DataSampleMapper(e).toServiceDto(e.batchId));
      existingContact.services = serviceToModify.toSet();
      existingContact.openingDate =
          serviceToModify.where((element) => element.openingDate != null || element.valueDate != null).map((e) => e.openingDate ?? e.valueDate!).min;
      existingContact.closingDate =
          serviceToModify.where((element) => element.closingDate != null || element.valueDate != null).map((e) => e.closingDate ?? e.valueDate!).max;

      createdOrModifiedContact = await api.baseContactApi.modifyContact(currentUser, existingContact, ccContact);
    } else {
      final contactToCreate = _createContactDtoBasedOn(dataSample, existingContact);
      createdOrModifiedContact = await api.baseContactApi.createContactWithPatient(currentUser, existingPatient!, contactToCreate, ccContact);
    }

    createdOrModifiedContact!.services.forEach((service) => contactsLinkedToDataSamplesCache.put(service.id, createdOrModifiedContact!));

    return createdOrModifiedContact.services.map((e) => e.toDataSample(createdOrModifiedContact!.id)).toList();
  }

  @override
  Future<String?> deleteAttachment(String dataSampleId, String documentId) async {
    final localCrypto = api.crypto;
    final currentUser = await api.baseUserApi.getCurrentUser();

    final base_api.DecryptedContactDto existingContact =
        (await _findContactsForDataSampleIds(currentUser!, localCrypto, [dataSampleId])).firstOrNull() ??
            (throw StateError("Could not find batch information of the data sample $dataSampleId"));

    final base_api.DecryptedServiceDto existingService =
        existingContact.services.findFirst((element) => element.id == dataSampleId) ?? (throw StateError("Could not find data sample $dataSampleId"));

    final contactPatientId = (await _getPatientIdOfContact(localCrypto, currentUser, existingContact)) ??
        (throw FormatException("Can not set an attachment to a data sample not linked to a patient"));

    final contentToDelete = existingService.content.entries.findFirst((input) => input.value.documentId == documentId)?.key ??
        (throw FormatException("Id $documentId does not reference any document in the data sample $dataSampleId"));

    existingService.content.removeWhere((key, value) => key != contentToDelete);
    createOrModifyDataSampleFor(contactPatientId, existingService.toDataSample(contactPatientId));

    return documentId;
  }

  @override
  Future<String?> deleteDataSample(String dataSampleId) async {
    return (await deleteDataSamples([dataSampleId]))?.firstOrNull() ?? (throw StateError("Couldn't delete data sample $dataSampleId"));
  }

  @override
  Future<List<String>?> deleteDataSamples(List<String> requestBody) async {
    final localCrypto = api.crypto;
    final currentUser = await api.baseUserApi.getCurrentUser();

    final base_api.DecryptedContactDto existingContact =
        (await _findContactsForDataSampleIds(currentUser!, localCrypto, requestBody)).firstOrNull() ??
            (throw StateError("Could not find batch information of the data sample $requestBody"));

    final existingServiceIds = existingContact.services.map((e) => e.id);
    if (requestBody.any((element) => !existingServiceIds.contains(element))) {
      throw StateError("Could not find all data samples in same batch ${existingContact.id}");
    }

    final contactPatient = (await _getPatientOfContact(localCrypto, currentUser, existingContact)) ??
        (throw StateError("Couldn't find patient related to batch of data samples ${existingContact.id}"));
    final servicesToDelete = existingContact.services.where((element) => requestBody.contains(element.id));

    return (await api.baseContactApi
            .deleteServices(currentUser, contactPatient, servicesToDelete.toList(), contactCryptoConfig(currentUser, localCrypto)))
        ?.services
        .where((element) => requestBody.contains(element.id))
        .where((element) => element.endOfLife != null)
        .map((e) => e.id)
        .toList();
  }

  @override
  Future<PaginatedListDataSample?> filterDataSample(Filter<DataSample> filter, {String? nextDataSampleId, int? limit}) async {
    final localCrypto = api.crypto;
    final currentUser = await api.baseUserApi.getCurrentUser();

    return PaginatedListServiceDtoMapper((await api.baseContactApi
            .filterServicesBy(currentUser!, base_api.FilterChain(filter.toAbstractFilterDto()), null, nextDataSampleId, limit, localCrypto))!)
        .toPaginatedListDataSample();
  }

  @override
  Future<DataSample?> getDataSample(String dataSampleId) async {
    return ServiceDtoMapper(await _getServiceFromICure(dataSampleId))?.toDataSample(null) ??
        (throw FormatException("Id $dataSampleId does not correspond to any existing data sample"));
  }

  @override
  Future<MultipartFile?> getDataSampleAttachmentContent(String dataSampleId, String documentId, String attachmentId) async {
    final localCrypto = api.crypto;
    final currentUser = await api.baseUserApi.getCurrentUser();

    final documentOfAttachment = await _getDataSampleAttachmentDocumentFromICure(localCrypto, currentUser!, dataSampleId, documentId);
    return api.baseDocumentApi.rawGetDocumentAttachment(documentId, attachmentId,
        enckeys: (await _getDocumentEncryptionKeys(localCrypto, currentUser, documentOfAttachment)).join(","), fileName: null);
  }

  @override
  Future<Document?> getDataSampleAttachmentDocument(String dataSampleId, String documentId) async {
    final localCrypto = api.crypto;
    final currentUser = await api.baseUserApi.getCurrentUser();

    return DocumentDtoMapper((await _getDataSampleAttachmentDocumentFromICure(localCrypto, currentUser!, dataSampleId, documentId))).toDocument();
  }

  @override
  Future<List<String>?> matchDataSample(Filter filter) async {
    return await api.baseContactApi.rawMatchServicesBy(filter.toAbstractFilterDto());
  }

  @override
  Future<Document?> setDataSampleAttachment(String dataSampleId, ByteStream body,
      {String? documentName, String? documentVersion, String? documentExternalUuid, String? documentLanguage}) async {

    final localCrypto = api.crypto;
    final currentUser = await api.baseUserApi.getCurrentUser();

    final existingDataSample = await getDataSample(dataSampleId);
    final contactDataSample = (await _getContactOfDataSample(localCrypto, currentUser!, existingDataSample!)).item2
        ?? throwFormatException("Could not find batch information of the data sample $dataSampleId");

    final patientIdOfContact = (await _getPatientIdOfContact(localCrypto, currentUser, contactDataSample!))
        ?? throwFormatException("Can not set an attachment to a data sample not linked to a patient");

    final documentToCreate = base_api.DecryptedDocumentDto(
        id: uuid.v4(options: {'rng': UuidUtil.cryptoRNG}),
        name: documentName,
        version: documentVersion,
        externalUuid: documentExternalUuid,
        mainUti: UtiDetector.getUtiFor(documentName)
    );


    final documentCC = documentCryptoConfig(localCrypto);
    final createdDocument = await api.baseDocumentApi.createDocument(currentUser, documentToCreate, documentCC)
      ?? throwFormatException("Could not create document for data sample $dataSampleId");

    // Update data sample with documentId
    final contentIso = documentLanguage ?? "en";
    existingDataSample.content[contentIso] = Content(documentId: createdDocument!.id);
    createOrModifyDataSampleFor(patientIdOfContact!, existingDataSample);

    // Add attachment to document
    List<int> docDigest = [];
    final String? docEncKey = (await _getDocumentEncryptionKeys(localCrypto, currentUser, createdDocument)).firstOrNull();
    await api.baseDocumentApi.setAttachmentTo(
          currentUser,
          createdDocument.id,
          ByteStream(body.map((bytes) {
            docDigest = bytes;
            return bytes;
          })),
          docEncKey,
          documentCC
    );

    // Update document with digest
    createdDocument.hash = sha256.convert(docDigest).toString();
    final finalDoc = await api.baseDocumentApi.modifyDocument(currentUser, createdDocument, documentCC);

    return finalDoc?.toDocument();
  }

  int _countHierarchyOfDataSamples(int currentCount, int dataSampleIndex, List<DataSample> dataSamples) {
    if (dataSampleIndex >= dataSamples.length) {
      return currentCount;
    }
    final currentDS = dataSamples[dataSampleIndex];
    final dataSampleCount = currentDS.content.values
        .where((element) => element.compoundValue.isNotEmpty)
        .sumOf((input) => _countHierarchyOfDataSamples(0, 0, input.compoundValue));
    return _countHierarchyOfDataSamples(currentCount + dataSampleCount, dataSampleIndex + 1, dataSamples);
  }

  Future<Tuple2<bool, base_api.DecryptedContactDto?>> _getContactOfDataSample(Crypto localCrypto, base_api.UserDto currentUser, DataSample dataSample,
      {bool bypassCache = false}) async {
    final cachedContact = dataSample.id?.let((dsId) => contactsLinkedToDataSamplesCache.getIfPresent(dsId));
    if (cachedContact != null && !bypassCache) {
      return Tuple2(true, cachedContact);
    } else {
      final base_api.DecryptedContactDto? contact = await dataSample.batchId
          ?.let((that) async => await api.baseContactApi.getContact(currentUser, that, contactCryptoConfig(currentUser, localCrypto)));
      return Tuple2(false, contact);
    }
  }

  Future<String?> _getPatientIdOfContact(Crypto localCrypto, base_api.UserDto currentUser, base_api.DecryptedContactDto contactDto) async =>
      (await localCrypto.decryptEncryptionKeys(currentUser.dataOwnerId()!, contactDto.cryptedForeignKeys)).single;

  base_api.DecryptedContactDto _createContactDtoBasedOn(List<DataSample> dataSamples, [base_api.DecryptedContactDto? existingContact = null]) {
    final servicesToCreate = dataSamples.map((e) => e.toServiceDto(e.batchId)).map((e) {
      e.modified = null;
      return e;
    });
    return _createContactDtoUsing(servicesToCreate.toSet(), existingContact);
  }

  base_api.DecryptedContactDto _createContactDtoUsing(Set<base_api.DecryptedServiceDto> servicesToCreate,
      [base_api.DecryptedContactDto? existingContact = null]) {
    base_api.DecryptedContactDto baseContact;
    if (existingContact != null) {
      existingContact.id = uuid.v4(options: {'rng': UuidUtil.cryptoRNG});
      existingContact.rev = null;
      existingContact.modified = DateTime.now().millisecondsSinceEpoch;
      baseContact = existingContact;
    } else {
      baseContact = base_api.DecryptedContactDto(id: uuid.v4(options: {'rng': UuidUtil.cryptoRNG}));
    }

    baseContact.services = servicesToCreate;
    baseContact.openingDate =
        servicesToCreate.where((element) => element.openingDate != null || element.valueDate != null).map((e) => e.openingDate ?? e.valueDate!).min;
    baseContact.closingDate =
        servicesToCreate.where((element) => element.closingDate != null || element.valueDate != null).map((e) => e.closingDate ?? e.valueDate!).max;

    return baseContact;
  }

  Future<Set<base_api.DecryptedContactDto>> _findContactsForDataSampleIds(
      base_api.UserDto currentUser, Crypto localCrypto, List<String> dataSampleIds) async {
    final cachedContacts = contactsLinkedToDataSamplesCache.getAllPresent(dataSampleIds);
    final dataSampleIdsToSearch = dataSampleIds.where((element) => !cachedContacts.containsKey(element));

    if (dataSampleIdsToSearch.isNotEmpty) {
      final List<base_api.DecryptedContactDto> notCachedContacts = (await api.baseContactApi.filterContactsBy(
              currentUser,
              base_api.FilterChain<base_api.ContactDto>(base_api.ContactByServiceIdsFilter(ids: dataSampleIdsToSearch.toSet())),
              null,
              null,
              dataSampleIdsToSearch.length,
              contactCryptoConfig(currentUser, localCrypto)))
          ?.rows ?? [];
      notCachedContacts.sort((a, b) => a.modified!.compareTo(b.modified!));

      // Caching
      notCachedContacts.forEach((contact) {
        contact.services
            .where((service) => dataSampleIdsToSearch.contains(service.id))
            .forEach((service) => contactsLinkedToDataSamplesCache.put(service.id, contact));
      });

      return [...cachedContacts.values, ...notCachedContacts].toSet();
    } else {
      return cachedContacts.values.toSet();
    }
  }

  Future<base_api.DecryptedPatientDto?> _getPatientOfContact(
      Crypto localCrypto, base_api.UserDto currentUser, base_api.DecryptedContactDto contactDto) async {
    return (await _getPatientIdOfContact(localCrypto, currentUser, contactDto))
        ?.let((that) => api.basePatientApi.getPatient(currentUser, that, patientCryptoConfig(localCrypto)));
  }

  Future<base_api.DecryptedServiceDto?> _getServiceFromICure(String dataSampleId) async {
    final localCrypto = api.crypto;
    final currentUser = await api.baseUserApi.getCurrentUser();

    return (await api.baseContactApi.listServices(currentUser!, base_api.ListOfIdsDto(ids: [dataSampleId]), localCrypto)).firstOrNull();
  }

  Future<base_api.DecryptedDocumentDto> _getDataSampleAttachmentDocumentFromICure(
      Crypto localCrypto, base_api.UserDto currentUser, String dataSampleId, String documentId) async {
    final existingDataSample = await getDataSample(dataSampleId);
    if (existingDataSample!.content.entries.findFirst((input) => input.value.documentId == documentId) == null) {
      throw FormatException("Id $documentId does not reference any document in the data sample $dataSampleId");
    }

    return (await api.baseDocumentApi.getDocument(currentUser, documentId, documentCryptoConfig(localCrypto)))!;
  }

  Future<Set<String>> _getDocumentEncryptionKeys(Crypto localCrypto, base_api.UserDto currentUser, base_api.DecryptedDocumentDto document) async {
    return await localCrypto.decryptEncryptionKeys(currentUser.findDataOwnerId(), document.encryptionKeys);
  }

  Future<DecryptedContactDto?> _getContactOfDataSampleOrElse(UserDto user, DataSample dataSample, Crypto localCrypto, Function orElse) async {
    try {
      final contactTuple = await _getContactOfDataSample(localCrypto, user, dataSample, bypassCache: true);
      return contactTuple.item2;
    } on FormatException {
      return orElse();
    }
  }

  @override
  Future<DataSample> giveAccessTo(DataSample dataSample, String delegatedTo) async {
    final Crypto localCrypto = api.crypto;
    final currentUser = await api.baseUserApi.getCurrentUser();

    final contact = await _getContactOfDataSampleOrElse(currentUser!, dataSample, localCrypto,
        () => throw StateError("DataOwner ${currentUser.dataOwnerId()} does not have the right to access dataSample ${dataSample.id}"));

    final patientId = (await localCrypto.decryptEncryptionKeys(currentUser.dataOwnerId()!, contact!.cryptedForeignKeys)).firstOrNull()!.formatAsKey();
    final sfk = (await localCrypto.decryptEncryptionKeys(currentUser.dataOwnerId()!, contact.delegations)).firstOrNull()!.formatAsKey();
    final ek = (await localCrypto.decryptEncryptionKeys(currentUser.dataOwnerId()!, contact.encryptionKeys)).firstOrNull()!.formatAsKey();

    final ccContact = contactCryptoConfig(currentUser, localCrypto);

    final keyAndOwner = await localCrypto.encryptAESKeyForHcp(currentUser.dataOwnerId()!, delegatedTo, contact!.id, sfk);
    final delegation = Delegation(owner: currentUser.dataOwnerId(), delegatedTo: delegatedTo, key: keyAndOwner.item1);

    contact.delegations = {...contact.delegations}..addEntries([
        MapEntry(delegatedTo, [delegation.toDelegationDto()].toSet())
      ]);

    contact.encryptionKeys = {...contact.encryptionKeys}..addEntries([
        MapEntry(
            delegatedTo,
            [
              DelegationDto(
                  owner: currentUser.dataOwnerId(),
                  delegatedTo: delegatedTo,
                  key: (await localCrypto.encryptAESKeyForHcp(currentUser.dataOwnerId()!, delegatedTo, contact.id, ek)).item1)
            ].toSet())
      ]);

    contact.cryptedForeignKeys = {...contact.cryptedForeignKeys}..addEntries([
        MapEntry(
            delegatedTo,
            [
              DelegationDto(
                  owner: currentUser.dataOwnerId(),
                  delegatedTo: delegatedTo,
                  key: (await localCrypto.encryptAESKeyForHcp(currentUser.dataOwnerId()!, delegatedTo, contact.id, patientId)).item1)
            ].toSet())
      ]);

    final updatedContact = await api.baseContactApi.modifyContact(currentUser, contact, ccContact);

    return updatedContact?.services.firstOrNull()?.toDataSample(updatedContact.id) ?? (throw StateError("Couldn't give access to dataSample"));
  }
}
