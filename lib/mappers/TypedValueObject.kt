//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

import io.icure.kraken.client.models.TypedValueDtoObject
import io.icure.md.client.models.TypedValueObject

TypedValueObject toTypedValueObject() => TypedValueObject(
type = this.type?.toTypedValueObjectType(),
booleanValue = this.booleanValue,
integerValue = this.integerValue,
doubleValue = this.doubleValue,
stringValue = this.stringValue,
dateValue = this.dateValue,
)

private fun TypedValueDtoObject.Type.toTypedValueObjectType() = TypedValueObject.Type.valueOf(this.name)

fun TypedValueObject.toTypedValueObject() = TypedValueDtoObject(
    type = this.type?.toTypedValueDtoObjectType(),
    booleanValue = this.booleanValue,
    integerValue = this.integerValue,
    doubleValue = this.doubleValue,
    stringValue = this.stringValue,
    dateValue = this.dateValue,
)

private fun TypedValueObject.Type.toTypedValueDtoObjectType() = TypedValueDtoObject.Type.valueOf(this.name)
