import 'package:icure_dart_sdk/api.dart' as base_api;
import 'package:icure_medical_device_dart_sdk/api.dart';
import 'package:icure_medical_device_dart_sdk/utils/functional_utils.dart';
import 'package:icure_medical_device_dart_sdk/mappers/code_coding.dart';
import 'package:icure_medical_device_dart_sdk/mappers/filter.dart';
import 'package:icure_medical_device_dart_sdk/mappers/paginated_list.dart';
import 'package:icure_medical_device_dart_sdk/medtech_api.dart';

class CodingApiImpl extends CodingApi {
  CodingApiImpl(this.api);

  final MedTechApi api;

  @override
  Future<Coding?> createOrModifyCoding(Coding coding) async =>
      (await (coding.rev?.let((it) => api.codeApi.modifyCode(coding.toCodeDto())) ?? api.codeApi.createCode(coding.toCodeDto())))?.toCoding();

  @override
  Future<List<Coding>?> createOrModifyCodings(List<Coding> codings) async => (await Future.wait(codings.map((coding) async =>
      (await (coding.rev?.let((it) => api.codeApi.modifyCode(coding.toCodeDto())) ?? api.codeApi.createCode(coding.toCodeDto())))?.toCoding()
  ))).whereType<Coding>().toList();

  @override
  Future<PaginatedListCoding?> filterCoding(
    Filter filter, {
    String? nextCodingId,
    int? limit,
  }) async {
    return (await api.codeApi.filterCodesBy(filterChainCode: base_api.FilterChain<base_api.CodeDto>(filter.toAbstractFilterDto()), startDocumentId: nextCodingId, limit: limit))
        ?.toPaginatedListCoding();
  }

  @override
  Future<Coding?> getCoding(String codeId) async => (await api.codeApi.getCode(codeId))?.toCoding();

  @override
  Future<List<String>?> matchCoding(Filter filter) => api.codeApi.matchCodesBy(filter.toAbstractFilterDto());

}
