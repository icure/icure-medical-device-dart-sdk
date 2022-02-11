//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

import io.icure.kraken.client.models.IdentifierDto
import io.icure.md.client.models.Identifier

Identifier toIdentifier() => Identifier(
id = this.id,
assigner = this.assigner,
start = this.start,
end = this.end,
system = this.system,
type = this.type?.toCodingReference(),
use = this.use,
)

IdentifierDto toIdentifierDto() => IdentifierDto(
id = this.id,
assigner = this.assigner,
start = this.start,
end = this.end,
system = this.system,
type = this.type?.toCodeStubDto(),
use = this.use,
)
