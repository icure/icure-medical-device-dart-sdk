// @dart=2.12
part of icure_medical_device_dart_sdk.api;

abstract class FilterBuilder<T> {
  Future<Filter<T>> build();
}

class UserFilter extends FilterBuilder<User> {
  Set<String>? _byIds;
  List<UserFilter>? _union;
  List<UserFilter>? _intersection;

  UserFilter byIds(Set<String> byIds) {
    this._byIds = byIds;
    return this;
  }

  UserFilter union(List<UserFilter> filters) {
    this._union = filters;
    return this;
  }

  UserFilter intersection(List<UserFilter> filters) {
    this._intersection = filters;
    return this;
  }

  @override
  Future<Filter<User>> build() async {
    List<Filter<User>> filters = [
      _byIds?.let((v) => UserByIdsFilter(ids: v)),
      await _union?.let((v) async => UnionFilter<User>(filters: await Future.wait(v.map((f) async => await f.build()).toList()))),
      await _intersection?.let((v) async => IntersectionFilter<User>(filters: await Future.wait(v.map((f) async => await f.build()).toList())))
    ].whereType<Filter<User>>().toList();

    if (filters.isEmpty) {
      return AllUsersFilter();
    } else if (filters.length == 1) {
      return filters[0];
    } else {
      return IntersectionFilter(filters: filters);
    }
  }
}

class PatientFilter extends FilterBuilder<Patient> {
  String? _dataOwnerId;

  String? get dataOwnerId => this._dataOwnerId;

  Set<String>? _byIds;
  Set<Identifier>? _byIdentifiers;
  List<String>? _withSsins;
  Tuple2<DateTime?, DateTime?>? _dateOfBirthBetween;
  Tuple3<PatientGenderEnum, String?, String?>? _byGenderEducationProfession;
  String? _containsFuzzy;
  List<PatientFilter>? _union;
  List<PatientFilter>? _intersection;

  PatientFilter forDataOwner(String dataOwnerId) {
    this._dataOwnerId = dataOwnerId;
    return this;
  }

  PatientFilter byIds(Set<String> byIds) {
    this._byIds = byIds;
    return this;
  }

  PatientFilter byIdentifiers(Set<Identifier> identifiers) {
    this._byIdentifiers = identifiers;
    return this;
  }

  PatientFilter byGenderEducationProfession(PatientGenderEnum gender, {String? education = null, String? profession = null}) {
    this._byGenderEducationProfession = Tuple3(gender, education, profession);
    return this;
  }

  PatientFilter withSsins(List<String> withSsins) {
    this._withSsins = withSsins;
    return this;
  }

  PatientFilter ofAge(int age) {
    final now = DateTime.now();
    return dateOfBirthBetween(DateTime(now.year - age - 1, now.month, now.day).add(Duration(days: 1)), DateTime(now.year - age, now.month, now.day));
  }

  PatientFilter dateOfBirthBetween(DateTime from, DateTime to) {
    this._dateOfBirthBetween = Tuple2(from, to);
    return this;
  }

  PatientFilter containsFuzzy(String searchString) {
    this._containsFuzzy = searchString;
    return this;
  }

  PatientFilter union(List<PatientFilter> filters) {
    this._union = filters;
    return this;
  }

  PatientFilter intersection(List<PatientFilter> filters) {
    this._intersection = filters;
    return this;
  }

  @override
  Future<Filter<Patient>> build() async {
    if (_dataOwnerId == null) {
      throw FormatException("Hcp must be set for patient filter.");
    }
    final String dataOwnerId = _dataOwnerId!;

    List<Filter<Patient>> filters = [
      _byIds?.let((v) => PatientByIdsFilter(ids: v.toList())),
      _byIdentifiers?.let((v) => PatientByHcPartyAndIdentifiersFilter(healthcarePartyId: dataOwnerId, identifiers: v.toList())),
      _withSsins?.let((v) => PatientByHcPartyAndSsinsFilter(healthcarePartyId: dataOwnerId, ssins: v.toList())),
      _dateOfBirthBetween?.let((v) => PatientByHcPartyDateOfBirthBetweenFilter(
          healthcarePartyId: dataOwnerId, minDateOfBirth: v.item1?.toFuzzy(), maxDateOfBirth: v.item2?.toFuzzy())),
      _byGenderEducationProfession?.let((v) =>
          PatientByHcPartyGenderEducationProfessionFilter(healthcarePartyId: dataOwnerId, gender: v.item1, education: v.item2, profession: v.item3)),
      _containsFuzzy?.let((v) => PatientByHcPartyNameContainsFuzzyFilter(healthcarePartyId: dataOwnerId, searchString: v)),
      await _union
          ?.let((v) async => UnionFilter<Patient>(filters: await Future.wait(v.map((f) async => await f.forDataOwner(f.dataOwnerId ?? dataOwnerId).build()).toList()))),
      await _intersection?.let(
          (v) async => IntersectionFilter<Patient>(filters: await Future.wait(v.map((f) async => await f.forDataOwner(f.dataOwnerId ?? dataOwnerId).build()).toList())))
    ].whereType<Filter<Patient>>().toList();

    if (filters.isEmpty) {
      return PatientByHcPartyFilter(healthcarePartyId: dataOwnerId);
    } else if (filters.length == 1) {
      return filters[0];
    } else {
      return IntersectionFilter(filters: filters);
    }
  }
}

class HealthcareProfessionalFilter extends FilterBuilder<HealthcareProfessional> {
  Set<String>? _byIds;
  List<HealthcareProfessionalFilter>? _union;
  List<HealthcareProfessionalFilter>? _intersection;

  HealthcareProfessionalFilter byIds(Set<String> byIds) {
    this._byIds = byIds;
    return this;
  }

  HealthcareProfessionalFilter union(List<HealthcareProfessionalFilter> filters) {
    this._union = filters;
    return this;
  }

  HealthcareProfessionalFilter intersection(List<HealthcareProfessionalFilter> filters) {
    this._intersection = filters;
    return this;
  }

  @override
  Future<Filter<HealthcareProfessional>> build() async {
    List<Filter<HealthcareProfessional>> filters = [
      _byIds?.let((v) => HealthcareProfessionalByIdsFilter(ids: v)),
      await _union?.let((v) async => UnionFilter<HealthcareProfessional>(filters: await Future.wait(v.map((f) async => await f.build()).toList()))),
      await _intersection
          ?.let((v) async => IntersectionFilter<HealthcareProfessional>(filters: await Future.wait(v.map((f) async => await f.build()).toList())))
    ].whereType<Filter<HealthcareProfessional>>().toList();

    if (filters.isEmpty) {
      return AllHealthcareProfessionalsFilter();
    } else if (filters.length == 1) {
      return filters[0];
    } else {
      return IntersectionFilter(filters: filters);
    }
  }
}

class MedicalDeviceFilter extends FilterBuilder<MedicalDevice> {
  Set<String>? _byIds;
  List<MedicalDeviceFilter>? _union;
  List<MedicalDeviceFilter>? _intersection;

  MedicalDeviceFilter byIds(Set<String> byIds) {
    this._byIds = byIds;
    return this;
  }

  MedicalDeviceFilter union(List<MedicalDeviceFilter> filters) {
    this._union = filters;
    return this;
  }

  MedicalDeviceFilter intersection(List<MedicalDeviceFilter> filters) {
    this._intersection = filters;
    return this;
  }

  @override
  Future<Filter<MedicalDevice>> build() async {
    List<Filter<MedicalDevice>> filters = [
      _byIds?.let((v) => MedicalDeviceByIdsFilter(ids: v)),
      await _union?.let((v) async => UnionFilter<MedicalDevice>(filters: await Future.wait(v.map((f) async => await f.build()).toList()))),
      await _intersection
          ?.let((v) async => IntersectionFilter<MedicalDevice>(filters: await Future.wait(v.map((f) async => await f.build()).toList())))
    ].whereType<Filter<MedicalDevice>>().toList();

    if (filters.isEmpty) {
      return AllMedicalDevicesFilter();
    } else if (filters.length == 1) {
      return filters[0];
    } else {
      return IntersectionFilter(filters: filters);
    }
  }
}

class HealthcareElementFilter extends FilterBuilder<HealthcareElement> {
  String? _dataOwnerId;

  String? get dataOwnerId => this._dataOwnerId;

  Set<String>? _byIds;
  Set<Identifier>? _byIdentifiers;
  HealthcareElementByHcPartyTagCodeFilter? _byTagCodeFilter;
  Tuple2<Crypto, List<PotentiallyEncryptedPatient>>? _forPatients;

  List<HealthcareElementFilter>? _union;
  List<HealthcareElementFilter>? _intersection;

  HealthcareElementFilter forDataOwner(String dataOwnerId) {
    this._dataOwnerId = dataOwnerId;
    return this;
  }

  HealthcareElementFilter byIds(Set<String> byIds) {
    this._byIds = byIds;
    return this;
  }

  HealthcareElementFilter byIdentifiers(Set<Identifier> identifiers) {
    this._byIdentifiers = identifiers;
    return this;
  }

  HealthcareElementFilter byTagCodeFilter(
      {String? tagType = null, String? tagCode = null, String? codeType = null, String? codeNumber = null, int? status = null}) {
    this._byTagCodeFilter =
        HealthcareElementByHcPartyTagCodeFilter(tagType: tagType, tagCode: tagCode, codeType: codeType, codeNumber: codeNumber, status: status);
    return this;
  }

  HealthcareElementFilter forPatients(Crypto crypto, List<PotentiallyEncryptedPatient> patients) {
    this._forPatients = Tuple2(crypto, patients);
    return this;
  }

  HealthcareElementFilter union(List<HealthcareElementFilter> filters) {
    this._union = filters;
    return this;
  }

  HealthcareElementFilter intersection(List<HealthcareElementFilter> filters) {
    this._intersection = filters;
    return this;
  }

  @override
  Future<Filter<HealthcareElement>> build() async {
    if (_dataOwnerId == null) {
      throw FormatException("Data Owner must be set for patient filter.");
    }

    List<Filter<HealthcareElement>> filters = [
      _byIds?.let((v) => HealthcareElementByIdsFilter(ids: v)),
      _byIdentifiers?.let((v) => HealthcareElementByHcPartyIdentifiersFilter(hcPartyId: _dataOwnerId!, identifiers: v.toList())),
      _byTagCodeFilter?.let((v) {
        v.healthcarePartyId = _dataOwnerId!;
        return v;
      }),
      await _forPatients?.let((v) async => HealthcareElementByHcPartyPatientFilter(
          healthcarePartyId: _dataOwnerId!,
          patientSecretForeignKeys: (await Future.wait(v.item2.map((p) => v.item1.decryptEncryptionKeys(
                _dataOwnerId!, (p.systemMetaData?.delegations ?? {}).map((k, v) => MapEntry(k, v.map((d) => d.toDelegationDto()).toSet()))))))
              .toSet()
              .flatten())),
      await _union?.let(
          (v) async => UnionFilter<HealthcareElement>(filters: await Future.wait(v.map((f) async => await f.forDataOwner(f.dataOwnerId ?? _dataOwnerId!).build()).toList()))),
      await _intersection?.let((v) async =>
          IntersectionFilter<HealthcareElement>(filters: await Future.wait(v.map((f) async => await f.forDataOwner(f.dataOwnerId ?? _dataOwnerId!).build()).toList())))
    ].whereType<Filter<HealthcareElement>>().toList();

    if (filters.isEmpty) {
      return HealthcareElementByHcPartyFilter(hcpId: _dataOwnerId!);
    } else if (filters.length == 1) {
      return filters[0];
    } else {
      return IntersectionFilter(filters: filters);
    }
  }
}

class CodingFilter extends FilterBuilder<Coding> {
  Set<String>? _byIds;
  CodingByRegionTypeLabelLanguageFilter? _byRegionTypeLabelLanguageFilter;
  List<CodingFilter>? _union;
  List<CodingFilter>? _intersection;

  CodingFilter byIds(Set<String> byIds) {
    this._byIds = byIds;
    return this;
  }

  CodingFilter byRegionTypeLabelLanguage({String? region = null, String? type = null, String? language = null, String? label = null}) {
    this._byRegionTypeLabelLanguageFilter = CodingByRegionTypeLabelLanguageFilter(region: region, type: type, language: language, label: label);
    return this;
  }

  CodingFilter union(List<CodingFilter> filters) {
    this._union = filters;
    return this;
  }

  CodingFilter intersection(List<CodingFilter> filters) {
    this._intersection = filters;
    return this;
  }

  @override
  Future<Filter<Coding>> build() async {
    List<Filter<Coding>> filters = [
      _byIds?.let((v) => CodingByIdsFilter(ids: v)),
      _byRegionTypeLabelLanguageFilter?.let((v) => v),
      await _union?.let((v) async => UnionFilter<Coding>(filters: await Future.wait(v.map((f) async => await f.build()).toList()))),
      await _intersection?.let((v) async => IntersectionFilter<Coding>(filters: await Future.wait(v.map((f) async => await f.build()).toList())))
    ].whereType<Filter<Coding>>().toList();

    if (filters.isEmpty) {
      return AllCodingsFilter();
    } else if (filters.length == 1) {
      return filters[0];
    } else {
      return IntersectionFilter(filters: filters);
    }
  }
}

class DataSampleFilter extends FilterBuilder<DataSample> {
  String? _dataOwnerId;

  String? get dataOwnerId => this._dataOwnerId;

  Set<String>? _byIds;
  Set<Identifier>? _byIdentifiers;
  DataSampleByHcPartyTagCodeDateFilter? _byTagCodeDateFilter;
  Tuple2<Crypto, List<PotentiallyEncryptedPatient>>? _forPatients;
  List<DataSampleFilter>? _union;
  List<DataSampleFilter>? _intersection;

  DataSampleFilter forDataOwner(String dataOwnerId) {
    this._dataOwnerId = dataOwnerId;
    return this;
  }

  DataSampleFilter byIds(Set<String> byIds) {
    this._byIds = byIds;
    return this;
  }

  DataSampleFilter byIdentifiers(Set<Identifier> identifiers) {
    this._byIdentifiers = identifiers;
    return this;
  }

  DataSampleFilter byTagCodeDateFilter({
    String? tagType = null,
    String? tagCode = null,
    String? codeType = null,
    String? codeCode = null,
    int? startValueDate = null,
    int? endValueDate = null,
  }) {
    this._byTagCodeDateFilter = DataSampleByHcPartyTagCodeDateFilter(
        tagType: tagType, tagCode: tagCode, codeType: codeType, codeCode: codeCode, startValueDate: startValueDate, endValueDate: endValueDate);
    return this;
  }

  DataSampleFilter forPatients(Crypto crypto, List<PotentiallyEncryptedPatient> patients) {
    this._forPatients = Tuple2(crypto, patients);
    return this;
  }

  DataSampleFilter union(List<DataSampleFilter> filters) {
    this._union = filters;
    return this;
  }

  DataSampleFilter intersection(List<DataSampleFilter> filters) {
    this._intersection = filters;
    return this;
  }

  @override
  Future<Filter<DataSample>> build() async {
    if (_dataOwnerId == null) {
      throw FormatException("Data Owner must be set for patient filter.");
    }
    final String dataOwnerId = _dataOwnerId!;

    final filters = [
      _byIds?.let((v) => DataSampleByIdsFilter(ids: v)),
      _byIdentifiers?.let((v) => DataSampleByHcPartyIdentifiersFilter(dataOwnerId: dataOwnerId, identifiers: v.toList())),
      _byTagCodeDateFilter?.let((v) {
        v.healthcarePartyId = dataOwnerId;
        return v;
      }),
      await _forPatients?.let((v) async {
        var localCrypto = v.item1;
        Set<String> secretForeignKeys = (await Future.wait(v.item2.map((p) {
          var delegations = (p.systemMetaData?.delegations ?? {}).toDelegationMapDto();
          return localCrypto.decryptEncryptionKeys(dataOwnerId, delegations);
        })))
            .toSet()
            .flatten();
        return DataSampleBySecretForeignKeys(healthcarePartyId: dataOwnerId, patientSecretForeignKeys: secretForeignKeys);
      }),
      await _union?.let((v) async => UnionFilter<DataSample>(
          filters: await Future.wait(v.map((f) async => await f.forDataOwner(f.dataOwnerId ?? dataOwnerId).build()).toList()))),
      await _intersection?.let((v) async => IntersectionFilter<DataSample>(
          filters: await Future.wait(v.map((f) async => await f.forDataOwner(f.dataOwnerId ?? dataOwnerId).build()).toList())))
    ].whereType<Filter<DataSample>>().toList();

    if (filters.isEmpty) {
      return DataSampleByHcPartyFilter(hcpId: dataOwnerId);
    } else if (filters.length == 1) {
      return filters[0];
    } else {
      return IntersectionFilter(filters: filters);
    }
  }
}
