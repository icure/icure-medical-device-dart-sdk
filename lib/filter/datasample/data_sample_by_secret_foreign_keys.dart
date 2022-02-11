// @dart=2.12
part of icure_medical_device_dart_sdk.api;

class DataSampleBySecretForeignKeys extends Filter<DataSample> {
  @override
  String? description;
  String? healthcarePartyId;
  Set<String> patientSecretForeignKeys = {};
}
