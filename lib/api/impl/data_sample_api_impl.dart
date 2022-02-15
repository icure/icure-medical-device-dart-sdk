import 'package:http/src/multipart_file.dart';
import 'package:icure_dart_sdk/api.dart';
import 'package:icure_dart_sdk/crypto/crypto.dart';
import 'package:icure_dart_sdk/util/collection_utils.dart';
import 'package:icure_medical_device_dart_sdk/api.dart';
import 'package:icure_medical_device_dart_sdk/mappers/filter.dart';
import 'package:icure_medical_device_dart_sdk/mappers/paginated_list.dart';
import 'package:icure_medical_device_dart_sdk/mappers/service_data_sample.dart';
import 'package:icure_medical_device_dart_sdk/medtech_api.dart';
import 'package:icure_medical_device_dart_sdk/utils/iterable_utils.dart';
import 'package:tuple/tuple.dart';
import 'package:uuid/uuid.dart';
import 'package:uuid/uuid_util.dart';

class DataSampleApiImpl extends DataSampleApi {
  DataSampleApiImpl(this.api);

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

    if (_countHierarchyOfDataSamples(0, 0, dataSample) > 1000) {
      // Arbitrary : 1 service = 1K
      throw FormatException("Can't process more than 1000 data samples in the same batch");
    }

    final localCrypto = api.localCrypto;
    final currentUser = await api.userApi.getCurrentUser();

    final contactTuple = await _getContactOfDataSample(localCrypto, currentUser!, dataSample.first);
    final contactCached = contactTuple.item1;
    final existingContact = contactTuple.item2;
    final contactPatientId = await existingContact?.let((that) => _getPatientIdOfContact(localCrypto, currentUser, that));

    if (contactPatientId != null && contactPatientId != patientId) {
      throw FormatException("Can't update the patient of a batch of data samples. Delete those samples and create new ones");
    }

    final existingPatient = await api.patientApi.getPatient(currentUser, patientId, patientCryptoConfig(localCrypto));
    final ccContact = contactCryptoConfig(currentUser, localCrypto);
    DecryptedContactDto? createdOrModifiedContact;
    if (contactCached && existingContact != null) {
      final serviceToModify = dataSample.map((e) => DataSampleMapper(e).toServiceDto(e.batchId));
      existingContact.services = serviceToModify.toSet();
      existingContact.openingDate =
          serviceToModify.where((element) => element.openingDate != null || element.valueDate != null).map((e) => e.openingDate ?? e.valueDate!).min;
      existingContact.closingDate =
          serviceToModify.where((element) => element.closingDate != null || element.valueDate != null).map((e) => e.closingDate ?? e.valueDate!).max;

      createdOrModifiedContact = await api.contactApi.modifyContact(currentUser, existingContact, ccContact);
    } else {
      final contactToCreate = _createContactDtoBasedOn(dataSample, existingContact);
      createdOrModifiedContact = await api.contactApi.createContactWithPatient(currentUser, existingPatient!, contactToCreate, ccContact);
    }

    //TODO: Caching createdOrModifiedContact
    return createdOrModifiedContact!.services.map((e) => e.toDataSample(createdOrModifiedContact!.id)).toList();
  }

  @override
  Future<String?> deleteAttachment(String dataSampleId, String documentId) async {
    final localCrypto = api.localCrypto;
    final currentUser = await api.userApi.getCurrentUser();

    final DecryptedContactDto existingContact = (await _findContactsForDataSampleIds(currentUser!, localCrypto, [dataSampleId])).firstOrNull() ??
        (throw StateError("Could not find batch information of the data sample $dataSampleId"));
    final DecryptedServiceDto existingService =
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
    final localCrypto = api.localCrypto;
    final currentUser = await api.userApi.getCurrentUser();

    final DecryptedContactDto existingContact = (await _findContactsForDataSampleIds(currentUser!, localCrypto, requestBody)).firstOrNull() ??
        (throw StateError("Could not find batch information of the data sample $requestBody"));

    final existingServiceIds = existingContact.services.map((e) => e.id);
    if (requestBody.any((element) => !existingServiceIds.contains(element))) {
      throw StateError("Could not find all data samples in same batch ${existingContact.id}");
    }

    final contactPatient = (await _getPatientOfContact(localCrypto, currentUser, existingContact)) ??
        (throw StateError("Couldn't find patient related to batch of data samples ${existingContact.id}"));
    final servicesToDelete = existingContact.services.where((element) => requestBody.contains(element.id));

    return (await api.contactApi
            .deleteServices(currentUser, contactPatient, servicesToDelete.toList(), contactCryptoConfig(currentUser, localCrypto)))
        ?.services
        .where((element) => requestBody.contains(element.id))
        .where((element) => element.endOfLife != null)
        .map((e) => e.id)
        .toList();
  }

  @override
  Future<PaginatedListDataSample?> filterDataSample(Filter filter, {String? nextDataSampleId, int? limit}) async {
    final localCrypto = api.localCrypto;
    final currentUser = await api.userApi.getCurrentUser();

    return PaginatedListServiceDtoMapper((await api.contactApi
            .filterServicesBy(currentUser!, FilterChain(FilterMapper(filter).toAbstractFilterDto()), null, nextDataSampleId, limit, localCrypto))!)
        .toPaginatedListDataSample();
  }

  @override
  Future<DataSample?> getDataSample(String dataSampleId) async {
    return ServiceDtoMapper(await _getServiceFromICure(dataSampleId))?.toDataSample(null) ??
        (throw FormatException("Id $dataSampleId does not correspond to any existing data sample"));
  }

  @override
  Future<MultipartFile?> getDataSampleAttachmentContent(String dataSampleId, String documentId, String attachmentId) {
    // TODO: implement getDataSampleAttachmentContent
    throw UnimplementedError();
  }

  @override
  Future<Document?> getDataSampleAttachmentDocument(String dataSampleId, String documentId) {
    // TODO: implement getDataSampleAttachmentDocument
    throw UnimplementedError();
  }

  @override
  Future<List<String>?> matchDataSample(Filter filter) {
    // TODO: implement matchDataSample
    throw UnimplementedError();
  }

  @override
  Future<Document?> setDataSampleAttachment(String dataSampleId, MultipartFile body,
      {String? documentName, String? documentVersion, String? documentExternalUuid, String? documentLanguage}) {
    // TODO: implement setDataSampleAttachment
    throw UnimplementedError();
  }

  int _countHierarchyOfDataSamples(int currentCount, int dataSampleIndex, List<DataSample> dataSamples) {
    if (dataSampleIndex >= dataSamples.length) {
      return currentCount;
    }
    final currentDS = dataSamples[dataSampleIndex];
    final dataSampleCount = currentDS.content.values
        .where((element) => element.compoundValue.isEmpty)
        .sumOf((input) => _countHierarchyOfDataSamples(0, 0, input.compoundValue!));
    return _countHierarchyOfDataSamples(currentCount + dataSampleCount, dataSampleIndex + 1, dataSamples);
  }

  Future<Tuple2<bool, DecryptedContactDto?>> _getContactOfDataSample(LocalCrypto localCrypto, UserDto currentUser, DataSample dataSample) async {
    // TODO: Caching contact ?
    final DecryptedContactDto? contact = await dataSample.batchId
        ?.let((that) async => await api.contactApi.getContact(currentUser, that, contactCryptoConfig(currentUser, localCrypto)));
    return Tuple2(false, contact);
  }

  Future<String?> _getPatientIdOfContact(LocalCrypto localCrypto, UserDto currentUser, DecryptedContactDto contactDto) async =>
      (await localCrypto.decryptEncryptionKeys(currentUser.healthcarePartyId!, contactDto.cryptedForeignKeys)).single;

  DecryptedContactDto _createContactDtoBasedOn(List<DataSample> dataSamples, [DecryptedContactDto? existingContact = null]) {
    final servicesToCreate = dataSamples.map((e) => e.toServiceDto(e.batchId)).map((e) {
      e.modified = null;
      return e;
    });
    return _createContactDtoUsing(servicesToCreate.toSet(), existingContact);
  }

  DecryptedContactDto _createContactDtoUsing(Set<DecryptedServiceDto> servicesToCreate, [DecryptedContactDto? existingContact = null]) {
    DecryptedContactDto baseContact;
    if (existingContact != null) {
      existingContact.id = uuid.v4(options: {'rng': UuidUtil.cryptoRNG});
      existingContact.rev = null;
      existingContact.modified = DateTime.now().millisecondsSinceEpoch;
      baseContact = existingContact;
    } else {
      baseContact = DecryptedContactDto(id: uuid.v4(options: {'rng': UuidUtil.cryptoRNG}));
    }

    baseContact.services = servicesToCreate;
    baseContact.openingDate =
        servicesToCreate.where((element) => element.openingDate != null || element.valueDate != null).map((e) => e.openingDate ?? e.valueDate!).min;
    baseContact.closingDate =
        servicesToCreate.where((element) => element.closingDate != null || element.valueDate != null).map((e) => e.closingDate ?? e.valueDate!).max;

    return baseContact;
  }

  Future<Set<DecryptedContactDto>> _findContactsForDataSampleIds(UserDto currentUser, LocalCrypto localCrypto, List<String> dataSampleIds) async {
    final cachedContacts = Map<Tuple2<String, String>, DecryptedContactDto>.of({}); //TODO: Caching contacts
    final dataSampleIdsToSearch = dataSampleIds.where((element) => !cachedContacts.containsKey(Tuple2(currentUser.id, element)));

    if (dataSampleIdsToSearch.isNotEmpty) {
      final List<DecryptedContactDto>? notCachedContacts = (await api.contactApi.filterContactsBy(
              currentUser,
              FilterChain<ContactDto>(ContactByServiceIdsFilter(ids: dataSampleIdsToSearch.toSet())),
              null,
              null,
              dataSampleIdsToSearch.length,
              contactCryptoConfig(currentUser, localCrypto)))
          ?.rows;
      notCachedContacts?.sort((a, b) => a.modified!.compareTo(b.modified!));

      //TODO : Caching contacts

      return [...cachedContacts.values, ...?notCachedContacts].toSet();
    } else {
      return cachedContacts.values.toSet();
    }
  }

  Future<DecryptedPatientDto?> _getPatientOfContact(LocalCrypto localCrypto, UserDto currentUser, DecryptedContactDto contactDto) async {
    return (await _getPatientIdOfContact(localCrypto, currentUser, contactDto))
        ?.let((that) => api.patientApi.getPatient(currentUser, that, patientCryptoConfig(localCrypto)));
  }

  Future<DecryptedServiceDto?> _getServiceFromICure(String dataSampleId) async {
    final localCrypto = api.localCrypto;
    final currentUser = await api.userApi.getCurrentUser();

    return (await api.contactApi.listServices(currentUser!, ListOfIdsDto(ids: [dataSampleId]), localCrypto)).firstOrNull();
  }
}
