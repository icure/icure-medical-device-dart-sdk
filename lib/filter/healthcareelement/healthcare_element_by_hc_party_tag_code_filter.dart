// @dart=2.12

part of icure_medical_device_dart_sdk.api;

class HealthcareElementByHcPartyTagCodeFilter extends Filter<HealthcareElement> {
  @override
  String? description;
  String? healthCarePartyId;
  String? codeType;
  String? codeNumber;
  String? tagType;
  String? tagCode;
  int? status;
}
