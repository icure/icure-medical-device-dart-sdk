//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;


abstract class CodingApi {
  CodingApi([ApiClient? apiClient]) : apiClient = apiClient ?? defaultApiClient;

  final ApiClient apiClient;

  /// Create or update a [Coding]
  ///
  /// When modifying a coding, you must ensure that the rev obtained when getting or creating the coding is present as the rev is used to guarantee that the coding has not been modified by a third party.
  ///
  /// Parameters:
  ///
  /// * [Coding] coding (required):
  Future<Coding?> createOrModifyCoding(Coding coding,);

  /// Create or update a batch of [Coding]
  ///
  /// When modifying codings, you must ensure that the rev obtained when getting or creating the coding is present as the rev is used to guarantee that the coding has not been modified by a third party.
  ///
  /// Parameters:
  ///
  /// * [List<Coding>] coding (required):
  Future<List<Coding>?> createOrModifyCodings(List<Coding> coding,);

  /// Load codings from the database by filtering them using the provided [filter].
  ///
  /// Filters are complex selectors that are built by combining basic building blocks. Examples of filters available for [Coding] are AllCodingsFilter and CodingsByIdsFilter. This method returns a paginated list of coding (with a cursor that lets you query the following items).
  ///
  /// Parameters:
  ///
  /// * [Filter] filter (required):
  ///   The Filter object that describes which condition(s) the elements whose the ids should be returned must fulfill
  ///
  /// * [String] nextCodingId:
  ///   The id of the first coding in the next page
  ///
  /// * [int] limit:
  ///   The number of codings to return in the queried page
  Future<PaginatedListCoding?> filterCoding(Filter filter, { String? nextCodingId, int? limit, });

  /// Get a [Coding]
  ///
  /// Each coding is uniquely identified by a coding id. The coding id is a UUID. This [codingId] is the preferred method to retrieve one specific coding.
  ///
  /// Parameters:
  ///
  /// * [String] codingId (required):
  Future<Coding?> getCoding(String codingId,);

  /// Load coding ids from the database by filtering them using the provided [filter].
  ///
  /// Filters are complex selectors that are built by combining basic building blocks. Examples of filters available for [Coding] are AllCodingsFilter and CodingsByIdsFilter. This method returns a paginated list of coding (with a cursor that lets you query the following items).
  ///
  /// Parameters:
  ///
  /// * [Filter] filter (required):
  ///   The Filter object that describes which condition(s) the elements whose the ids should be returned must fulfill
  Future<List<String>?> matchCoding(Filter filter,);
}
