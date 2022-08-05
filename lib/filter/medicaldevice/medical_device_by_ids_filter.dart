// @dart=2.12
part of icure_medical_device_dart_sdk.api;


class MedicalDeviceByIdsFilter extends Filter<MedicalDevice> {
  MedicalDeviceByIdsFilter({this.description, this.ids = const {}});

  @override String? description;
  Set<String> ids = {};
}
