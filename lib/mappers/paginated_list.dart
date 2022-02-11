
import 'package:icure_dart_sdk/api.dart';
import 'package:icure_medical_device_dart_sdk/api.dart';
import 'package:icure_medical_device_dart_sdk/mappers/medical_device.dart';

extension PaginatedListDeviceDtoMapper on PaginatedListDeviceDto {
    PaginatedListMedicalDevice toPaginatedListMedicalDevice() => PaginatedListMedicalDevice(
        pageSize: this.pageSize,
        totalSize: this.totalSize,
        rows: this.rows.map((e) => DeviceDtoMapper(e).toMedicalDevice()).toList(),
        nextKeyPair: PaginatedDocumentKeyAndIdPairObject(startKey: this.nextKeyPair?.startKey, startKeyDocId: this.nextKeyPair?.startKeyDocId)
    );
}

/*
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

*/
