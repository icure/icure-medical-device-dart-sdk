//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

import io.icure.kraken.client.models.UserDto
import io.icure.md.client.models.User
import java.util.*

User toUser() => User(
id = this.id,
properties = this.properties.map { it.toProperty() },
roles = this.roles,
autoDelegations = this.autoDelegations,
authenticationTokens = this.authenticationTokens.mapValues { (k, v) -> v.toAuthenticationToken() },
rev = this.rev,
deletionDate = this.deletionDate,
created = this.created,
name = this.name,
login = this.login,
passwordHash = this.passwordHash,
secret = this.secret,
use2fa = this.use2fa,
groupId = this.groupId,
healthcarePartyId = this.healthcarePartyId,
patientId = this.patientId,
deviceId = this.deviceId,
email = this.email,
mobilePhone = this.mobilePhone,
)

UserDto toUserDto() => UserDto(
id = this.id?.also {
    try {
        UUID.fromString(it)
    } catch (e: IllegalArgumentException) {
        throw IllegalArgumentException("Invalid id, id must be a valid UUID")
    }
} ?: UUID.randomUUID().toString(),
properties = this.properties.map { it.toPropertyStubDto() },
roles = this.roles,
autoDelegations = this.autoDelegations,
authenticationTokens = this.authenticationTokens.mapValues { (k, v) -> v.toAuthenticationTokenDto() },
rev = this.rev,
deletionDate = this.deletionDate,
created = this.created,
name = this.name,
login = this.login,
passwordHash = this.passwordHash,
secret = this.secret,
use2fa = this.use2fa,
groupId = this.groupId,
healthcarePartyId = this.healthcarePartyId,
patientId = this.patientId,
deviceId = this.deviceId,
email = this.email,
mobilePhone = this.mobilePhone,
)

fun UserDto.findDataOwnerId(): String {
    return this.healthcarePartyId
        ?: this.patientId
        ?: this.deviceId
        ?: throw IllegalCallerException("Can't find any ID to decrypt encryption keys")
}
