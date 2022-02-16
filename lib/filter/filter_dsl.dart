// @dart=2.12
part of icure_medical_device_dart_sdk.api;

abstract class FilterBuilder<T> {
  Future<Filter<T>> build();
}

class PatientFilter extends FilterBuilder<Patient> {
  HealthcareProfessional? _forHcp;
  HealthcareProfessional? get hcp => this._forHcp;

  Set<String>? _byIds;
  Set<Identifier>? _byIdentifiers;
  List<String>? _withSsins;
  Tuple2<DateTime?, DateTime?>? _dateOfBirthBetween;
  Tuple3<PatientGenderEnum, String?, String?>? _byGenderEducationProfession;
  String? _containsFuzzy;
  List<PatientFilter>? _union;
  List<PatientFilter>? _intersection;

  PatientFilter forHcp(HealthcareProfessional hcp) {
    this._forHcp = hcp;
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

  PatientFilter byGenderEducationProfession(PatientGenderEnum gender, String? education, String? profession) {
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
    if (_forHcp == null) {
      throw FormatException("Hcp must be set for patient filter.");
    }
    final HealthcareProfessional hp = _forHcp!;

    List<Filter<Patient>> filters = [
      _byIds?.let((v) => PatientByIdsFilter(ids: v.toList())),
      _byIdentifiers?.let((v) => PatientByHcPartyAndIdentifiersFilter(healthcarePartyId: hp.id!, identifiers: v.toList())),
      _withSsins?.let((v) => PatientByHcPartyAndSsinsFilter(healthcarePartyId: hp.id!, ssins: v.toList())),
      _dateOfBirthBetween?.let((v) => PatientByHcPartyDateOfBirthBetweenFilter(healthcarePartyId: hp.id!, minDateOfBirth: v.item1?.toFuzzy(), maxDateOfBirth: v.item2?.toFuzzy())),
      _byGenderEducationProfession?.let((v) => PatientByHcPartyGenderEducationProfessionFilter(healthcarePartyId: hp.id!, gender: v.item1, education: v.item2, profession: v.item3)),
      _containsFuzzy?.let((v) => PatientByHcPartyNameContainsFuzzyFilter(healthcarePartyId: hp.id!, searchString: v)),
      await _union?.let((v) async => UnionFilter<Patient>(filters:await Future.wait(v.map((f) async => await f.forHcp(f.hcp ?? hp).build()).toList()))),
      await _intersection?.let((v) async => IntersectionFilter<Patient>(filters:await Future.wait(v.map((f) async => await f.forHcp(f.hcp ?? hp).build()).toList())))
    ].whereType<Filter<Patient>>().toList();

    if (filters.isEmpty) {
      return PatientByHcPartyFilter(healthcarePartyId: hp.id!);
    } else if (filters.length == 1) {
      return filters[0];
    } else {
      return IntersectionFilter(filters: filters);
    }
  }
}

class DataSampleFilter extends FilterBuilder<DataSample> {
  HealthcareProfessional? _forHcp;
  HealthcareProfessional? get hcp => this._forHcp;

  Set<String>? _byIds;
  Set<Identifier>? _byIdentifiers;
  DataSampleByHcPartyTagCodeDateFilter? _byTagCodeDateFilter;
  Tuple2<Crypto, List<Patient>>? _forPatients;
  List<DataSampleFilter>? _union;
  List<DataSampleFilter>? _intersection;

  DataSampleFilter forHcp(HealthcareProfessional hcp) {
    this._forHcp = hcp;
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

  DataSampleFilter byTagCodeDateFilter(
  String? tagType,
  String? tagCode,
  String? codeType,
  String? codeCode,
  int? startValueDate,
  int? endValueDate,
  ) {
    this._byTagCodeDateFilter = DataSampleByHcPartyTagCodeDateFilter(tagType: tagType, tagCode: tagCode, codeType: codeType, codeCode: codeCode, startValueDate: startValueDate, endValueDate: endValueDate);
    return this;
  }

  DataSampleFilter forPatients(Crypto crypto, List<Patient> patients) {
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
    if (_forHcp == null) {
      throw FormatException("Hcp must be set for patient filter.");
    }
    final HealthcareProfessional hp = _forHcp!;

    List<Filter<DataSample>> filters = [
      _byIds?.let((v) => DataSampleByIdsFilter(ids: v)),
      _byIdentifiers?.let((v) => DataSampleByHcPartyIdentifiersFilter(healthcarePartyId: hp.id!, identifiers: v.toList())),
      _byTagCodeDateFilter?.let((v) => v.healthcarePartyId = hp.id!),
      await _forPatients?.let((v) async => DataSampleBySecretForeignKeys(healthcarePartyId: hp.id!, patientSecretForeignKeys: (await Future.wait(v.item2.map((p) => v.item1.decryptEncryptionKeys(hp.id!, (p.systemMetaData?.delegations ?? {}).map((k,v) => MapEntry(k, v.map((d)=> d.toDelegationDto()).toSet())))))).toSet().flatten())),
      await _union?.let((v) async => UnionFilter<DataSample>(filters:await Future.wait(v.map((f) async => await f.forHcp(f.hcp ?? hp).build()).toList()))),
      await _intersection?.let((v) async => IntersectionFilter<DataSample>(filters:await Future.wait(v.map((f) async => await f.forHcp(f.hcp ?? hp).build()).toList())))
    ].whereType<Filter<DataSample>>().toList();

    if (filters.isEmpty) {
      return DataSampleByHcPartyFilter(hcpId: hp.id!);
    } else if (filters.length == 1) {
      return filters[0];
    } else {
      return IntersectionFilter(filters: filters);
    }
  }
}
