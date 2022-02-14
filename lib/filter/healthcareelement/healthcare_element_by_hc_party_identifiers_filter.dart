// @dart=2.12

part of icure_medical_device_dart_sdk.api;

class HealthcareElementByHcPartyIdentifiersFilter extends Filter<HealthcareElement> {
  HealthcareElementByHcPartyIdentifiersFilter({this.description, this.healthcarePartyId, this.identifiers = const []});

  @override
  String? description;
  String? healthcarePartyId;
  List<Identifier> identifiers = [];
}
