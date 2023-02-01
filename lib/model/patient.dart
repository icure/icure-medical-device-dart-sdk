//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of icure_medical_device_dart_sdk.api;

class Patient implements PotentiallyEncryptedPatient {

  /// Returns a new [Patient] instance.
  Patient({
    this.id,
    this.rev,
    this.identifiers = const [],
    this.created,
    this.modified,
    this.author,
    this.responsible,
    this.labels = const {},
    this.codes = const {},
    this.endOfLife,
    this.deletionDate,
    this.firstName,
    this.lastName,
    this.names = const [],
    this.companyName,
    this.languages = const [],
    this.addresses = const [],
    this.civility,
    this.gender,
    this.birthSex,
    this.mergeToPatientId,
    this.mergedIds = const {},
    this.alias,
    this.active = true,
    this.deactivationReason = const PatientDeactivationReasonEnum._('DeactivationReason.none'),
    this.ssin,
    this.maidenName,
    this.spouseName,
    this.partnerName,
    this.personalStatus,
    this.dateOfBirth,
    this.dateOfDeath,
    this.placeOfBirth,
    this.placeOfDeath,
    this.deceased,
    this.education,
    this.profession,
    this.note,
    this.administrativeNote,
    this.nationality,
    this.race,
    this.ethnicity,
    this.picture,
    this.externalId,
    this.partnerships = const [],
    this.patientHealthCareParties = const [],
    this.patientProfessions = const [],
    this.parameters = const {},
    this.properties = const {},
    this.systemMetaData,
  });

  /// Returns a new [Patient] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static Patient? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "Patient[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "Patient[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return Patient(
        id: mapValueOfType<String>(json, r'id'),
        rev: mapValueOfType<String>(json, r'rev'),
        identifiers: Identifier.listFromJson(json[r'identifiers'])!,
        created: mapValueOfType<int>(json, r'created'),
        modified: mapValueOfType<int>(json, r'modified'),
        author: mapValueOfType<String>(json, r'author'),
        responsible: mapValueOfType<String>(json, r'responsible'),
        labels: CodingReference.listFromJson(json[r'labels'])!.toSet(),
        codes: CodingReference.listFromJson(json[r'codes'])!.toSet(),
        endOfLife: mapValueOfType<int>(json, r'endOfLife'),
        deletionDate: mapValueOfType<int>(json, r'deletionDate'),
        firstName: mapValueOfType<String>(json, r'firstName'),
        lastName: mapValueOfType<String>(json, r'lastName'),
        names: PersonName.listFromJson(json[r'names'])!,
        companyName: mapValueOfType<String>(json, r'companyName'),
        languages: json[r'languages'] is List ? (json[r'languages'] as List).cast<String>() : const [],
        addresses: Address.listFromJson(json[r'addresses'])!,
        civility: mapValueOfType<String>(json, r'civility'),
        gender: PatientGenderEnum.fromJson(json[r'gender']),
        birthSex: PatientBirthSexEnum.fromJson(json[r'birthSex']),
        mergeToPatientId: mapValueOfType<String>(json, r'mergeToPatientId'),
        mergedIds: json[r'mergedIds'] is Set
            ? (json[r'mergedIds'] as Set).cast<String>()
            : json[r'mergedIds'] is List
            ? ((json[r'mergedIds'] as List).toSet()).cast<String>()
            : const {},
        alias: mapValueOfType<String>(json, r'alias'),
        active: mapValueOfType<bool>(json, r'active')!,
        deactivationReason: PatientDeactivationReasonEnum.fromJson(json[r'deactivationReason'])!,
        ssin: mapValueOfType<String>(json, r'ssin'),
        maidenName: mapValueOfType<String>(json, r'maidenName'),
        spouseName: mapValueOfType<String>(json, r'spouseName'),
        partnerName: mapValueOfType<String>(json, r'partnerName'),
        personalStatus: PatientPersonalStatusEnum.fromJson(json[r'personalStatus']),
        dateOfBirth: mapValueOfType<int>(json, r'dateOfBirth'),
        dateOfDeath: mapValueOfType<int>(json, r'dateOfDeath'),
        placeOfBirth: mapValueOfType<String>(json, r'placeOfBirth'),
        placeOfDeath: mapValueOfType<String>(json, r'placeOfDeath'),
        deceased: mapValueOfType<bool>(json, r'deceased'),
        education: mapValueOfType<String>(json, r'education'),
        profession: mapValueOfType<String>(json, r'profession'),
        note: mapValueOfType<String>(json, r'note'),
        administrativeNote: mapValueOfType<String>(json, r'administrativeNote'),
        nationality: mapValueOfType<String>(json, r'nationality'),
        race: mapValueOfType<String>(json, r'race'),
        ethnicity: mapValueOfType<String>(json, r'ethnicity'),
        picture: mapValueOfType<String>(json, r'picture'),
        externalId: mapValueOfType<String>(json, r'externalId'),
        partnerships: Partnership.listFromJson(json[r'partnerships'])!,
        patientHealthCareParties: PatientHealthCareParty.listFromJson(json[r'patientHealthCareParties'])!,
        patientProfessions: CodingReference.listFromJson(json[r'patientProfessions'])!,
        parameters: json[r'parameters'] == null ? const {} : mapWithListOfStringsFromJson(json[r'parameters']),
        properties: Property.listFromJson(json[r'properties'])!.toSet(),
        systemMetaData: SystemMetaDataOwnerEncrypted.fromJson(json[r'systemMetaData']),
      );
    }
    return null;
  }

  static List<Patient>? listFromJson(
      dynamic json, {
        bool growable = false,
      }) {
    final result = <Patient>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = Patient.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, Patient> mapFromJson(dynamic json) {
    final map = <String, Patient>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = Patient.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of Patient-objects as value to a dart map
  static Map<String, List<Patient>> mapListFromJson(
      dynamic json, {
        bool growable = false,
      }) {
    final map = <String, List<Patient>>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = Patient.listFromJson(
          entry.value,
          growable: growable,
        );
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'identifiers',
    'labels',
    'codes',
    'names',
    'languages',
    'addresses',
    'mergedIds',
    'active',
    'deactivationReason',
    'partnerships',
    'patientHealthCareParties',
    'patientProfessions',
    'parameters',
    'properties',
  };

  @override
  SystemMetaDataOwnerEncrypted? systemMetaData;

  @override
  bool active;

  @override
  List<Address> addresses;

  @override
  String? administrativeNote;

  @override
  String? alias;

  @override
  String? author;

  @override
  PatientBirthSexEnum? birthSex;

  @override
  String? civility;

  @override
  Set<CodingReference> codes;

  @override
  String? companyName;

  @override
  int? created;

  @override
  int? dateOfBirth;

  @override
  int? dateOfDeath;

  @override
  PatientDeactivationReasonEnum deactivationReason;

  @override
  bool? deceased;

  @override
  int? deletionDate;

  @override
  String? education;

  @override
  int? endOfLife;

  @override
  String? ethnicity;

  @override
  String? externalId;

  @override
  String? firstName;

  @override
  PatientGenderEnum? gender;

  @override
  String? id;

  @override
  List<Identifier> identifiers;

  @override
  Set<CodingReference> labels;

  @override
  List<String> languages;

  @override
  String? lastName;

  @override
  String? maidenName;

  @override
  String? mergeToPatientId;

  @override
  Set<String> mergedIds;

  @override
  int? modified;

  @override
  List<PersonName> names;

  @override
  String? nationality;

  @override
  String? note;

  @override
  Map<String, List<String>> parameters;

  @override
  String? partnerName;

  @override
  List<Partnership> partnerships;

  @override
  List<PatientHealthCareParty> patientHealthCareParties;

  @override
  List<CodingReference> patientProfessions;

  @override
  PatientPersonalStatusEnum? personalStatus;

  @override
  String? picture;

  @override
  String? placeOfBirth;

  @override
  String? placeOfDeath;

  @override
  String? profession;

  @override
  Set<Property> properties;

  @override
  String? race;

  @override
  String? responsible;

  @override
  String? rev;

  @override
  String? spouseName;

  @override
  String? ssin;

  @override
  bool operator ==(Object other) =>
      identical(this, other) || (other is Patient && __potentiallyEncryptedPatientEquality(this, other));

  @override
  int get hashCode => __potentiallyEncryptedPatientHashCode(this);

  @override
  String toString() => 'Patient[${__potentiallyEncryptedPatientFieldsString(this)}]';

  Map<String, dynamic> toJson() => __potentiallyEncryptedPatientToJson(this);
}

class EncryptedPatient implements PotentiallyEncryptedPatient {

  /// Returns a new [EncryptedPatient] instance.
  EncryptedPatient({
    this.id,
    this.rev,
    this.identifiers = const [],
    this.created,
    this.modified,
    this.author,
    this.responsible,
    this.labels = const {},
    this.codes = const {},
    this.endOfLife,
    this.deletionDate,
    this.firstName,
    this.lastName,
    this.names = const [],
    this.companyName,
    this.languages = const [],
    this.addresses = const [],
    this.civility,
    this.gender,
    this.birthSex,
    this.mergeToPatientId,
    this.mergedIds = const {},
    this.alias,
    this.active = true,
    this.deactivationReason = const PatientDeactivationReasonEnum._('DeactivationReason.none'),
    this.ssin,
    this.maidenName,
    this.spouseName,
    this.partnerName,
    this.personalStatus,
    this.dateOfBirth,
    this.dateOfDeath,
    this.placeOfBirth,
    this.placeOfDeath,
    this.deceased,
    this.education,
    this.profession,
    this.note,
    this.administrativeNote,
    this.nationality,
    this.race,
    this.ethnicity,
    this.picture,
    this.externalId,
    this.partnerships = const [],
    this.patientHealthCareParties = const [],
    this.patientProfessions = const [],
    this.parameters = const {},
    this.properties = const {},
    this.systemMetaData,
  });

  @override
  SystemMetaDataOwnerEncrypted? systemMetaData;

  @override
  bool active;

  @override
  List<Address> addresses;

  @override
  String? administrativeNote;

  @override
  String? alias;

  @override
  String? author;

  @override
  PatientBirthSexEnum? birthSex;

  @override
  String? civility;

  @override
  Set<CodingReference> codes;

  @override
  String? companyName;

  @override
  int? created;

  @override
  int? dateOfBirth;

  @override
  int? dateOfDeath;

  @override
  PatientDeactivationReasonEnum deactivationReason;

  @override
  bool? deceased;

  @override
  int? deletionDate;

  @override
  String? education;

  @override
  int? endOfLife;

  @override
  String? ethnicity;

  @override
  String? externalId;

  @override
  String? firstName;

  @override
  PatientGenderEnum? gender;

  @override
  String? id;

  @override
  List<Identifier> identifiers;

  @override
  Set<CodingReference> labels;

  @override
  List<String> languages;

  @override
  String? lastName;

  @override
  String? maidenName;

  @override
  String? mergeToPatientId;

  @override
  Set<String> mergedIds;

  @override
  int? modified;

  @override
  List<PersonName> names;

  @override
  String? nationality;

  @override
  String? note;

  @override
  Map<String, List<String>> parameters;

  @override
  String? partnerName;

  @override
  List<Partnership> partnerships;

  @override
  List<PatientHealthCareParty> patientHealthCareParties;

  @override
  List<CodingReference> patientProfessions;

  @override
  PatientPersonalStatusEnum? personalStatus;

  @override
  String? picture;

  @override
  String? placeOfBirth;

  @override
  String? placeOfDeath;

  @override
  String? profession;

  @override
  Set<Property> properties;

  @override
  String? race;

  @override
  String? responsible;

  @override
  String? rev;

  @override
  String? spouseName;

  @override
  String? ssin;

  @override
  bool operator ==(Object other) =>
      identical(this, other) || (other is EncryptedPatient && __potentiallyEncryptedPatientEquality(this, other));

  @override
  int get hashCode => __potentiallyEncryptedPatientHashCode(this);

  @override
  String toString() => 'EncryptedPatient[${__potentiallyEncryptedPatientFieldsString(this)}]';

  Map<String, dynamic> toJson() => __potentiallyEncryptedPatientToJson(this);
}

abstract class PotentiallyEncryptedPatient {
  /// the Id of the patient. We encourage using either a v4 UUID or a HL7 Id.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? get id;
  set id(String? value);

  /// the revision of the patient in the database, used for conflict management / optimistic locking.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? get rev;
  set rev(String? value);

  /// Typically used for business / client identifiers. An identifier should identify a patient uniquely and unambiguously. However, iCure can't guarantee the uniqueness of those identifiers : This is something you need to take care of.
  List<Identifier> get identifiers;
  set identifiers(List<Identifier> value);

  /// the creation date of the patient (encoded as epoch).
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? get created;
  set created(int? value);

  /// the last modification date of the patient (encoded as epoch).
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? get modified;
  set modified(int? value);

  /// The id of the [User] that created this patient. When creating the patient, this field will be filled automatically by the current user id if not provided.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? get author;
  set author(String? value);

  /// The id of the data owner that is responsible of this patient. When creating the patient, will be filled automatically by the current user data owner id ([HealthcareProfessional], [Patient] or [MedicalDevice]) if missing
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? get responsible;
  set responsible(String? value);

  /// A label is an item from a codification system that qualifies a patient as being member of a certain class, whatever the value it might have taken. If the label qualifies the content of a field, it means that whatever the content of the field, the label will always apply. LOINC is a codification system typically used for labels.
  Set<CodingReference> get labels;
  set labels(Set<CodingReference> value);

  /// A code is an item from a codification system that qualifies the content of this patient.
  Set<CodingReference> get codes;
  set codes(Set<CodingReference> value);

  /// Soft delete (unix epoch in ms) timestamp of the patient
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? get endOfLife;
  set endOfLife(int? value);

  /// the soft delete timestamp. When a patient is ”deleted“, this is set to a non null value: the moment of the deletion
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? get deletionDate;
  set deletionDate(int? value);

  /// the firstname (name) of the patient.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? get firstName;
  set firstName(String? value);

  /// the lastname (surname) of the patient. This is the official lastname that should be used for official administrative purposes.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? get lastName;
  set lastName(String? value);

  /// the list of all names of the patient, also containing the official full name information. Ordered by preference of use. First element is therefore the official name used for the patient in the application
  List<PersonName> get names;
  set names(List<PersonName> value);

  /// the name of the company this patient is member of.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? get companyName;
  set companyName(String? value);

  /// the list of languages spoken by the patient ordered by fluency (alpha-2 code http://www.loc.gov/standards/iso639-2/ascii_8bits.html).
  List<String> get languages;
  set languages(List<String> value);

  /// the list of addresses (with address type).
  List<Address> get addresses;
  set addresses(List<Address> value);

  /// Mr., Ms., Pr., Dr. ...
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? get civility;
  set civility(String? value);

  /// the gender of the patient: male, female, indeterminate, changed, changedToMale, changedToFemale, unknown
  PatientGenderEnum? get gender;
  set gender(PatientGenderEnum? value);

  /// the birth sex of the patient: male, female, indeterminate, unknown
  PatientBirthSexEnum? get birthSex;
  set birthSex(PatientBirthSexEnum? value);

  /// The id of the patient this patient has been merged with.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? get mergeToPatientId;
  set mergeToPatientId(String? value);

  /// The ids of the patients that have been merged inside this patient.
  Set<String> get mergedIds;
  set mergedIds(Set<String> value);

  /// An alias of the person, nickname, ...
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? get alias;
  set alias(String? value);

  /// Is the patient active (boolean).
  bool get active;
  set active(bool value);

  /// When not active, the reason for deactivation.
  PatientDeactivationReasonEnum get deactivationReason;
  set deactivationReason(PatientDeactivationReasonEnum value);

  /// Social security inscription number.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? get ssin;
  set ssin(String? value);

  /// Lastname at birth (can be different of the current name), depending on the country, must be used to design the patient .
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? get maidenName;
  set maidenName(String? value);

  /// Lastname of the spouse for a married woman, depending on the country, can be used to design the patient.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? get spouseName;
  set spouseName(String? value);

  /// Lastname of the partner, should not be used to design the patient.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? get partnerName;
  set partnerName(String? value);

  /// any of `single`, `in_couple`, `married`, `separated`, `divorced`, `divorcing`, `widowed`, `widower`, `complicated`, `unknown`, `contract`, `other`.
  PatientPersonalStatusEnum? get personalStatus;
  set personalStatus(PatientPersonalStatusEnum? value);

  /// The birthdate encoded as a fuzzy date on 8 positions (YYYYMMDD) MM and/or DD can be set to 00 if unknown (19740000 is a valid date).
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? get dateOfBirth;
  set dateOfBirth(int? value);

  /// The date of death encoded as a fuzzy date on 8 positions (YYYYMMDD) MM and/or DD can be set to 00 if unknown (19740000 is a valid date).
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? get dateOfDeath;
  set dateOfDeath(int? value);

  /// The place of birth.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? get placeOfBirth;
  set placeOfBirth(String? value);

  /// The place of death.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? get placeOfDeath;
  set placeOfDeath(String? value);

  /// Is the patient deceased.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  bool? get deceased;
  set deceased(bool? value);

  /// The level of education (college degree, undergraduate, phd).
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? get education;
  set education(String? value);

  /// The current professional activity.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? get profession;
  set profession(String? value);

  /// A text note (can be confidential, encrypted by default).
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? get note;
  set note(String? value);

  /// An administrative note, not confidential.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? get administrativeNote;
  set administrativeNote(String? value);

  /// The nationality of the patient.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? get nationality;
  set nationality(String? value);

  /// The race of the patient.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? get race;
  set race(String? value);

  /// The ethnicity of the patient.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? get ethnicity;
  set ethnicity(String? value);

  /// A picture usually saved in JPEG format.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? get picture;
  set picture(String? value);

  /// An external (from another source) id with no guarantee or requirement for unicity .
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? get externalId;
  set externalId(String? value);

  /// List of partners, or persons of contact (of class Partnership, see below).
  List<Partnership> get partnerships;
  set partnerships(List<Partnership> value);

  /// Links (usually for therapeutic reasons) between this patient and healthcare parties (of class PatientHealthcareParty).
  List<PatientHealthCareParty> get patientHealthCareParties;
  set patientHealthCareParties(List<PatientHealthCareParty> value);

  /// Codified list of professions exercised by this patient.
  List<CodingReference> get patientProfessions;
  set patientProfessions(List<CodingReference> value);

  /// Extra parameters
  Map<String, List<String>> get parameters;

  /// Extra properties
  Set<Property> get properties;
  set properties(Set<Property> value);

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  SystemMetaDataOwnerEncrypted? get systemMetaData;
  set systemMetaData(SystemMetaDataOwnerEncrypted? value);
}

bool __potentiallyEncryptedPatientEquality(PotentiallyEncryptedPatient self, PotentiallyEncryptedPatient other) =>
  other.id == self.id &&
    other.rev == self.rev &&
    ListEquality().equals(other.identifiers, self.identifiers) &&
    other.created == self.created &&
    other.modified == self.modified &&
    other.author == self.author &&
    other.responsible == self.responsible &&
    SetEquality().equals(other.labels, self.labels) &&
    SetEquality().equals(other.codes, self.codes) &&
    other.endOfLife == self.endOfLife &&
    other.deletionDate == self.deletionDate &&
    other.firstName == self.firstName &&
    other.lastName == self.lastName &&
    ListEquality().equals(other.names, self.names) &&
    other.companyName == self.companyName &&
    ListEquality().equals(other.languages, self.languages) &&
    ListEquality().equals(other.addresses, self.addresses) &&
    other.civility == self.civility &&
    other.gender == self.gender &&
    other.birthSex == self.birthSex &&
    other.mergeToPatientId == self.mergeToPatientId &&
    SetEquality().equals(other.mergedIds, self.mergedIds) &&
    other.alias == self.alias &&
    other.active == self.active &&
    other.deactivationReason == self.deactivationReason &&
    other.ssin == self.ssin &&
    other.maidenName == self.maidenName &&
    other.spouseName == self.spouseName &&
    other.partnerName == self.partnerName &&
    other.personalStatus == self.personalStatus &&
    other.dateOfBirth == self.dateOfBirth &&
    other.dateOfDeath == self.dateOfDeath &&
    other.placeOfBirth == self.placeOfBirth &&
    other.placeOfDeath == self.placeOfDeath &&
    other.deceased == self.deceased &&
    other.education == self.education &&
    other.profession == self.profession &&
    other.note == self.note &&
    other.administrativeNote == self.administrativeNote &&
    other.nationality == self.nationality &&
    other.race == self.race &&
    other.ethnicity == self.ethnicity &&
    other.picture == self.picture &&
    other.externalId == self.externalId &&
    ListEquality().equals(other.partnerships, self.partnerships) &&
    ListEquality().equals(other.patientHealthCareParties, self.patientHealthCareParties) &&
    ListEquality().equals(other.patientProfessions, self.patientProfessions) &&
    MapEquality(values: ListEquality()).equals(other.parameters, self.parameters) &&
    SetEquality().equals(other.properties, self.properties) &&
    other.systemMetaData == self.systemMetaData;

int __potentiallyEncryptedPatientHashCode(PotentiallyEncryptedPatient self) =>
  // ignore: unnecessary_parenthesis
  (self.id == null ? 0 : self.id!.hashCode) +
  (self.rev == null ? 0 : self.rev!.hashCode) +
  (self.identifiers.hashCode) +
  (self.created == null ? 0 : self.created!.hashCode) +
  (self.modified == null ? 0 : self.modified!.hashCode) +
  (self.author == null ? 0 : self.author!.hashCode) +
  (self.responsible == null ? 0 : self.responsible!.hashCode) +
  (self.labels.hashCode) +
  (self.codes.hashCode) +
  (self.endOfLife == null ? 0 : self.endOfLife!.hashCode) +
  (self.deletionDate == null ? 0 : self.deletionDate!.hashCode) +
  (self.firstName == null ? 0 : self.firstName!.hashCode) +
  (self.lastName == null ? 0 : self.lastName!.hashCode) +
  (self.names.hashCode) +
  (self.companyName == null ? 0 : self.companyName!.hashCode) +
  (self.languages.hashCode) +
  (self.addresses.hashCode) +
  (self.civility == null ? 0 : self.civility!.hashCode) +
  (self.gender == null ? 0 : self.gender!.hashCode) +
  (self.birthSex == null ? 0 : self.birthSex!.hashCode) +
  (self.mergeToPatientId == null ? 0 : self.mergeToPatientId!.hashCode) +
  (self.mergedIds.hashCode) +
  (self.alias == null ? 0 : self.alias!.hashCode) +
  (self.active.hashCode) +
  (self.deactivationReason.hashCode) +
  (self.ssin == null ? 0 : self.ssin!.hashCode) +
  (self.maidenName == null ? 0 : self.maidenName!.hashCode) +
  (self.spouseName == null ? 0 : self.spouseName!.hashCode) +
  (self.partnerName == null ? 0 : self.partnerName!.hashCode) +
  (self.personalStatus == null ? 0 : self.personalStatus!.hashCode) +
  (self.dateOfBirth == null ? 0 : self.dateOfBirth!.hashCode) +
  (self.dateOfDeath == null ? 0 : self.dateOfDeath!.hashCode) +
  (self.placeOfBirth == null ? 0 : self.placeOfBirth!.hashCode) +
  (self.placeOfDeath == null ? 0 : self.placeOfDeath!.hashCode) +
  (self.deceased == null ? 0 : self.deceased!.hashCode) +
  (self.education == null ? 0 : self.education!.hashCode) +
  (self.profession == null ? 0 : self.profession!.hashCode) +
  (self.note == null ? 0 : self.note!.hashCode) +
  (self.administrativeNote == null ? 0 : self.administrativeNote!.hashCode) +
  (self.nationality == null ? 0 : self.nationality!.hashCode) +
  (self.race == null ? 0 : self.race!.hashCode) +
  (self.ethnicity == null ? 0 : self.ethnicity!.hashCode) +
  (self.picture == null ? 0 : self.picture!.hashCode) +
  (self.externalId == null ? 0 : self.externalId!.hashCode) +
  (self.partnerships.hashCode) +
  (self.patientHealthCareParties.hashCode) +
  (self.patientProfessions.hashCode) +
  (self.parameters.hashCode) +
  (self.properties.hashCode) +
  (self.systemMetaData == null ? 0 : self.systemMetaData!.hashCode);

String __potentiallyEncryptedPatientFieldsString(PotentiallyEncryptedPatient self) =>
  'id=${self.id}, rev=${self.rev}, identifiers=${self.identifiers}, created=${self.created}, modified=${self.modified}, author=${self.author}, responsible=${self.responsible}, labels=${self.labels}, codes=${self.codes}, endOfLife=${self.endOfLife}, deletionDate=${self.deletionDate}, firstName=${self.firstName}, lastName=${self.lastName}, names=${self.names}, companyName=${self.companyName}, languages=${self.languages}, addresses=${self.addresses}, civility=${self.civility}, gender=${self.gender}, birthSex=${self.birthSex}, mergeToPatientId=${self.mergeToPatientId}, mergedIds=${self.mergedIds}, alias=${self.alias}, active=${self.active}, deactivationReason=${self.deactivationReason}, ssin=${self.ssin}, maidenName=${self.maidenName}, spouseName=${self.spouseName}, partnerName=${self.partnerName}, personalStatus=${self.personalStatus}, dateOfBirth=${self.dateOfBirth}, dateOfDeath=${self.dateOfDeath}, placeOfBirth=${self.placeOfBirth}, placeOfDeath=${self.placeOfDeath}, deceased=${self.deceased}, education=${self.education}, profession=${self.profession}, note=${self.note}, administrativeNote=${self.administrativeNote}, nationality=${self.nationality}, race=${self.race}, ethnicity=${self.ethnicity}, picture=${self.picture}, externalId=${self.externalId}, partnerships=${self.partnerships}, patientHealthCareParties=${self.patientHealthCareParties}, patientProfessions=${self.patientProfessions}, parameters=${self.parameters}, properties=${self.properties}, systemMetaData=${self.systemMetaData}';

Map<String, dynamic> __potentiallyEncryptedPatientToJson(PotentiallyEncryptedPatient self) {
    final json = <String, dynamic>{};
    if (self.id != null) {
      json[r'id'] = self.id;
    }
    if (self.rev != null) {
      json[r'rev'] = self.rev;
    }
    json[r'identifiers'] = self.identifiers;
    if (self.created != null) {
      json[r'created'] = self.created;
    }
    if (self.modified != null) {
      json[r'modified'] = self.modified;
    }
    if (self.author != null) {
      json[r'author'] = self.author;
    }
    if (self.responsible != null) {
      json[r'responsible'] = self.responsible;
    }
    json[r'labels'] = self.labels.toList();
    json[r'codes'] = self.codes.toList();
    if (self.endOfLife != null) {
      json[r'endOfLife'] = self.endOfLife;
    }
    if (self.deletionDate != null) {
      json[r'deletionDate'] = self.deletionDate;
    }
    if (self.firstName != null) {
      json[r'firstName'] = self.firstName;
    }
    if (self.lastName != null) {
      json[r'lastName'] = self.lastName;
    }
    json[r'names'] = self.names;
    if (self.companyName != null) {
      json[r'companyName'] = self.companyName;
    }
    json[r'languages'] = self.languages;
    json[r'addresses'] = self.addresses;
    if (self.civility != null) {
      json[r'civility'] = self.civility;
    }
    if (self.gender != null) {
      json[r'gender'] = self.gender;
    }
    if (self.birthSex != null) {
      json[r'birthSex'] = self.birthSex;
    }
    if (self.mergeToPatientId != null) {
      json[r'mergeToPatientId'] = self.mergeToPatientId;
    }
    json[r'mergedIds'] = self.mergedIds.toList();
    if (self.alias != null) {
      json[r'alias'] = self.alias;
    }
    json[r'active'] = self.active;
    json[r'deactivationReason'] = self.deactivationReason;
    if (self.ssin != null) {
      json[r'ssin'] = self.ssin;
    }
    if (self.maidenName != null) {
      json[r'maidenName'] = self.maidenName;
    }
    if (self.spouseName != null) {
      json[r'spouseName'] = self.spouseName;
    }
    if (self.partnerName != null) {
      json[r'partnerName'] = self.partnerName;
    }
    if (self.personalStatus != null) {
      json[r'personalStatus'] = self.personalStatus;
    }
    if (self.dateOfBirth != null) {
      json[r'dateOfBirth'] = self.dateOfBirth;
    }
    if (self.dateOfDeath != null) {
      json[r'dateOfDeath'] = self.dateOfDeath;
    }
    if (self.placeOfBirth != null) {
      json[r'placeOfBirth'] = self.placeOfBirth;
    }
    if (self.placeOfDeath != null) {
      json[r'placeOfDeath'] = self.placeOfDeath;
    }
    if (self.deceased != null) {
      json[r'deceased'] = self.deceased;
    }
    if (self.education != null) {
      json[r'education'] = self.education;
    }
    if (self.profession != null) {
      json[r'profession'] = self.profession;
    }
    if (self.note != null) {
      json[r'note'] = self.note;
    }
    if (self.administrativeNote != null) {
      json[r'administrativeNote'] = self.administrativeNote;
    }
    if (self.nationality != null) {
      json[r'nationality'] = self.nationality;
    }
    if (self.race != null) {
      json[r'race'] = self.race;
    }
    if (self.ethnicity != null) {
      json[r'ethnicity'] = self.ethnicity;
    }
    if (self.picture != null) {
      json[r'picture'] = self.picture;
    }
    if (self.externalId != null) {
      json[r'externalId'] = self.externalId;
    }
    json[r'partnerships'] = self.partnerships;
    json[r'patientHealthCareParties'] = self.patientHealthCareParties;
    json[r'patientProfessions'] = self.patientProfessions;
    json[r'parameters'] = self.parameters;
    json[r'properties'] = self.properties.toList();
    if (self.systemMetaData != null) {
      json[r'systemMetaData'] = self.systemMetaData;
    }
    return json;
  }

/// the gender of the patient: male, female, indeterminate, changed, changedToMale, changedToFemale, unknown
class PatientGenderEnum {
  /// Instantiate a new enum with the provided [value].
  const PatientGenderEnum._(this.value);

  /// The underlying value of this enum member.
  final String value;

  @override
  String toString() => value;

  String toJson() => value;

  static const male = PatientGenderEnum._(r'male');
  static const female = PatientGenderEnum._(r'female');
  static const indeterminate = PatientGenderEnum._(r'indeterminate');
  static const changed = PatientGenderEnum._(r'changed');
  static const changedToMale = PatientGenderEnum._(r'changedToMale');
  static const changedToFemale = PatientGenderEnum._(r'changedToFemale');
  static const unknown = PatientGenderEnum._(r'unknown');

  /// List of all possible values in this [enum][PatientGenderEnum].
  static const values = <PatientGenderEnum>[
    male,
    female,
    indeterminate,
    changed,
    changedToMale,
    changedToFemale,
    unknown,
  ];

  static PatientGenderEnum? fromJson(dynamic value) => PatientGenderEnumTypeTransformer().decode(value);

  static List<PatientGenderEnum>? listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <PatientGenderEnum>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = PatientGenderEnum.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }
}

/// Transformation class that can [encode] an instance of [PatientGenderEnum] to String,
/// and [decode] dynamic data back to [PatientGenderEnum].
class PatientGenderEnumTypeTransformer {
  factory PatientGenderEnumTypeTransformer() => _instance ??= const PatientGenderEnumTypeTransformer._();

  const PatientGenderEnumTypeTransformer._();

  String encode(PatientGenderEnum data) => data.value;

  /// Decodes a [dynamic value][data] to a PatientGenderEnum.
  ///
  /// If [allowNull] is true and the [dynamic value][data] cannot be decoded successfully,
  /// then null is returned. However, if [allowNull] is false and the [dynamic value][data]
  /// cannot be decoded successfully, then an [UnimplementedError] is thrown.
  ///
  /// The [allowNull] is very handy when an API changes and a new enum value is added or removed,
  /// and users are still using an old app with the old code.
  PatientGenderEnum? decode(dynamic data, {bool allowNull = true}) {
    if (data != null) {
      switch (data.toString()) {
        case r'male':
          return PatientGenderEnum.male;
        case r'female':
          return PatientGenderEnum.female;
        case r'indeterminate':
          return PatientGenderEnum.indeterminate;
        case r'changed':
          return PatientGenderEnum.changed;
        case r'changedToMale':
          return PatientGenderEnum.changedToMale;
        case r'changedToFemale':
          return PatientGenderEnum.changedToFemale;
        case r'unknown':
          return PatientGenderEnum.unknown;
        default:
          if (!allowNull) {
            throw ArgumentError('Unknown enum value to decode: $data');
          }
      }
    }
    return null;
  }

  /// Singleton [PatientGenderEnumTypeTransformer] instance.
  static PatientGenderEnumTypeTransformer? _instance;
}

/// the birth sex of the patient: male, female, indeterminate, unknown
class PatientBirthSexEnum {
  /// Instantiate a new enum with the provided [value].
  const PatientBirthSexEnum._(this.value);

  /// The underlying value of this enum member.
  final String value;

  @override
  String toString() => value;

  String toJson() => value;

  static const male = PatientBirthSexEnum._(r'male');
  static const female = PatientBirthSexEnum._(r'female');
  static const indeterminate = PatientBirthSexEnum._(r'indeterminate');
  static const changed = PatientBirthSexEnum._(r'changed');
  static const changedToMale = PatientBirthSexEnum._(r'changedToMale');
  static const changedToFemale = PatientBirthSexEnum._(r'changedToFemale');
  static const unknown = PatientBirthSexEnum._(r'unknown');

  /// List of all possible values in this [enum][PatientBirthSexEnum].
  static const values = <PatientBirthSexEnum>[
    male,
    female,
    indeterminate,
    changed,
    changedToMale,
    changedToFemale,
    unknown,
  ];

  static PatientBirthSexEnum? fromJson(dynamic value) => PatientBirthSexEnumTypeTransformer().decode(value);

  static List<PatientBirthSexEnum>? listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <PatientBirthSexEnum>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = PatientBirthSexEnum.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }
}

/// Transformation class that can [encode] an instance of [PatientBirthSexEnum] to String,
/// and [decode] dynamic data back to [PatientBirthSexEnum].
class PatientBirthSexEnumTypeTransformer {
  factory PatientBirthSexEnumTypeTransformer() => _instance ??= const PatientBirthSexEnumTypeTransformer._();

  const PatientBirthSexEnumTypeTransformer._();

  String encode(PatientBirthSexEnum data) => data.value;

  /// Decodes a [dynamic value][data] to a PatientBirthSexEnum.
  ///
  /// If [allowNull] is true and the [dynamic value][data] cannot be decoded successfully,
  /// then null is returned. However, if [allowNull] is false and the [dynamic value][data]
  /// cannot be decoded successfully, then an [UnimplementedError] is thrown.
  ///
  /// The [allowNull] is very handy when an API changes and a new enum value is added or removed,
  /// and users are still using an old app with the old code.
  PatientBirthSexEnum? decode(dynamic data, {bool allowNull = true}) {
    if (data != null) {
      switch (data.toString()) {
        case r'male':
          return PatientBirthSexEnum.male;
        case r'female':
          return PatientBirthSexEnum.female;
        case r'indeterminate':
          return PatientBirthSexEnum.indeterminate;
        case r'changed':
          return PatientBirthSexEnum.changed;
        case r'changedToMale':
          return PatientBirthSexEnum.changedToMale;
        case r'changedToFemale':
          return PatientBirthSexEnum.changedToFemale;
        case r'unknown':
          return PatientBirthSexEnum.unknown;
        default:
          if (!allowNull) {
            throw ArgumentError('Unknown enum value to decode: $data');
          }
      }
    }
    return null;
  }

  /// Singleton [PatientBirthSexEnumTypeTransformer] instance.
  static PatientBirthSexEnumTypeTransformer? _instance;
}

/// When not active, the reason for deactivation.
class PatientDeactivationReasonEnum {
  /// Instantiate a new enum with the provided [value].
  const PatientDeactivationReasonEnum._(this.value);

  /// The underlying value of this enum member.
  final String value;

  @override
  String toString() => value;

  String toJson() => value;

  static const deceased = PatientDeactivationReasonEnum._(r'deceased');
  static const moved = PatientDeactivationReasonEnum._(r'moved');
  static const otherDoctor = PatientDeactivationReasonEnum._(r'other_doctor');
  static const retired = PatientDeactivationReasonEnum._(r'retired');
  static const noContact = PatientDeactivationReasonEnum._(r'no_contact');
  static const unknown = PatientDeactivationReasonEnum._(r'unknown');
  static const none = PatientDeactivationReasonEnum._(r'none');

  /// List of all possible values in this [enum][PatientDeactivationReasonEnum].
  static const values = <PatientDeactivationReasonEnum>[
    deceased,
    moved,
    otherDoctor,
    retired,
    noContact,
    unknown,
    none,
  ];

  static PatientDeactivationReasonEnum? fromJson(dynamic value) => PatientDeactivationReasonEnumTypeTransformer().decode(value);

  static List<PatientDeactivationReasonEnum>? listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <PatientDeactivationReasonEnum>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = PatientDeactivationReasonEnum.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }
}

/// Transformation class that can [encode] an instance of [PatientDeactivationReasonEnum] to String,
/// and [decode] dynamic data back to [PatientDeactivationReasonEnum].
class PatientDeactivationReasonEnumTypeTransformer {
  factory PatientDeactivationReasonEnumTypeTransformer() => _instance ??= const PatientDeactivationReasonEnumTypeTransformer._();

  const PatientDeactivationReasonEnumTypeTransformer._();

  String encode(PatientDeactivationReasonEnum data) => data.value;

  /// Decodes a [dynamic value][data] to a PatientDeactivationReasonEnum.
  ///
  /// If [allowNull] is true and the [dynamic value][data] cannot be decoded successfully,
  /// then null is returned. However, if [allowNull] is false and the [dynamic value][data]
  /// cannot be decoded successfully, then an [UnimplementedError] is thrown.
  ///
  /// The [allowNull] is very handy when an API changes and a new enum value is added or removed,
  /// and users are still using an old app with the old code.
  PatientDeactivationReasonEnum? decode(dynamic data, {bool allowNull = true}) {
    if (data != null) {
      switch (data.toString()) {
        case r'deceased':
          return PatientDeactivationReasonEnum.deceased;
        case r'moved':
          return PatientDeactivationReasonEnum.moved;
        case r'other_doctor':
          return PatientDeactivationReasonEnum.otherDoctor;
        case r'retired':
          return PatientDeactivationReasonEnum.retired;
        case r'no_contact':
          return PatientDeactivationReasonEnum.noContact;
        case r'unknown':
          return PatientDeactivationReasonEnum.unknown;
        case r'none':
          return PatientDeactivationReasonEnum.none;
        default:
          if (!allowNull) {
            throw ArgumentError('Unknown enum value to decode: $data');
          }
      }
    }
    return null;
  }

  /// Singleton [PatientDeactivationReasonEnumTypeTransformer] instance.
  static PatientDeactivationReasonEnumTypeTransformer? _instance;
}

/// any of `single`, `in_couple`, `married`, `separated`, `divorced`, `divorcing`, `widowed`, `widower`, `complicated`, `unknown`, `contract`, `other`.
class PatientPersonalStatusEnum {
  /// Instantiate a new enum with the provided [value].
  const PatientPersonalStatusEnum._(this.value);

  /// The underlying value of this enum member.
  final String value;

  @override
  String toString() => value;

  String toJson() => value;

  static const single = PatientPersonalStatusEnum._(r'single');
  static const inCouple = PatientPersonalStatusEnum._(r'in_couple');
  static const married = PatientPersonalStatusEnum._(r'married');
  static const separated = PatientPersonalStatusEnum._(r'separated');
  static const divorced = PatientPersonalStatusEnum._(r'divorced');
  static const divorcing = PatientPersonalStatusEnum._(r'divorcing');
  static const widowed = PatientPersonalStatusEnum._(r'widowed');
  static const widower = PatientPersonalStatusEnum._(r'widower');
  static const complicated = PatientPersonalStatusEnum._(r'complicated');
  static const unknown = PatientPersonalStatusEnum._(r'unknown');
  static const contract = PatientPersonalStatusEnum._(r'contract');
  static const other = PatientPersonalStatusEnum._(r'other');
  static const annulled = PatientPersonalStatusEnum._(r'annulled');
  static const polygamous = PatientPersonalStatusEnum._(r'polygamous');

  /// List of all possible values in this [enum][PatientPersonalStatusEnum].
  static const values = <PatientPersonalStatusEnum>[
    single,
    inCouple,
    married,
    separated,
    divorced,
    divorcing,
    widowed,
    widower,
    complicated,
    unknown,
    contract,
    other,
    annulled,
    polygamous,
  ];

  static PatientPersonalStatusEnum? fromJson(dynamic value) => PatientPersonalStatusEnumTypeTransformer().decode(value);

  static List<PatientPersonalStatusEnum>? listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <PatientPersonalStatusEnum>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = PatientPersonalStatusEnum.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }
}

/// Transformation class that can [encode] an instance of [PatientPersonalStatusEnum] to String,
/// and [decode] dynamic data back to [PatientPersonalStatusEnum].
class PatientPersonalStatusEnumTypeTransformer {
  factory PatientPersonalStatusEnumTypeTransformer() => _instance ??= const PatientPersonalStatusEnumTypeTransformer._();

  const PatientPersonalStatusEnumTypeTransformer._();

  String encode(PatientPersonalStatusEnum data) => data.value;

  /// Decodes a [dynamic value][data] to a PatientPersonalStatusEnum.
  ///
  /// If [allowNull] is true and the [dynamic value][data] cannot be decoded successfully,
  /// then null is returned. However, if [allowNull] is false and the [dynamic value][data]
  /// cannot be decoded successfully, then an [UnimplementedError] is thrown.
  ///
  /// The [allowNull] is very handy when an API changes and a new enum value is added or removed,
  /// and users are still using an old app with the old code.
  PatientPersonalStatusEnum? decode(dynamic data, {bool allowNull = true}) {
    if (data != null) {
      switch (data.toString()) {
        case r'single':
          return PatientPersonalStatusEnum.single;
        case r'in_couple':
          return PatientPersonalStatusEnum.inCouple;
        case r'married':
          return PatientPersonalStatusEnum.married;
        case r'separated':
          return PatientPersonalStatusEnum.separated;
        case r'divorced':
          return PatientPersonalStatusEnum.divorced;
        case r'divorcing':
          return PatientPersonalStatusEnum.divorcing;
        case r'widowed':
          return PatientPersonalStatusEnum.widowed;
        case r'widower':
          return PatientPersonalStatusEnum.widower;
        case r'complicated':
          return PatientPersonalStatusEnum.complicated;
        case r'unknown':
          return PatientPersonalStatusEnum.unknown;
        case r'contract':
          return PatientPersonalStatusEnum.contract;
        case r'other':
          return PatientPersonalStatusEnum.other;
        case r'annulled':
          return PatientPersonalStatusEnum.annulled;
        case r'polygamous':
          return PatientPersonalStatusEnum.polygamous;
        default:
          if (!allowNull) {
            throw ArgumentError('Unknown enum value to decode: $data');
          }
      }
    }
    return null;
  }

  /// Singleton [PatientPersonalStatusEnumTypeTransformer] instance.
  static PatientPersonalStatusEnumTypeTransformer? _instance;
}
