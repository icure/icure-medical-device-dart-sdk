//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

import io.icure.kraken.client.models.PaginatedDocumentKeyIdPairObject
import io.icure.kraken.client.models.PaginatedListCodeDto
import io.icure.kraken.client.models.PaginatedListDeviceDto
import io.icure.kraken.client.models.PaginatedListHealthElementDto
import io.icure.kraken.client.models.PaginatedListHealthcarePartyDto
import io.icure.kraken.client.models.PaginatedListUserDto
import io.icure.kraken.client.models.decrypted.PaginatedListPatientDto
import io.icure.kraken.client.models.decrypted.PaginatedListServiceDto
import io.icure.md.client.models.PaginatedDocumentKeyAndIdPairObject
import io.icure.md.client.models.PaginatedListCoding
import io.icure.md.client.models.PaginatedListDataSample
import io.icure.md.client.models.PaginatedListHealthcareElement
import io.icure.md.client.models.PaginatedListHealthcareProfessional
import io.icure.md.client.models.PaginatedListMedicalDevice
import io.icure.md.client.models.PaginatedListPatient
import io.icure.md.client.models.PaginatedListUser

PaginatedListUser toPaginatedListUser() => PaginatedListUser(
pageSize = this.pageSize,
totalSize = this.totalSize,
rows = this.rows.map { it.toUser() },
nextKeyPair = PaginatedDocumentKeyAndIdPairObject(this.nextKeyPair?.startKey, this.nextKeyPair?.startKeyDocId)
)

PaginatedListHealthcareElement toPaginatedListHealthcareElement() => PaginatedListHealthcareElement(
pageSize = this.pageSize,
totalSize = this.totalSize,
rows = this.rows.map { it.toHealthcareElement() },
nextKeyPair = PaginatedDocumentKeyAndIdPairObject(this.nextKeyPair?.startKey, this.nextKeyPair?.startKeyDocId)
)

PaginatedListPatient toPaginatedListPatient() => PaginatedListPatient(
pageSize = this.pageSize,
totalSize = this.totalSize,
rows = this.rows.map { it.toPatient() },
nextKeyPair = PaginatedDocumentKeyAndIdPairObject(this.nextKeyPair?.startKey, this.nextKeyPair?.startKeyDocId)
)

PaginatedListCoding toPaginatedListCoding() => PaginatedListCoding(
pageSize = this.pageSize,
totalSize = this.totalSize,
rows = this.rows.map { it.toCoding() },
nextKeyPair = PaginatedDocumentKeyAndIdPairObject(this.nextKeyPair?.startKey, this.nextKeyPair?.startKeyDocId)
)

PaginatedListDataSample toPaginatedListDataSample() => PaginatedListDataSample(
pageSize = this.pageSize,
totalSize = this.totalSize,
rows = this.rows.map { it.toDataSample() },
nextKeyPair = PaginatedDocumentKeyAndIdPairObject(this.nextKeyPair?.startKey, this.nextKeyPair?.startKeyDocId)
)

PaginatedListHealthcareProfessional toPaginatedListHealthcareProfessional() => PaginatedListHealthcareProfessional(
pageSize = this.pageSize,
totalSize = this.totalSize,
rows = this.rows.map { it.toHealthcareProfessional() },
nextKeyPair = PaginatedDocumentKeyAndIdPairObject(this.nextKeyPair?.startKey, this.nextKeyPair?.startKeyDocId)
)

fun PaginatedListDeviceDto.toPaginatedListMedicalDevice(): PaginatedListMedicalDevice {
    return PaginatedListMedicalDevice(
        pageSize = this.pageSize,
        totalSize = this.totalSize,
        rows = this.rows.map { it.toMedicalDevice() },
        nextKeyPair = this.nextKeyPair?.toPaginatedDocumentKeyAndIdPairObject()
    )
}

fun PaginatedDocumentKeyIdPairObject.toPaginatedDocumentKeyAndIdPairObject(): PaginatedDocumentKeyAndIdPairObject {
    return PaginatedDocumentKeyAndIdPairObject(
        startKey = startKey,
        startKeyDocId = startKeyDocId
    )
}

