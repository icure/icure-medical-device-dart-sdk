// @dart=2.12
part of icure_medical_device_dart_sdk.api;


class PatientByHcPartyNameContainsFuzzyFilter extends Filter<Patient> {
  PatientByHcPartyNameContainsFuzzyFilter({this.description, this.searchString, this.healthcarePartyId});

  @override String? description;
  String? searchString;
  String? healthcarePartyId;
}
