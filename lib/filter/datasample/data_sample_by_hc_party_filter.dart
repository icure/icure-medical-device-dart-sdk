// @dart=2.12
part of icure_medical_device_dart_sdk.api;


class DataSampleByHcPartyFilter extends Filter<DataSample> {
  DataSampleByHcPartyFilter({this.description, this.hcpId});

  @override String? description;
  String? hcpId;
}
