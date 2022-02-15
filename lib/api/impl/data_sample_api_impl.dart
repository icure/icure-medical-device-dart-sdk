import 'package:http/src/multipart_file.dart';
import 'package:icure_dart_sdk/api.dart';
import 'package:icure_dart_sdk/crypto/crypto.dart';
import 'package:icure_dart_sdk/util/functional_utils.dart';
import 'package:icure_medical_device_dart_sdk/api.dart';
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
  Future<DataSample?> createOrModifyDataSampleFor(String patientId, DataSample dataSample) {
    // TODO: implement createOrModifyDataSampleFor
    throw UnimplementedError();
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
    final contact = contactTuple.item2;
    final contactPatientId = await contact?.let((that) => _getPatientIdOfContact(localCrypto, currentUser, that));

    if (contactPatientId != null && contactPatientId != patientId) {
      throw FormatException("Can't update the patient of a batch of data samples. Delete those samples and create new ones");
    }

    final existingPatient = await api.patientApi.getPatient(currentUser, patientId, patientCryptoConfig(localCrypto));
    final ccContact = contactCryptoConfig(currentUser, localCrypto);
    DecryptedContactDto? createdOrModifiedContact;
    if (contactCached && contact != null) {
      final serviceToModify = dataSample.map((e) => DataSampleMapper(e).toServiceDto(e.batchId));
      contact.services = serviceToModify.toSet();
      contact.openingDate =
          serviceToModify.where((element) => element.openingDate != null || element.valueDate != null).map((e) => e.openingDate ?? e.valueDate!).min;
      contact.closingDate =
          serviceToModify.where((element) => element.closingDate != null || element.valueDate != null).map((e) => e.closingDate ?? e.valueDate!).max;

      createdOrModifiedContact = await api.contactApi.modifyContact(currentUser, contact, ccContact);
    } else {
      final contactToCreate = _createContactDtoBasedOn(dataSample, contact);
      createdOrModifiedContact = await api.contactApi.createContactWithPatient(currentUser, existingPatient!, contactToCreate, ccContact);
    }

    //TODO: Caching createdOrModifiedContact
    return createdOrModifiedContact!.services.map((e) => e.toDataSample(createdOrModifiedContact!.id)).toList();
  }

  @override
  Future<String?> deleteAttachment(String dataSampleId, String documentId) {
    // TODO: implement deleteAttachment
    throw UnimplementedError();
  }

  @override
  Future<String?> deleteDataSample(String dataSampleId) {
    // TODO: implement deleteDataSample
    throw UnimplementedError();
  }

  @override
  Future<List<String>?> deleteDataSamples(List<String> requestBody) {
    // TODO: implement deleteDataSamples
    throw UnimplementedError();
  }

  @override
  Future<PaginatedListDataSample?> filterDataSample(Filter filter) {
    // TODO: implement filterDataSample
    throw UnimplementedError();
  }

  @override
  Future<DataSample?> getDataSample(String dataSampleId) {
    // TODO: implement getDataSample
    throw UnimplementedError();
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
}
