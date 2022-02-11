//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

import io.icure.kraken.client.models.PartnershipDto
import io.icure.md.client.models.Partnership

Partnership toPartnership() => Partnership(
type = this.type?.toPartnershipType(),
status = this.status?.toPartnershipStatus(),
partnerId = this.partnerId,
)

private fun PartnershipDto.Status.toPartnershipStatus() = Partnership.Status.valueOf(this.name)
private fun PartnershipDto.Type.toPartnershipType() = Partnership.Type.valueOf(this.name)

PartnershipDto toPartnershipDto() => PartnershipDto(
type = this.type?.toPartnershipType(),
status = this.status?.toPartnershipStatus(),
partnerId = this.partnerId,
)

private fun Partnership.Status.toPartnershipStatus() = PartnershipDto.Status.valueOf(this.name)
private fun Partnership.Type.toPartnershipType() = PartnershipDto.Type.valueOf(this.name)
