// @dart=2.12
part of icure_medical_device_dart_sdk.api;

class PatientByHcPartyFilter extends Filter<Patient> {
  @override String? description;
  String? healthcarePartyId;
}
