// @dart=2.12
part of icure_medical_device_dart_sdk.api;

class HealthcareElementByHcPartyPatientFilter extends Filter<HealthcareElement> {
  HealthcareElementByHcPartyPatientFilter({this.description, this.healthcarePartyId, this.patientSecretForeignKeys = const {}});

  @override
  String? description;
  String? healthcarePartyId;
  Set<String> patientSecretForeignKeys = {};
}
