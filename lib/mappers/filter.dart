import 'package:icure_dart_sdk/api.dart' as api;
import 'package:icure_medical_device_dart_sdk/api.dart';
import 'package:icure_medical_device_dart_sdk/utils/functional_utils.dart';

import 'identifier.dart';

extension FilterMapper<F> on Filter<F> {
  api.AbstractFilterDto<T> toAbstractFilterDto<F, T>() =>
      [F.runtimeType, T.runtimeType].let((t) {
        switch (t) {
          case [Coding, api.CodeDto]:
            return (this as Filter<Coding>).toAbstractFilterCodeDto() as api.AbstractFilterDto<T>;
          case [DataSample, api.ServiceDto]:
            return (this as Filter<DataSample>).toAbstractFilterServiceDto() as api.AbstractFilterDto<T>;
          case [MedicalDevice, api.DeviceDto]:
            return (this as Filter<MedicalDevice>).toAbstractFilterDeviceDto() as api.AbstractFilterDto<T>;
          case [HealthcareProfessional, api.HealthcarePartyDto]:
            return (this as Filter<HealthcareProfessional>).toAbstractFilterHealthcarePartyDto() as api.AbstractFilterDto<T>;
          case [HealthcareElement, api.HealthElementDto]:
            return (this as Filter<HealthcareElement>).toAbstractFilterHealthElementDto() as api.AbstractFilterDto<T>;
          case [Patient, api.PatientDto]:
            return (this as Filter<Patient>).toAbstractFilterPatientDto() as api.AbstractFilterDto<T>;
          case [User, api.UserDto]:
            return (this as Filter<User>).toAbstractFilterUserDto() as api.AbstractFilterDto<T>;
        }
        throw FormatException("No mapper for ${F} -> ${T}");
      });
}

extension CodingFilterMapper on Filter<Coding>{
  api.AbstractFilterDto<api.CodeDto> toAbstractFilterCodeDto() {
    if (this is ComplementFilter<Coding>) {
      return (this as ComplementFilter<Coding>).toComplementFilterDto();
    }
    if (this is UnionFilter<Coding>) {
      return (this as UnionFilter<Coding>).toUnionFilterDto();
    }
    if (this is IntersectionFilter<Coding>) {
      return (this as IntersectionFilter<Coding>).toIntersectionFilterDto();
    }
    if (this is AllCodingsFilter) {
      return (this as AllCodingsFilter).toAllCodesFilterDto();
    }
    if (this is CodingByIdsFilter) {
      return (this as CodingByIdsFilter).toCodeByIdsFilterDto();
    }
    if (this is CodingByRegionTypeLabelLanguageFilter) {
      return (this as CodingByRegionTypeLabelLanguageFilter).toCodeByRegionTypeLabelLanguageFilterDto();
    }
    throw FormatException("No mapper for ${this}");
  }
}

extension ComplementCodingFilterMapper on ComplementFilter<Coding> {
  api.ComplementFilter<api.CodeDto> toComplementFilterDto() =>
      api.ComplementFilter<api.CodeDto>(
          desc: this.description, superSet: this.superSet?.toAbstractFilterCodeDto()
      );
}

extension UnionCodingFilterMapper on UnionFilter<Coding> {
  api.UnionFilter<api.CodeDto> toUnionFilterDto() =>
      api.UnionFilter<api.CodeDto>(
          desc: this.description, filters: this.filters.map((it) => it.toAbstractFilterCodeDto()).toList()
      );
}

extension IntersectionCodingFilterMapper on IntersectionFilter<Coding> {
  api.IntersectionFilter<api.CodeDto> toIntersectionFilterDto() =>
      api.IntersectionFilter<api.CodeDto>(
          desc: this.description, filters: this.filters.map((it) => it.toAbstractFilterCodeDto()).toList()
      );
}

extension AllCodingsFilterMapper on AllCodingsFilter {
  api.AllCodesFilter toAllCodesFilterDto() => api.AllCodesFilter(desc: this.description);
}
extension CodingByIdsFilterMapper on CodingByIdsFilter {
  api.CodeByIdsFilter toCodeByIdsFilterDto() => api.CodeByIdsFilter(desc: this.description, ids: this.ids);
}

extension CodingByRegionTypeLabelLanguageFilterMapper on CodingByRegionTypeLabelLanguageFilter {
  api.CodeByRegionTypeLabelLanguageFilter toCodeByRegionTypeLabelLanguageFilterDto() =>
      api.CodeByRegionTypeLabelLanguageFilter(
          desc: this.description,
          region: this.region,
          type: this.type,
          language: this.language,
          label: this.label
      );
}


extension DataSampleFilterMapper on Filter<DataSample>{
  api.AbstractFilterDto<api.ServiceDto> toAbstractFilterServiceDto() {
    if (this is ComplementFilter<DataSample>) {
      return (this as ComplementFilter<DataSample>).toComplementFilterDto();
    }
    if (this is UnionFilter<DataSample>) {
      return (this as UnionFilter<DataSample>).toUnionFilterDto();
    }
    if (this is IntersectionFilter<DataSample>) {
      return (this as IntersectionFilter<DataSample>).toIntersectionFilterDto();
    }
    if (this is DataSampleByHcPartyFilter) {
      return (this as DataSampleByHcPartyFilter).toServiceByHcPartyFilterDto();
    }
    if (this is DataSampleByHcPartyIdentifiersFilter) {
      return (this as DataSampleByHcPartyIdentifiersFilter).toServiceByHcPartyIdentifiersFilterDto();
    }
    if (this is DataSampleByHcPartyTagCodeDateFilter) {
      return (this as DataSampleByHcPartyTagCodeDateFilter).toServiceByHcPartyTagCodeDateFilterDto();
    }
    if (this is DataSampleByIdsFilter) {
      return (this as DataSampleByIdsFilter).toServiceByIdsFilterDto();
    }
    if (this is DataSampleBySecretForeignKeys) {
      return (this as DataSampleBySecretForeignKeys).toServiceBySecretForeignKeysDto();
    }
    throw FormatException("No mapper for ${this}");
  }
}

extension ComplementDataSampleFilterMapper on ComplementFilter<DataSample> {
  api.ComplementFilter<api.ServiceDto> toComplementFilterDto() =>
      api.ComplementFilter<api.ServiceDto>(
          desc: this.description, superSet: this.superSet?.toAbstractFilterServiceDto()
      );
}

extension UnionDataSampleFilterMapper on UnionFilter<DataSample> {
  api.UnionFilter<api.ServiceDto> toUnionFilterDto() =>
      api.UnionFilter<api.ServiceDto>(
          desc: this.description, filters: this.filters.map((it) => it.toAbstractFilterServiceDto()).toList()
      );
}

extension IntersectionDataSampleFilterMapper on IntersectionFilter<DataSample> {
  api.IntersectionFilter<api.ServiceDto> toIntersectionFilterDto() =>
      api.IntersectionFilter<api.ServiceDto>(
          desc: this.description, filters: this.filters.map((it) => it.toAbstractFilterServiceDto()).toList()
      );
}

extension DataSampleByHcPartyFilterMapper on DataSampleByHcPartyFilter {
  api.ServiceByHcPartyFilter toServiceByHcPartyFilterDto() => api.ServiceByHcPartyFilter(desc: this.description);
}
extension DataSampleByHcPartyIdentifiersFilterMapper on DataSampleByHcPartyIdentifiersFilter {
  api.ServiceByHcPartyIdentifiersFilter toServiceByHcPartyIdentifiersFilterDto() =>
      api.ServiceByHcPartyIdentifiersFilter(
          desc: this.description, healthcarePartyId: this.healthcarePartyId, identifiers: this.identifiers.map((it) => it.toIdentifierDto()).toList()
      );
}
extension DataSampleByHcPartyTagCodeDateFilterMapper on DataSampleByHcPartyTagCodeDateFilter {
  api.ServiceByHcPartyTagCodeDateFilter toServiceByHcPartyTagCodeDateFilterDto() =>
      api.ServiceByHcPartyTagCodeDateFilter(
          desc: this.description,
          healthcarePartyId: this.healthcarePartyId,
          patientSecretForeignKey: this.patientSecretForeignKey,
          tagType: this.tagType,
          tagCode: this.tagCode,
          codeType: this.codeType,
          codeCode: this.codeCode,
          startValueDate: this.startValueDate,
          endValueDate: this.endValueDate
      );
}
extension DataSampleByIdsFilterMapper on DataSampleByIdsFilter {
  api.ServiceByIdsFilter toServiceByIdsFilterDto() => api.ServiceByIdsFilter(desc: this.description, ids: this.ids);
}
extension DataSampleBySecretForeignKeysMapper on DataSampleBySecretForeignKeys {
  api.ServiceBySecretForeignKeys toServiceBySecretForeignKeysDto() => api.ServiceBySecretForeignKeys(
      desc: this.description, healthcarePartyId: this.healthcarePartyId, patientSecretForeignKeys: this.patientSecretForeignKeys
  );
}

extension MedicalDeviceFilterMapper on Filter<MedicalDevice>{
  api.AbstractFilterDto<api.DeviceDto> toAbstractFilterDeviceDto() {
    if (this is) {
      return
    }
    if (this is) {
      return
    }
    if (this is) {
      return
    }
    if (this is) {
      return
    }
    if (this is) {
      return
    }
    if (this is) {
      return
    }
    if (this is) {
      return
    }
    if (this is) {
      return
    }
  }
}
extension HealthcareProfessionalFilterMapper on Filter<HealthcareProfessional>{
  api.AbstractFilterDto<api.HealthcarePartyDto> toAbstractFilterHealthcarePartyDto() {
    if (this is)
  }
}
extension HealthcareElementFilterMapper on Filter<HealthcareElement>{
  api.AbstractFilterDto<api.HealthElementDto> toAbstractFilterHealthElementDto() {
    if (this is)
  }
}
extension PatientFilterMapper on Filter<Patient>{
  api.AbstractFilterDto<api.PatientDto> toAbstractFilterPatientDto() {
    if (this is)
  }
}
extension UserFilterMapper on Filter<User>{
  api.AbstractFilterDto<api.UserDto> toAbstractFilterUserDto() {
    if (this is)
  }
}
