//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

library icure_medical_device_dart_sdk.api;

import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart';
import 'package:tuple/tuple.dart';
import 'package:intl/intl.dart';
import 'package:meta/meta.dart';
import 'package:uuid/uuid.dart';
import 'package:uuid/uuid_util.dart';

import 'package:crypton/crypton.dart';
import 'package:crypto/crypto.dart';

import 'package:icure_dart_sdk/api.dart' as base_api;
import 'package:icure_dart_sdk/crypto/crypto.dart';
import 'package:icure_dart_sdk/extended_api/data_owner_api.dart';

import 'utils/date_utils.dart';
import 'utils/functional_utils.dart';
import 'utils/iterable_utils.dart';
import 'utils/cached_map.dart';
import 'utils/uti_detector.dart';

export 'package:icure_dart_sdk/crypto/crypto.dart' show Crypto;

import 'mappers/address.dart';
import 'mappers/authentication_token.dart';
import 'mappers/code_coding.dart';
import 'mappers/code_stub_coding_reference.dart';
import 'mappers/delegation.dart';
import 'mappers/document.dart';
import 'mappers/filter.dart';
import 'mappers/healthcare_element.dart';
import 'mappers/healthcare_professional.dart';
import 'mappers/identifier.dart';
import 'mappers/medical_device.dart';
import 'mappers/paginated_list.dart';
import 'mappers/partnership.dart';
import 'mappers/patient.dart';
import 'mappers/patient_healthcare_party.dart';
import 'mappers/person_name.dart';
import 'mappers/property.dart';
import 'mappers/property_type.dart';
import 'mappers/service_data_sample.dart';
import 'mappers/time_series.dart';
import 'mappers/typed_value_object.dart';
import 'mappers/user.dart';
export 'package:icure_dart_sdk/crypto/crypto.dart';

part 'medtech_api.dart';

part 'api_client.dart';
part 'api_helper.dart';
part 'api_exception.dart';
part 'auth/authentication.dart';
part 'auth/api_key_auth.dart';
part 'auth/oauth.dart';
part 'auth/http_basic_auth.dart';
part 'auth/http_bearer_auth.dart';

part 'api/coding_api.dart';
part 'api/data_sample_api.dart';
part 'api/healthcare_element_api.dart';
part 'api/healthcare_professional_api.dart';
part 'api/medical_device_api.dart';
part 'api/patient_api.dart';
part 'api/user_api.dart';

part 'api/impl/coding_api_impl.dart';
part 'api/impl/data_sample_api_impl.dart';
part 'api/impl/healthcare_element_api_impl.dart';
part 'api/impl/healthcare_professional_api_impl.dart';
part 'api/impl/medical_device_api_impl.dart';
part 'api/impl/patient_api_impl.dart';
part 'api/impl/user_api_impl.dart';


part 'model/address.dart';
part 'model/authentication_token.dart';
part 'model/coding.dart';
part 'model/coding_reference.dart';
part 'model/content.dart';
part 'model/data_sample.dart';
part 'model/delegation.dart';
part 'model/document.dart';
part 'model/healthcare_element.dart';
part 'model/healthcare_professional.dart';
part 'model/identifier.dart';
part 'model/inline_response403.dart';
part 'model/measure.dart';
part 'model/medical_device.dart';
part 'model/paginated_document_key_and_id_pair_object.dart';
part 'model/paginated_list_coding.dart';
part 'model/paginated_list_data_sample.dart';
part 'model/paginated_list_healthcare_element.dart';
part 'model/paginated_list_healthcare_professional.dart';
part 'model/paginated_list_medical_device.dart';
part 'model/paginated_list_patient.dart';
part 'model/paginated_list_user.dart';
part 'model/partnership.dart';
part 'model/patient.dart';
part 'model/patient_health_care_party.dart';
part 'model/person_name.dart';
part 'model/property.dart';
part 'model/property_type.dart';
part 'model/system_meta_data_encrypted.dart';
part 'model/system_meta_data_owner.dart';
part 'model/system_meta_data_owner_encrypted.dart';
part 'model/telecom.dart';
part 'model/time_series.dart';
part 'model/typed_value_object.dart';
part 'model/user.dart';
part 'filter/coding/all_codings_filter.dart';
part 'filter/coding/coding_by_ids_filter.dart';
part 'filter/coding/coding_by_region_type_label_language_filter.dart';
part 'filter/datasample/data_sample_by_hc_party_filter.dart';
part 'filter/datasample/data_sample_by_hc_party_identifiers_filter.dart';
part 'filter/datasample/data_sample_by_hc_party_tag_code_date_filter.dart';
part 'filter/datasample/data_sample_by_ids_filter.dart';
part 'filter/datasample/data_sample_by_secret_foreign_keys.dart';
part 'filter/hcp/all_healthcare_professionals_filter.dart';
part 'filter/hcp/healthcare_professional_by_ids_filter.dart';
part 'filter/healthcareelement/healthcare_element_by_hc_party_filter.dart';
part 'filter/healthcareelement/healthcare_element_by_hc_party_identifiers_filter.dart';
part 'filter/healthcareelement/healthcare_element_by_hc_party_patient_filter.dart';
part 'filter/healthcareelement/healthcare_element_by_hc_party_tag_code_filter.dart';
part 'filter/healthcareelement/healthcare_element_by_ids_filter.dart';
part 'filter/medicaldevice/all_medical_devices_filter.dart';
part 'filter/medicaldevice/medical_device_by_ids_filter.dart';
part 'filter/patient/patient_by_hc_party_and_identifiers_filter.dart';
part 'filter/patient/patient_by_hc_party_and_ssins_filter.dart';
part 'filter/patient/patient_by_hc_party_date_of_birth_between_filter.dart';
part 'filter/patient/patient_by_hc_party_filter.dart';
part 'filter/patient/patient_by_hc_party_gender_education_profession.dart';
part 'filter/patient/patient_by_hc_party_name_contains_fuzzy_filter.dart';
part 'filter/patient/patient_by_ids_filter.dart';
part 'filter/user/all_users_filter.dart';
part 'filter/user/user_by_ids_filter.dart';
part 'filter/complement_filter.dart';
part 'filter/filter.dart';
part 'filter/intersection_filter.dart';
part 'filter/union_filter.dart';

part 'filter/filter_dsl.dart';

const _delimiters = {'csv': ',', 'ssv': ' ', 'tsv': '\t', 'pipes': '|'};
const _dateEpochMarker = 'epoch';
final _dateFormatter = DateFormat('yyyy-MM-dd');
final _regList = RegExp(r'^List<(.*)>$');
final _regSet = RegExp(r'^Set<(.*)>$');
final _regMap = RegExp(r'^Map<String,(.*)>$');

ApiClient defaultApiClient = ApiClient();
