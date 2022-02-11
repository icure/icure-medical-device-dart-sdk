//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of icure_medical_device_dart_sdk.api;

class TimeSeries {
  /// Returns a new [TimeSeries] instance.
  TimeSeries({
    this.fields = const [],
    this.samples = const [],
    this.min = const [],
    this.max = const [],
    this.mean = const [],
    this.median = const [],
    this.variance = const [],
  });

  List<String> fields;

  List<List<double>> samples;

  List<double> min;

  List<double> max;

  List<double> mean;

  List<double> median;

  List<double> variance;

  @override
  bool operator ==(Object other) => identical(this, other) || other is TimeSeries &&
     other.fields == fields &&
     other.samples == samples &&
     other.min == min &&
     other.max == max &&
     other.mean == mean &&
     other.median == median &&
     other.variance == variance;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (fields.hashCode) +
    (samples.hashCode) +
    (min.hashCode) +
    (max.hashCode) +
    (mean.hashCode) +
    (median.hashCode) +
    (variance.hashCode);

  @override
  String toString() => 'TimeSeries[fields=$fields, samples=$samples, min=$min, max=$max, mean=$mean, median=$median, variance=$variance]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
      json[r'fields'] = fields;
      json[r'samples'] = samples;
      json[r'min'] = min;
      json[r'max'] = max;
      json[r'mean'] = mean;
      json[r'median'] = median;
      json[r'variance'] = variance;
    return json;
  }

  /// Returns a new [TimeSeries] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static TimeSeries? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "TimeSeries[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "TimeSeries[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return TimeSeries(
        fields: json[r'fields'] is List
            ? (json[r'fields'] as List).cast<String>()
            : const [],
        samples: json[r'samples'] is List
          ? (json[r'samples'] as List).map(
              (e) => e == null ? const <double>[] : (e as List).cast<double>()
            ).toList()
          : const <List<double>>[],
        min: json[r'min'] is List
            ? (json[r'min'] as List).cast<double>()
            : const [],
        max: json[r'max'] is List
            ? (json[r'max'] as List).cast<double>()
            : const [],
        mean: json[r'mean'] is List
            ? (json[r'mean'] as List).cast<double>()
            : const [],
        median: json[r'median'] is List
            ? (json[r'median'] as List).cast<double>()
            : const [],
        variance: json[r'variance'] is List
            ? (json[r'variance'] as List).cast<double>()
            : const [],
      );
    }
    return null;
  }

  static List<TimeSeries>? listFromJson(dynamic json, {bool growable = false,}) {
    final result = <TimeSeries>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = TimeSeries.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, TimeSeries> mapFromJson(dynamic json) {
    final map = <String, TimeSeries>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = TimeSeries.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of TimeSeries-objects as value to a dart map
  static Map<String, List<TimeSeries>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<TimeSeries>>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = TimeSeries.listFromJson(entry.value, growable: growable,);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'fields',
    'samples',
    'min',
    'max',
    'mean',
    'median',
    'variance',
  };
}

