// @dart=2.12
part of icure_medical_device_dart_sdk.api;

class DataSampleByHcPartyTagCodeDateFilter extends Filter<DataSample> {
  @override
  String? description;
  String? healthcarePartyId;
  String? patientSecretForeignKey;
  String? tagType;
  String? tagCode;
  String? codeType;
  String? codeCode;
  int? startValueDate;
  int? endValueDate;
}
