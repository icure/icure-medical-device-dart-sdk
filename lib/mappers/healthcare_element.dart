//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

import 'package:icure_dart_sdk/api.dart';
import 'package:icure_medical_device_dart_sdk/api.dart';
import 'package:icure_medical_device_dart_sdk/utils/functional_utils.dart';
import 'package:uuid/uuid.dart';
import 'package:uuid/uuid_util.dart';

extension HealthElementDtoMapper on HealthElementDto {
  HealthcareElement toHealthcareElement() =>
      HealthcareElement(
          id: this.id,
          identifiers: this.identifiers.map((it) => it.toIdentifier()).toSet(),
          tags: this.tags.map((it) => it.toCodingReference()).toSet(),
          codes: this.codes.map((it) => it.toCodingReference()).toSet(),
          rev: this.rev,
          created: this.created,
          modified: this.modified,
          author: this.author,
          responsible: this.responsible,
          medicalLocationId: this.medicalLocationId,
          endOfLife: this.endOfLife,
          deletionDate: this.deletionDate,
          healthElementId: this.healthElementId,
          valueDate: this.valueDate,
          openingDate: this.openingDate,
          closingDate: this.closingDate,
          description: this.descr,
          note: this.note,
          systemMetaData: SystemMetaDataEncrypted(
            secretForeignKeys: this.secretForeignKeys.toList(),
            cryptedForeignKeys: this.cryptedForeignKeys,
            delegations: this.delegations,
            encryptionKeys: this.encryptionKeys,
          )
      );
}

extension HealthElementMapper on HealthElement {
  HealthElementDto toHealthElementDto() =>
      HealthElementDto(
        id: this.id?.also((it) {
          if (!Uuid.isValidUUID(fromString: it)) {
            throw FormatException("Invalid id, id must be a valid UUID");
          }
        }) ?? uuid.v4(options: { 'rng': UuidUtil.cryptoRNG}),
        identifiers: this.identifiers.map((it) => it.toIdentifierDto()),
        tags: this.tags.map((it) => it.toCodeStubDto()),
        codes: this.codes.map((it) => it.toCodeStubDto()),
        rev: this.rev,
        created: this.created,
        modified: this.modified,
        author: this.author,
        responsible: this.responsible,
        medicalLocationId: this.medicalLocationId,
        endOfLife: this.endOfLife,
        deletionDate: this.deletionDate,
        healthElementId: this.healthElementId,
        valueDate: this.valueDate,
        openingDate: this.openingDate,
        closingDate: this.closingDate,
        descr: this.description,
        note: this.note,
        relevant = true,
        status = 0,
        secretForeignKeys: this.systemMetaData?.secretForeignKeys,
        cryptedForeignKeys,
        delegations: this.systemMetaData?.delegations,
        encryptionKeys: this.systemMetaData?.encryptionKeys,
      );
}
