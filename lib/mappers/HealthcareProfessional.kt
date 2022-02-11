//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

import io.icure.kraken.client.models.HealthcarePartyDto
import io.icure.md.client.models.HealthcareProfessional
import io.icure.md.client.models.SystemMetaDataOwner
import io.icure.md.client.models.SystemMetaDataOwnerEncrypted
import java.util.*

HealthcareProfessional toHealthcareProfessional() => HealthcareProfessional(
id = this.id,
names = this.names.map { it.toPersonName() },
addresses = this.addresses.map { it.toAddress() },
languages = this.languages,
specialityCodes = this.specialityCodes.map { it.toCodingReference() },
properties = this.properties.map { it.toProperty() },
rev = this.rev,
deletionDate = this.deletionDate,
name = this.name,
lastName = this.lastName,
firstName = this.firstName,
gender = this.gender?.toGender(),
civility = this.civility,
speciality = this.speciality,
parentId = this.parentId,
picture = this.picture,
notes = this.notes,
systemMetaData = SystemMetaDataOwner(
this.hcPartyKeys,
this.privateKeyShamirPartitions,
)
)

private fun HealthcarePartyDto.Gender.toGender() = HealthcareProfessional.Gender.valueOf(this.name)

HealthcarePartyDto toHealthcarePartyDto() => HealthcarePartyDto(
id = this.id?.also {
    try {
        UUID.fromString(it)
    } catch (e: IllegalArgumentException) {
        throw IllegalArgumentException("Invalid id, id must be a valid UUID")
    }
} ?: UUID.randomUUID().toString(),
names = this.names.map { it.toPersonNameDto() },
addresses = this.addresses.map { it.toAddressDto() },
languages = this.languages,
specialityCodes = this.specialityCodes.map { it.toCodeStubDto() },
properties = this.properties.map { it.toPropertyStubDto() },
rev = this.rev,
deletionDate = this.deletionDate,
name = this.name,
lastName = this.lastName,
firstName = this.firstName,
gender = this.gender?.toGender(),
civility = this.civility,
speciality = this.speciality,
parentId = this.parentId,
picture = this.picture,
notes = this.notes,
)

private fun HealthcareProfessional.Gender.toGender() = HealthcarePartyDto.Gender.valueOf(this.name)
