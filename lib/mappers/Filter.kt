//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

import io.icure.kraken.client.models.CodeDto
import io.icure.kraken.client.models.DeviceDto
import io.icure.kraken.client.models.HealthElementDto
import io.icure.kraken.client.models.HealthcarePartyDto
import io.icure.kraken.client.models.PatientDto
import io.icure.kraken.client.models.ServiceDto
import io.icure.kraken.client.models.UserDto
import io.icure.kraken.client.models.filter.AbstractFilterDto
import io.icure.md.client.filter.ComplementFilter
import io.icure.md.client.filter.Filter
import io.icure.md.client.filter.IntersectionFilter
import io.icure.md.client.filter.UnionFilter
import io.icure.md.client.filter.coding.*
import io.icure.md.client.filter.datasample.*
import io.icure.md.client.filter.device.*
import io.icure.md.client.filter.hcp.*
import io.icure.md.client.filter.healthcareelement.*
import io.icure.md.client.filter.patient.*
import io.icure.md.client.filter.user.*
import io.icure.md.client.models.Coding
import io.icure.md.client.models.DataSample
import io.icure.md.client.models.HealthcareElement
import io.icure.md.client.models.HealthcareProfessional
import io.icure.md.client.models.MedicalDevice
import io.icure.md.client.models.Patient
import io.icure.md.client.models.User
import kotlin.reflect.KClass

AbstractFilterDto<T> toAbstractFilterDto<F, T>() => when {
    from == Coding::class && to == CodeDto::class -> (this as Filter<Coding>).codingFilterToAbstractCodeFilterDto() as AbstractFilterDto<T>
    from == DataSample::class && to == ServiceDto::class -> (this as Filter<DataSample>).dataSampleFilterToAbstractServiceFilterDto() as AbstractFilterDto<T>
    from == MedicalDevice::class && to == DeviceDto::class -> (this as Filter<MedicalDevice>).medicalDeviceFilterToAbstractDeviceFilterDto() as AbstractFilterDto<T>
    from == HealthcareProfessional::class && to == HealthcarePartyDto::class -> (this as Filter<HealthcareProfessional>).healthcareProfessionalFilterToAbstractHealthcarePartyFilterDto() as AbstractFilterDto<T>
    from == HealthcareElement::class && to == HealthElementDto::class -> (this as Filter<HealthcareElement>).healthcareElementFilterToAbstractHealthElementFilterDto() as AbstractFilterDto<T>
    from == Patient::class && to == PatientDto::class -> (this as Filter<Patient>).patientFilterToAbstractPatientFilterDto() as AbstractFilterDto<T>
    from == User::class && to == UserDto::class -> (this as Filter<User>).userFilterToAbstractUserFilterDto() as AbstractFilterDto<T>
    else -> throw IllegalArgumentException("Unsupported filter ${this::class}")
}

fun Filter<Coding>.codingFilterToAbstractCodeFilterDto(): AbstractFilterDto<CodeDto> = when (this) {
    is ComplementFilter<Coding> -> this.toComplementFilterDto(Coding::class, CodeDto::class)
    is UnionFilter<Coding> -> this.toUnionFilterDto(Coding::class, CodeDto::class)
    is IntersectionFilter<Coding> -> this.toIntersectionFilterDto(Coding::class, CodeDto::class)
    is AllCodesFilter -> this.toAllCodesFilterDto()
    is CodeByIdsFilter -> this.toCodeByIdsFilterDto()
    is CodeByRegionTypeLabelFilter -> this.toCodeByRegionTypeLabelFilterDto()
    else -> throw IllegalArgumentException("Unsupported filter ${this::class}")
}

fun Filter<DataSample>.dataSampleFilterToAbstractServiceFilterDto(): AbstractFilterDto<ServiceDto> = when (this) {
    is ComplementFilter<DataSample> -> this.toComplementFilterDto(DataSample::class, ServiceDto::class)
    is UnionFilter<DataSample> -> this.toUnionFilterDto(DataSample::class, ServiceDto::class)
    is IntersectionFilter<DataSample> -> this.toIntersectionFilterDto(DataSample::class, ServiceDto::class)
    is DataSampleByHealthcarePartyFilter -> this.toDataSampleByHealthcarePartyFilterDto()
    is DataSampleByHealthcarePartyIdentifiersFilter -> this.toDataSampleByHealthcarePartyIdentifiersFilterDto()
    is DataSampleByHealthcarePartyLabelCodeDateFilter -> this.toDataSampleByHealthcarePartyLabelCodeDateFilterDto()
    is DataSampleByIdsFilter -> this.toDataSampleByIdsFilterDto()
    is DataSampleByPatientFilter -> this.toDataSampleByPatientFilterDto()
    else -> throw IllegalArgumentException("Unsupported filter ${this::class}")
}

fun Filter<MedicalDevice>.medicalDeviceFilterToAbstractDeviceFilterDto(): AbstractFilterDto<DeviceDto> = when (this) {
    is ComplementFilter<MedicalDevice> -> this.toComplementFilterDto(MedicalDevice::class, DeviceDto::class)
    is UnionFilter<MedicalDevice> -> this.toUnionFilterDto(MedicalDevice::class, DeviceDto::class)
    is IntersectionFilter<MedicalDevice> -> this.toIntersectionFilterDto(MedicalDevice::class, DeviceDto::class)
    is DeviceByIdsFilter -> this.toDeviceByIdsFilterDto()
    is AllDevicesFilter -> this.toAllDevicesFilterDto()
    else -> throw IllegalArgumentException("Unsupported filter ${this::class}")
}

fun Filter<HealthcareProfessional>.healthcareProfessionalFilterToAbstractHealthcarePartyFilterDto(): AbstractFilterDto<HealthcarePartyDto> =
    when (this) {
        is ComplementFilter<HealthcareProfessional> -> this.toComplementFilterDto(
            HealthcareProfessional::class,
            HealthcarePartyDto::class
        )
        is UnionFilter<HealthcareProfessional> -> this.toUnionFilterDto(
            HealthcareProfessional::class,
            HealthcarePartyDto::class
        )
        is IntersectionFilter<HealthcareProfessional> -> this.toIntersectionFilterDto(
            HealthcareProfessional::class,
            HealthcarePartyDto::class
        )
        is AllHealthcareProfessionalsFilter -> this.toAllHealthcareProfessionalsFilterDto()
        is HealthcareProfessionalByIdsFilter -> this.toHealthcareProfessionalByIdsFilterDto()
        else -> throw IllegalArgumentException("Unsupported filter ${this::class}")
    }

fun Filter<HealthcareElement>.healthcareElementFilterToAbstractHealthElementFilterDto(): AbstractFilterDto<HealthElementDto> =
    when (this) {
        is ComplementFilter<HealthcareElement> -> this.toComplementFilterDto(
            HealthcareElement::class,
            HealthElementDto::class
        )
        is UnionFilter<HealthcareElement> -> this.toUnionFilterDto(HealthcareElement::class, HealthElementDto::class)
        is IntersectionFilter<HealthcareElement> -> this.toIntersectionFilterDto(
            HealthcareElement::class,
            HealthElementDto::class
        )
        is HealthcareElementByHealthcarePartyFilter -> this.toHealthcareElementByHealthcarePartyFilterDto()
        is HealthcareElementByHealthcarePartyIdentifiersFilter -> this.toHealthcareElementByHealthcarePartyIdentifiersFilterDto()
        is HealthcareElementByHealthcarePartyLabelCodeFilter -> this.toHealthcareElementByHealthcarePartyLabelCodeFilterDto()
        //is HealthcareElementByIdsFilter -> this.toHealthcareElementByIdsFilterDto()
        else -> throw IllegalArgumentException("Unsupported filter ${this::class}")
    }

fun Filter<Patient>.patientFilterToAbstractPatientFilterDto(): AbstractFilterDto<PatientDto> = when (this) {
    is ComplementFilter<Patient> -> this.toComplementFilterDto(Patient::class, PatientDto::class)
    is UnionFilter<Patient> -> this.toUnionFilterDto(Patient::class, PatientDto::class)
    is IntersectionFilter<Patient> -> this.toIntersectionFilterDto(Patient::class, PatientDto::class)
    is PatientByHealthcarePartyFilter -> this.toPatientByHealthcarePartyFilterDto()
    is PatientByHealthcarePartyAndIdentifiersFilter -> this.toPatientByHealthcarePartyAndIdentifiersFilterDto()
    is PatientByHealthcarePartyDateOfBirthBetweenFilter -> this.toPatientByHealthcarePartyDateOfBirthBetweenFilterDto()
    is PatientByHealthcarePartyGenderEducationProfession -> this.toPatientByHealthcarePartyGenderEducationProfessionDto()
    is PatientByHealthcarePartyNameContainsFuzzyFilter -> this.toPatientByHealthcarePartyNameContainsFuzzyFilterDto()
    is PatientByHealthcarePartyNameFilter -> this.toPatientByHealthcarePartyNameFilterDto()
    is PatientByIdsFilter -> this.toPatientByIdsFilterDto()
    else -> throw IllegalArgumentException("Unsupported filter ${this::class}")
}

fun Filter<User>.userFilterToAbstractUserFilterDto(): AbstractFilterDto<UserDto> = when (this) {
    is ComplementFilter<User> -> this.toComplementFilterDto(User::class, UserDto::class)
    is UnionFilter<User> -> this.toUnionFilterDto(User::class, UserDto::class)
    is IntersectionFilter<User> -> this.toIntersectionFilterDto(User::class, UserDto::class)
    is AllUsersFilter -> this.toAllUsersFilterDto()
    is UserByIdsFilter -> this.toUserByIdsFilterDto()
    else -> throw IllegalArgumentException("Unsupported filter ${this::class}")
}

fun AllCodesFilter.toAllCodesFilterDto(): io.icure.kraken.client.models.filter.code.AllCodesFilter {
    return io.icure.kraken.client.models.filter.code.AllCodesFilter(this.description)

}

fun CodeByIdsFilter.toCodeByIdsFilterDto(): io.icure.kraken.client.models.filter.code.CodeByIdsFilter {
    return io.icure.kraken.client.models.filter.code.CodeByIdsFilter(this.description, this.ids)
}

fun CodeByRegionTypeLabelFilter.toCodeByRegionTypeLabelFilterDto(): io.icure.kraken.client.models.filter.code.CodeByRegionTypeLabelLanguageFilter {
    return io.icure.kraken.client.models.filter.code.CodeByRegionTypeLabelLanguageFilter(
        this.description,
        this.region,
        this.type,
        this.language,
        this.label
    )
}

fun DataSampleByHealthcarePartyFilter.toDataSampleByHealthcarePartyFilterDto(): io.icure.kraken.client.models.filter.service.ServiceByHcPartyFilter {
    return io.icure.kraken.client.models.filter.service.ServiceByHcPartyFilter(this.hcpId, this.description)
}

fun DataSampleByHealthcarePartyIdentifiersFilter.toDataSampleByHealthcarePartyIdentifiersFilterDto(): io.icure.kraken.client.models.filter.service.ServiceByHcPartyIdentifiersFilter {
    return io.icure.kraken.client.models.filter.service.ServiceByHcPartyIdentifiersFilter(
        this.healthcarePartyId,
        this.description,
        this.identifiers.map { it.toIdentifierDto() })
}

fun DataSampleByHealthcarePartyLabelCodeDateFilter.toDataSampleByHealthcarePartyLabelCodeDateFilterDto(): io.icure.kraken.client.models.filter.service.ServiceByHcPartyTagCodeDateFilter {
    return io.icure.kraken.client.models.filter.service.ServiceByHcPartyTagCodeDateFilter(
        this.description,
        this.healthcarePartyId,
        null,
        this.tagType,
        this.tagCode,
        this.codeType,
        this.codeCode,
        this.startValueDate,
        this.endValueDate
    )
}

fun DataSampleByIdsFilter.toDataSampleByIdsFilterDto(): io.icure.kraken.client.models.filter.service.ServiceByIdsFilter {
    return io.icure.kraken.client.models.filter.service.ServiceByIdsFilter(this.ids, this.description)
}

fun DataSampleByPatientFilter.toDataSampleByPatientFilterDto(): io.icure.kraken.client.models.filter.service.ServiceBySecretForeignKeys {
    return io.icure.kraken.client.models.filter.service.ServiceBySecretForeignKeys(
        this.description,
        this.healthcarePartyId,
        this.patientSecretForeignKeys
    )
}

fun DeviceByIdsFilter.toDeviceByIdsFilterDto(): io.icure.kraken.client.models.filter.device.DeviceByIdsFilter {
    return io.icure.kraken.client.models.filter.device.DeviceByIdsFilter(this.ids, this.description)
}

fun AllDevicesFilter.toAllDevicesFilterDto(): io.icure.kraken.client.models.filter.device.AllDevicesFilter {
    return io.icure.kraken.client.models.filter.device.AllDevicesFilter(this.description)
}

fun AllHealthcareProfessionalsFilter.toAllHealthcareProfessionalsFilterDto(): io.icure.kraken.client.models.filter.hcparty.AllHealthcarePartiesFilter {
    return io.icure.kraken.client.models.filter.hcparty.AllHealthcarePartiesFilter(this.description)
}

fun HealthcareProfessionalByIdsFilter.toHealthcareProfessionalByIdsFilterDto(): io.icure.kraken.client.models.filter.hcparty.HealthcarePartyByIdsFilter {
    return io.icure.kraken.client.models.filter.hcparty.HealthcarePartyByIdsFilter(this.ids, this.description)
}

fun HealthcareElementByHealthcarePartyFilter.toHealthcareElementByHealthcarePartyFilterDto(): io.icure.kraken.client.models.filter.healthelement.HealthElementByHcPartyFilter {
    return io.icure.kraken.client.models.filter.healthelement.HealthElementByHcPartyFilter(this.hcpId, this.description)
}

fun HealthcareElementByHealthcarePartyIdentifiersFilter.toHealthcareElementByHealthcarePartyIdentifiersFilterDto(): io.icure.kraken.client.models.filter.healthelement.HealthElementByHcPartyIdentifiersFilter {
    return io.icure.kraken.client.models.filter.healthelement.HealthElementByHcPartyIdentifiersFilter(
        this.description,
        this.healthcarePartyId,
        this.identifiers.map { it.toIdentifierDto() })
}

fun HealthcareElementByHealthcarePartyLabelCodeFilter.toHealthcareElementByHealthcarePartyLabelCodeFilterDto(): io.icure.kraken.client.models.filter.healthelement.HealthElementByHcPartyTagCodeFilter {
    return io.icure.kraken.client.models.filter.healthelement.HealthElementByHcPartyTagCodeFilter(
        this.description,
        this.healthcarePartyId,
        this.codeType,
        this.codeNumber,
        this.tagType,
        this.tagCode
    )
}

fun HealthcareElementByIdsFilter.toHealthcareElementByIdsFilterDto(): io.icure.kraken.client.models.filter.healthelement.HealthElementByIdsFilter {
    return io.icure.kraken.client.models.filter.healthelement.HealthElementByIdsFilter(this.ids, this.description)
}

fun PatientByHealthcarePartyAndIdentifiersFilter.toPatientByHealthcarePartyAndIdentifiersFilterDto(): io.icure.kraken.client.models.filter.patient.PatientByHcPartyAndIdentifiersFilter {
    return io.icure.kraken.client.models.filter.patient.PatientByHcPartyAndIdentifiersFilter(
        this.description,
        this.healthcarePartyId,
        this.identifiers.map { it.toIdentifierDto() })
}

fun PatientByHealthcarePartyDateOfBirthBetweenFilter.toPatientByHealthcarePartyDateOfBirthBetweenFilterDto(): io.icure.kraken.client.models.filter.patient.PatientByHcPartyDateOfBirthBetweenFilter {
    return io.icure.kraken.client.models.filter.patient.PatientByHcPartyDateOfBirthBetweenFilter(
        this.description,
        this.minDateOfBirth,
        this.maxDateOfBirth,
        this.healthcarePartyId
    )
}

fun PatientByHealthcarePartyFilter.toPatientByHealthcarePartyFilterDto(): io.icure.kraken.client.models.filter.patient.PatientByHcPartyFilter {
    return io.icure.kraken.client.models.filter.patient.PatientByHcPartyFilter(this.description, this.healthcarePartyId)
}

fun PatientByHealthcarePartyGenderEducationProfession.toPatientByHealthcarePartyGenderEducationProfessionDto(): io.icure.kraken.client.models.filter.patient.PatientByHcPartyGenderEducationProfession {
    return io.icure.kraken.client.models.filter.patient.PatientByHcPartyGenderEducationProfession(
        this.description,
        this.healthcarePartyId,
        this.gender?.toDbGender(),
        this.education,
        this.profession
    )
}

fun PatientByHealthcarePartyNameContainsFuzzyFilter.toPatientByHealthcarePartyNameContainsFuzzyFilterDto(): io.icure.kraken.client.models.filter.patient.PatientByHcPartyNameContainsFuzzyFilter {
    return io.icure.kraken.client.models.filter.patient.PatientByHcPartyNameContainsFuzzyFilter(
        this.description,
        this.searchString,
        this.healthcarePartyId
    )
}

fun PatientByHealthcarePartyNameFilter.toPatientByHealthcarePartyNameFilterDto(): io.icure.kraken.client.models.filter.patient.PatientByHcPartyNameFilter {
    return io.icure.kraken.client.models.filter.patient.PatientByHcPartyNameFilter(
        this.description,
        this.name,
        this.healthcarePartyId
    )
}

fun PatientByIdsFilter.toPatientByIdsFilterDto(): io.icure.kraken.client.models.filter.patient.PatientByIdsFilter {
    return io.icure.kraken.client.models.filter.patient.PatientByIdsFilter(this.description, this.ids)
}

fun AllUsersFilter.toAllUsersFilterDto(): io.icure.kraken.client.models.filter.user.AllUsersFilter {
    return io.icure.kraken.client.models.filter.user.AllUsersFilter(this.description)
}

fun UserByIdsFilter.toUserByIdsFilterDto(): io.icure.kraken.client.models.filter.user.UserByIdsFilter {
    return io.icure.kraken.client.models.filter.user.UserByIdsFilter(ids, this.description)
}

@Suppress("UNCHECKED_CAST")
inline fun <reified F : Any, reified T : Any> ComplementFilter<F>.toComplementFilterDto() =
    this.toComplementFilterDto(F::class, T::class)

fun <F : Any, T : Any> ComplementFilter<F>.toComplementFilterDto(
    from: KClass<F>,
    to: KClass<T>
): io.icure.kraken.client.models.filter.ComplementFilter<T> =
    io.icure.kraken.client.models.filter.ComplementFilter(
        this.description,
        this.superSet.toAbstractFilterDto(from, to),
        this.subSet.toAbstractFilterDto(from, to)
    )

@Suppress("UNCHECKED_CAST")
inline fun <reified F : Any, reified T : Any> UnionFilter<F>.toUnionFilterDto() =
    this.toUnionFilterDto(F::class, T::class)

fun <F : Any, T : Any> UnionFilter<F>.toUnionFilterDto(
    from: KClass<F>,
    to: KClass<T>
): io.icure.kraken.client.models.filter.UnionFilter<T> =
    io.icure.kraken.client.models.filter.UnionFilter(
        this.description,
        this.filters.map { it.toAbstractFilterDto(from, to) })

@Suppress("UNCHECKED_CAST")
inline fun <reified F : Any, reified T : Any> IntersectionFilter<F>.toIntersectionFilterDto() =
    this.toIntersectionFilterDto(F::class, T::class)

fun <F : Any, T : Any> IntersectionFilter<F>.toIntersectionFilterDto(
    from: KClass<F>,
    to: KClass<T>
): io.icure.kraken.client.models.filter.IntersectionFilter<T> =
    io.icure.kraken.client.models.filter.IntersectionFilter(
        this.description,
        this.filters.map { it.toAbstractFilterDto(from, to) })
