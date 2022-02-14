// @dart=2.12

part of icure_medical_device_dart_sdk.api;

class CodingByRegionTypeLabelLanguageFilter extends Filter<Coding> {
  CodingByRegionTypeLabelLanguageFilter({this.description, this.region, this.type, this.language, this.label});

  @override
  String? description;
  String? region;
  String? type;
  String? language;
  String? label;
}
