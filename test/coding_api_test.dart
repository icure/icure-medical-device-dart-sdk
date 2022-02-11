//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

import 'package:openapi/api.dart';
import 'package:test/test.dart';


/// tests for CodingApi
void main() {
  // final instance = CodingApi();

  group('tests for CodingApi', () {
    // Create or update a [Coding]
    //
    // When modifying a coding, you must ensure that the rev obtained when getting or creating the coding is present as the rev is used to guarantee that the coding has not been modified by a third party.
    //
    //Future<Coding> createOrModifyCoding(Coding coding) async
    test('test createOrModifyCoding', () async {
      // TODO
    });

    // Create or update a batch of [Coding]
    //
    // When modifying codings, you must ensure that the rev obtained when getting or creating the coding is present as the rev is used to guarantee that the coding has not been modified by a third party.
    //
    //Future<List<Coding>> createOrModifyCodings(List<Coding> coding) async
    test('test createOrModifyCodings', () async {
      // TODO
    });

    // Load codings from the database by filtering them using the provided [filter].
    //
    // Filters are complex selectors that are built by combining basic building blocks. Examples of filters available for [Coding] are AllCodingsFilter and CodingsByIdsFilter. This method returns a paginated list of coding (with a cursor that lets you query the following items).
    //
    //Future<PaginatedListCoding> filterCoding(Filter filter, { String nextCodingId, int limit }) async
    test('test filterCoding', () async {
      // TODO
    });

    // Get a [Coding]
    //
    // Each coding is uniquely identified by a coding id. The coding id is a UUID. This [codingId] is the preferred method to retrieve one specific coding.
    //
    //Future<Coding> getCoding(String codingId) async
    test('test getCoding', () async {
      // TODO
    });

    // Load coding ids from the database by filtering them using the provided [filter].
    //
    // Filters are complex selectors that are built by combining basic building blocks. Examples of filters available for [Coding] are AllCodingsFilter and CodingsByIdsFilter. This method returns a paginated list of coding (with a cursor that lets you query the following items).
    //
    //Future<List<String>> matchCoding(Filter filter) async
    test('test matchCoding', () async {
      // TODO
    });

  });
}
