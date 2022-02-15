//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of icure_medical_device_dart_sdk.api;


abstract class DataSampleApi {
  DataSampleApi([ApiClient? apiClient]) : apiClient = apiClient ?? defaultApiClient;

  final ApiClient apiClient;

  /// Create or update a [DataSample] for a patient
  ///
  /// When modifying a data sample, you can't update the patient of it : For this, you need to delete the faulty data sample and create a new one. When modifying the data sample, you also need to keep the same batchId : It is not possible to change the batch of a data sample.
  ///
  /// Parameters:
  ///
  /// * [String] patientId (required):
  ///
  /// * [DataSample] dataSample (required):
  Future<DataSample?> createOrModifyDataSampleFor(String patientId, DataSample dataSample,);

  /// Create or update a batch of [DataSample] for a patient
  ///
  /// All the provided data samples will be created in the same batch. If you are trying to update some data samples, then those ones need to come from the same batch.                  When modifying a data sample, you can't update the patient of it : For this, you need to delete the faulty data sample and create a new one. When modifying the data sample, you also need to keep the same batchId : It is not possible to change the batch of a data sample.                 
  ///
  /// Parameters:
  ///
  /// * [String] patientId (required):
  ///
  /// * [List<DataSample>] dataSample (required):
  Future<List<DataSample>?> createOrModifyDataSamplesFor(String patientId, List<DataSample> dataSample,);

  /// Delete an attachment of a DataSample
  ///
  /// Deletes an attachment, using its corresponding documentId
  ///
  /// Parameters:
  ///
  /// * [String] dataSampleId (required):
  ///
  /// * [String] documentId (required):
  Future<String?> deleteAttachment(String dataSampleId, String documentId,);

  /// Delete a [DataSample] by its id
  ///
  /// Deletes the data sample identified by the provided unique [dataSampleId].
  ///
  /// Parameters:
  ///
  /// * [String] dataSampleId (required):
  Future<String?> deleteDataSample(String dataSampleId,);

  /// Delete a batch of [Data Samples]
  ///
  /// Deletes the batch of data samples identified by the provided [dataSampleIds]. The data samples to delete need to be part of the same batch
  ///
  /// Parameters:
  ///
  /// * [List<String>] requestBody (required):
  Future<List<String>?> deleteDataSamples(List<String> requestBody,);

  /// Find data samples using the provided [filter].
  ///
  /// Filters are complex selectors that are built by combining basic building blocks. Examples of filters available for [DataSample] are AllDataSamplesFilter and DataSamplesByIdsFilter. This method returns a paginated list of data samples (with a cursor that lets you query the following items).
  ///
  /// Parameters:
  ///
  /// * [Filter] filter (required):
  ///   The Filter object that describes which condition(s) the elements whose the ids should be returned must fulfill
  Future<PaginatedListDataSample?> filterDataSample(Filter filter, {String? nextDataSampleId, int? limit});

  /// Get a [DataSample] by its id
  ///
  /// Each data sample is uniquely identified by a data sample id which is a UUID. This [dataSampleId] is the preferred method to retrieve one specific data sample.
  ///
  /// Parameters:
  ///
  /// * [String] dataSampleId (required):
  Future<DataSample?> getDataSample(String dataSampleId,);

  /// Get attachment content of a DataSample
  ///
  /// Data Samples may contain attachments such as prescriptions, reports, ... Use this method to get the content of an attachment
  ///
  /// Parameters:
  ///
  /// * [String] dataSampleId (required):
  ///
  /// * [String] documentId (required):
  ///
  /// * [String] attachmentId (required):
  Future<MultipartFile?> getDataSampleAttachmentContent(String dataSampleId, String documentId, String attachmentId,);

  /// Get document metadata of a DataSample attachment
  ///
  /// Data Samples may contain attachments such as prescriptions, reports, ... Use this method to get the document metadata information of an attachment
  ///
  /// Parameters:
  ///
  /// * [String] dataSampleId (required):
  ///
  /// * [String] documentId (required):
  Future<Document?> getDataSampleAttachmentDocument(String dataSampleId, String documentId,);

  /// Find data samples ids using the provided Filter.
  ///
  /// Filters are complex selectors that are built by combining basic building blocks. Examples of filters available for [DataSample] are AllDataSamplesFilter and DataSamplesByIdsFilter. This method returns a paginated list of data samples (with a cursor that lets you query the following items).
  ///
  /// Parameters:
  ///
  /// * [Filter] filter (required):
  ///   The Filter object that describes which condition(s) the elements whose the ids should be returned must fulfill
  Future<List<String>?> matchDataSample(Filter filter,);

  /// Add or update the attachment of a DataSample
  ///
  /// Link an attachment or update the attachment of a data sample
  ///
  /// Parameters:
  ///
  /// * [String] dataSampleId (required):
  ///
  /// * [MultipartFile] body (required):
  ///
  /// * [String] documentName:
  ///
  /// * [String] documentVersion:
  ///
  /// * [String] documentExternalUuid:
  ///
  /// * [String] documentLanguage:
  Future<Document?> setDataSampleAttachment(String dataSampleId, MultipartFile body, { String? documentName, String? documentVersion, String? documentExternalUuid, String? documentLanguage, });
}
