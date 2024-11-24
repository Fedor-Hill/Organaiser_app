import 'package:json_annotation/json_annotation.dart';

part 'api_reporting_periods_model.g.dart';

@JsonSerializable()
class ApiReportingPeriods {
  ApiReportingPeriods(
      {
      required this.name,
      required this.id,
      required this.number,
      required this.year,
      required this.start,
      required this.finish});

  final String name;
  final int id, number, year;

  final DateTime start, finish;

  factory ApiReportingPeriods.fromJson(Map<String, dynamic> json) =>
      _$ApiReportingPeriodsFromJson(json);
}
