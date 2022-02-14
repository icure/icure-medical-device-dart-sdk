import 'package:icure_dart_sdk/api.dart';
import 'package:icure_medical_device_dart_sdk/api.dart';
import 'package:icure_medical_device_dart_sdk/mappers/filter.dart';
import 'package:icure_medical_device_dart_sdk/mappers/healthcare_professional.dart';
import 'package:icure_medical_device_dart_sdk/mappers/paginated_list.dart';
import 'package:icure_medical_device_dart_sdk/medtech_api.dart';
import 'package:icure_medical_device_dart_sdk/utils/functional_utils.dart';

class HealthcareProfessionalApiImpl extends HealthcareProfessionalApi {
  final MedTechApi api;

  HealthcareProfessionalApiImpl(this.api);

  @override
  Future<HealthcareProfessional?> createOrModifyHealthcareProfessional(HealthcareProfessional healthcareProfessional) async =>
      (await (healthcareProfessional.rev?.let((it) => api.healthcarePartyApi.modifyHealthcareParty(healthcareProfessional.toHealthcarePartyDto())) ??
              api.healthcarePartyApi.createHealthcareParty(healthcareProfessional.toHealthcarePartyDto())))
          ?.toHealthcareProfessional();

  @override
  Future<List<HealthcareProfessional>?> createOrModifyHealthcareProfessionals(List<HealthcareProfessional> healthcareProfessionals) async =>
      (await Future.wait(
              healthcareProfessionals.map((healthcareProfessional) async => this.createOrModifyHealthcareProfessional(healthcareProfessional))))
          .whereType<HealthcareProfessional>()
          .toList();

  @override
  Future<String?> deleteHealthcareProfessional(String healthcareProfessionalId) async =>
      (await this.deleteHealthcareProfessionals([healthcareProfessionalId]))?.first;

  @override
  Future<List<String>?> deleteHealthcareProfessionals(List<String> requestBody) async {
    return (await api.healthcarePartyApi.deleteHealthcareParties(ListOfIdsDto(ids: requestBody)))?.map((e) => e.rev!).toList();
  }

  @override
  Future<HealthcareProfessional?> getHealthcareProfessional(String healthcareProfessionalId) async {
    return HealthcarePartyDtoMapper(
            await api.healthcarePartyApi.getHealthcareParty(healthcareProfessionalId) ?? (throw ArgumentError("HealthcareProfessional not found")))
        .toHealthcareProfessional();
  }

  @override
  Future<PaginatedListHealthcareProfessional?> filterHealthcareProfessionalsBy(Filter<HealthcareProfessional> filter, {String? nextHcpId, int? limit}) async {
    return (await api.healthcarePartyApi.filterHealthPartiesBy(FilterChain<HealthcarePartyDto>(filter.toAbstractFilterDto()), startDocumentId: nextHcpId, limit: limit))
    ?.toPaginatedListHealthcareProfessional();
  }

  @override
  Future<List<String>?> matchHealthcareProfessionalsBy(Filter<HealthcareProfessional> filter) =>
      api.healthcarePartyApi.matchHealthcarePartiesBy(filter.toAbstractFilterDto());
}
