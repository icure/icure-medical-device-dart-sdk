// @dart=2.12

part of icure_medical_device_dart_sdk.api;

class ComplementFilter<O> extends Filter<O> {
  @override
  String? description;
  Filter<O>? superSet;
  Filter<O>? subSet;
}
