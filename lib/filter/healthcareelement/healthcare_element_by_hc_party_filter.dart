// @dart=2.12
part of icure_medical_device_dart_sdk.api;

class HealthcareElementByHcPartyFilter extends Filter<HealthcareElement> {
  HealthcareElementByHcPartyFilter({this.description, this.hcpId});

  @override
  String? description;
  String? hcpId;
}
