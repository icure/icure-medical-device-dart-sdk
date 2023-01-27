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

extension DelegationMapper on Delegation {
  DelegationDto toDelegationDto() => DelegationDto(tags: this.tags, owner: this.owner, delegatedTo: this.delegatedTo, key: this.key);
}

extension DelegationDtoMapper on DelegationDto {
  Delegation toDelegation() => Delegation(tags: this.tags, owner: this.owner, delegatedTo: this.delegatedTo, key: this.key);
}

extension DelegationMapMapper on Map<String, List<Delegation>> {
  Map<String, Set<DelegationDto>> toDelegationMapDto() =>
    { for (final entry in this.entries) entry.key : entry.value.map((e) => e.toDelegationDto()).toSet() };
}

extension DelegationMapDtoMapper on Map<String, Set<DelegationDto>> {
  Map<String, List<Delegation>> toDelegationMap() =>
      { for (final entry in this.entries) entry.key : entry.value.map((e) => e.toDelegation()).toList() };
}
