// @dart=2.12
part of icure_medical_device_dart_sdk.api;


class CodingByIdsFilter extends Filter<Coding> {
  @override String? description;
  Set<String> ids = {};
}
