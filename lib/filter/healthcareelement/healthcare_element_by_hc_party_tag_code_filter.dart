// @dart=2.12

part of icure_medical_device_dart_sdk.api;

class HealthcareElementByHcPartyTagCodeFilter extends Filter<HealthcareElement> {
  HealthcareElementByHcPartyTagCodeFilter({this.description, this.healthcarePartyId, this.codeType, this.codeNumber, this.tagType, this.tagCode, this.status});

  @override
  String? description;
  String? healthcarePartyId;
  String? codeType;
  String? codeNumber;
  String? tagType;
  String? tagCode;
  int? status;
}
