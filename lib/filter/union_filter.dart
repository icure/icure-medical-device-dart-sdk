// @dart=2.12
part of icure_medical_device_dart_sdk.api;

class UnionFilter<O> extends Filter<O> {
  UnionFilter({this.description, this.filters = const[]});

  @override
  String? description;
  List<Filter<O>> filters = [];
}
