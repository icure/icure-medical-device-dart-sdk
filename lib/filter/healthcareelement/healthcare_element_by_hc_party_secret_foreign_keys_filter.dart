// @dart=2.12
part of icure_medical_device_dart_sdk.api;

class HealthcareElementByHcPartySecretForeignKeysFilter extends Filter<HealthcareElement> {
  @override
  String? description;
  String? healthcarePartyId;
  Set<String> patientSecretForeignKeys = {};
}
