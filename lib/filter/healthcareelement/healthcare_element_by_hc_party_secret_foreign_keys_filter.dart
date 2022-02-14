// @dart=2.12
part of icure_medical_device_dart_sdk.api;

class HealthcareElementByHcPartySecretForeignKeysFilter extends Filter<HealthcareElement> {
  HealthcareElementByHcPartySecretForeignKeysFilter({this.description, this.healthcarePartyId, this.patientSecretForeignKeys = const {}});

  @override
  String? description;
  String? healthcarePartyId;
  Set<String> patientSecretForeignKeys = {};
}
