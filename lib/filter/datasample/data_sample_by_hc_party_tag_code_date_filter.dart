// @dart=2.12
part of icure_medical_device_dart_sdk.api;

class DataSampleByHcPartyTagCodeDateFilter extends Filter<DataSample> {
  DataSampleByHcPartyTagCodeDateFilter(
      {this.description,
      this.healthcarePartyId,
      this.patientSecretForeignKey,
      this.tagType,
      this.tagCode,
      this.codeType,
      this.codeCode,
      this.startValueDate,
      this.endValueDate});

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
