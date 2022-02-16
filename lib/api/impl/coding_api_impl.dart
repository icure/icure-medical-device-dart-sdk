// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of icure_medical_device_dart_sdk.api;

class CodingApiImpl extends CodingApi {
  CodingApiImpl(this.api);

  final MedTechApi api;

  @override
  Future<Coding?> createOrModifyCoding(Coding coding) async =>
      (await (coding.rev?.let((it) => api.baseCodeApi.modifyCode(coding.toCodeDto())) ?? api.baseCodeApi.createCode(coding.toCodeDto())))?.toCoding();

  @override
  Future<List<Coding>?> createOrModifyCodings(List<Coding> codings) async => (await Future.wait(codings.map((coding) async =>
      this.createOrModifyCoding(coding)
  ))).whereType<Coding>().toList();

  @override
  Future<PaginatedListCoding?> filterCoding(
    Filter filter, {
    String? nextCodingId,
    int? limit,
  }) async {
    return (await api.baseCodeApi.filterCodesBy(filterChainCode: base_api.FilterChain<base_api.CodeDto>(filter.toAbstractFilterDto()), startDocumentId: nextCodingId, limit: limit))
        ?.toPaginatedListCoding();
  }

  @override
  Future<Coding?> getCoding(String codeId) async => (await api.baseCodeApi.getCode(codeId))?.toCoding();

  @override
  Future<List<String>?> matchCoding(Filter filter) => api.baseCodeApi.matchCodesBy(filter.toAbstractFilterDto());

}
