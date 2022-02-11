// @dart=2.12
part of icure_medical_device_dart_sdk.api;

class PatientByHcPartyAndActiveFilter extends Filter<Patient> {
  @override
  String? description;
  bool active = true;
  String? healthcarePartyId;
}
