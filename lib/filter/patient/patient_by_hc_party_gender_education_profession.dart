// @dart=2.12
part of icure_medical_device_dart_sdk.api;

class PatientByHcPartyGenderEducationProfessionFilter extends Filter<Patient> {
  @override
  String? description;
  String? healthcarePartyId;
  PatientGenderEnum? gender;
  String? education;
  String? profession;
}
