// @dart=2.12
part of icure_medical_device_dart_sdk.api;

class HealthcareProfessionalByIdsFilter extends Filter<HealthcareProfessional> {
  HealthcareProfessionalByIdsFilter({this.description, this.ids = const {}});

  @override
  String? description;
  Set<String> ids = {};
}
