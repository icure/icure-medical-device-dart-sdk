//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

import io.icure.kraken.client.models.PersonNameDto
import io.icure.md.client.models.PersonName

PersonName toPersonName() => PersonName(
firstNames = this.firstNames,
prefix = this.prefix,
suffix = this.suffix,
lastName = this.lastName,
start = this.start,
end = this.end,
text = this.text,
use = this.use?.toPersonNameUse(),
)

private fun PersonNameDto.Use.toPersonNameUse() = PersonName.Use.valueOf(this.name)

PersonNameDto toPersonNameDto() => PersonNameDto(
firstNames = this.firstNames,
prefix = this.prefix,
suffix = this.suffix,
lastName = this.lastName,
start = this.start,
end = this.end,
text = this.text,
use = this.use?.toPersonNameDtoUse(),
)

private fun PersonName.Use.toPersonNameDtoUse() = PersonNameDto.Use.valueOf(this.name)
