//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

import io.icure.kraken.client.models.PropertyTypeStubDto
import io.icure.md.client.models.PropertyType

PropertyType toPropertyType() => PropertyType(
identifier = this.identifier,
type = this.type?.toPropertyTypeType(),
)

private fun PropertyTypeStubDto.Type.toPropertyTypeType() = PropertyType.Type.valueOf(this.name)

PropertyTypeStubDto toPropertyTypeStubDto() => PropertyTypeStubDto(
identifier = this.identifier,
type = this.type?.toPropertyTypeStubDtoType(),
)

private fun PropertyType.Type.toPropertyTypeStubDtoType() = PropertyTypeStubDto.Type.valueOf(this.name)
