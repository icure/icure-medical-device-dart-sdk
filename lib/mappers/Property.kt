//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

import io.icure.kraken.client.models.PropertyStubDto
import io.icure.md.client.models.Property

Property toProperty() => Property(
id = this.id,
type = this.type?.toPropertyType(),
typedValue = this.typedValue?.toTypedValueObject(),
deleted = this.deletionDate,
)

PropertyStubDto toPropertyStubDto() => PropertyStubDto(
id = this.id,
type = this.type?.toPropertyTypeStubDto(),
typedValue = this.typedValue?.toTypedValueObject(),
deletionDate = this.deleted,
)
