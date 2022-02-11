// @dart=2.12
part of icure_medical_device_dart_sdk.api;


class PatientByHcPartyAndSsinFilter extends Filter<Patient> {
  @override String? description;
  String? ssin;
  String? healthcarePartyId;
}
