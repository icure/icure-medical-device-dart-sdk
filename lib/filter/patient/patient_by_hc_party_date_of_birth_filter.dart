// @dart=2.12
part of icure_medical_device_dart_sdk.api;

class PatientByHcPartyDateOfBirthFilter extends Filter<Patient> {
  @override
  String? description;
  int? dateOfBirth;
  String? healthcarePartyId;
}
