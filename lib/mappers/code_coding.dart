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

final Uuid uuid = Uuid();

extension CodeDtoMapper on CodeDto {
  Coding toCoding() => Coding(
        id: this.id,
        qualifiedLinks: this.qualifiedLinks,
        searchTerms: this.searchTerms,
        rev: this.rev,
        type: this.type,
        code: this.code,
        version: this.version,
        description: this.label,
      );
}

extension CodingMapper on Coding {
  CodeDto toCodeDto() => CodeDto(
        id: this.id?.also((it) {
              if (!Uuid.isValidUUID(fromString: it)) {
                throw FormatException("Invalid id, id must be a valid UUID");
              }
            }) ??
            uuid.v4(options: {'rng': UuidUtil.cryptoRNG}),
        qualifiedLinks: this.qualifiedLinks,
        searchTerms: this.searchTerms,
        rev: this.rev,
        type: this.type,
        code: this.code,
        version: this.version,
        label: this.description,
      );
}
