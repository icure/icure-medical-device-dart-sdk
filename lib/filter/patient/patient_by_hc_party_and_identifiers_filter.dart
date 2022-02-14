// @dart=2.12
part of icure_medical_device_dart_sdk.api;

class PatientByHcPartyAndIdentifiersFilter extends Filter<Patient> {
  PatientByHcPartyAndIdentifiersFilter({this.description, this.healthcarePartyId, this.identifiers = const []});

  @override
  String? description;
  String? healthcarePartyId;
  List<Identifier> identifiers = [];
}
