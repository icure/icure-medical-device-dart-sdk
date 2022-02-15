import 'package:http/src/multipart_file.dart';
import 'package:icure_medical_device_dart_sdk/api.dart';
import 'package:icure_medical_device_dart_sdk/medtech_api.dart';
import 'package:uuid/uuid.dart';

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
  Future<List<DataSample>?> createOrModifyDataSamplesFor(String patientId, List<DataSample> dataSample) {
    // TODO: implement createOrModifyDataSamplesFor
    throw UnimplementedError();
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
  Future<Document?> setDataSampleAttachment(String dataSampleId, MultipartFile body, {String? documentName, String? documentVersion, String? documentExternalUuid, String? documentLanguage}) {
    // TODO: implement setDataSampleAttachment
    throw UnimplementedError();
  }
}