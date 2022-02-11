// @dart=2.12
part of icure_medical_device_dart_sdk.api;

class DataSampleByIdsFilter extends Filter<DataSample> {
  @override
  String? description;
  Set<String> ids = <String>{};
}
