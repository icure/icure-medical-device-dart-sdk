//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

import io.icure.kraken.client.models.PatientHealthCarePartyDto
import io.icure.md.client.models.PatientHealthCareParty

PatientHealthCareParty toPatientHealthCareParty() => PatientHealthCareParty(
type = this.type?.toPatientHealthCarePartyType() ?: PatientHealthCareParty.Type.other,
healthcarePartyId = this.healthcarePartyId,
)

private fun PatientHealthCarePartyDto.Type.toPatientHealthCarePartyType() =
    PatientHealthCareParty.Type.valueOf(this.name)

fun PatientHealthCareParty.toPatientHealthCareParty() = PatientHealthCarePartyDto(
    type = this.type.toPatientHealthCarePartyDto(),
    healthcarePartyId = this.healthcarePartyId,
)

private fun PatientHealthCareParty.Type.toPatientHealthCarePartyDto() =
    PatientHealthCarePartyDto.Type.valueOf(this.name)
