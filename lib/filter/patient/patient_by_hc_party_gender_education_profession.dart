// @dart=2.12
part of icure_medical_device_dart_sdk.api;

class PatientByHcPartyGenderEducationProfessionFilter extends Filter<Patient> {
  PatientByHcPartyGenderEducationProfessionFilter({this.description, this.healthcarePartyId, this.gender, this.education, this.profession});

  @override
  String? description;
  String? healthcarePartyId;
  PatientGenderEnum? gender;
  String? education;
  String? profession;
}
