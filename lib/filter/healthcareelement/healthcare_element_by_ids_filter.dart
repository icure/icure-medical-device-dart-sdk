// @dart=2.12

part of icure_medical_device_dart_sdk.api;

class HealthcareElementByIdsFilter extends Filter<HealthcareElement> {
  @override
  String? description;
  Set<String> ids = {};
}
