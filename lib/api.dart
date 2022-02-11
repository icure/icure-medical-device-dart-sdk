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
import 'package:intl/intl.dart';
import 'package:meta/meta.dart';

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

part 'model/address.dart';
part 'model/authentication_token.dart';
part 'model/coding.dart';
part 'model/coding_reference.dart';
part 'model/content.dart';
part 'model/data_sample.dart';
part 'model/delegation.dart';
part 'model/document.dart';
part 'model/filter.dart';
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


const _delimiters = {'csv': ',', 'ssv': ' ', 'tsv': '\t', 'pipes': '|'};
const _dateEpochMarker = 'epoch';
final _dateFormatter = DateFormat('yyyy-MM-dd');
final _regList = RegExp(r'^List<(.*)>$');
final _regSet = RegExp(r'^Set<(.*)>$');
final _regMap = RegExp(r'^Map<String,(.*)>$');

ApiClient defaultApiClient = ApiClient();
