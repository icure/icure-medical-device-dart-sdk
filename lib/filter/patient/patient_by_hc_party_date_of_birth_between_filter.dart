// @dart=2.12
part of icure_medical_device_dart_sdk.api;


class PatientByHcPartyDateOfBirthBetweenFilter extends Filter<Patient> {
  PatientByHcPartyDateOfBirthBetweenFilter({this.description, this.minDateOfBirth, this.maxDateOfBirth, this.healthcarePartyId});

  @override String? description;
  int? minDateOfBirth;
  int? maxDateOfBirth;
  String? healthcarePartyId;
}
