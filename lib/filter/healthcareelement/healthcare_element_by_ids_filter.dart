// @dart=2.12

part of icure_medical_device_dart_sdk.api;

class HealthcareElementByIdsFilter extends Filter<HealthcareElement> {
  HealthcareElementByIdsFilter({this.description, this.ids = const {}});

  @override
  String? description;
  Set<String> ids = {};
}
