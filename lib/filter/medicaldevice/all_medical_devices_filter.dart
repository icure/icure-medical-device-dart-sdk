// @dart=2.12

part of icure_medical_device_dart_sdk.api;

class AllMedicalDevicesFilter extends Filter<MedicalDevice> {
  AllMedicalDevicesFilter({this.description});

  @override
  String? description;
}
