// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_reporting_periods_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ApiReportingPeriods _$ApiReportingPeriodsFromJson(Map<String, dynamic> json) =>
    ApiReportingPeriods(
      name: json['name'] as String,
      id: (json['id'] as num).toInt(),
      number: (json['number'] as num).toInt(),
      year: (json['year'] as num).toInt(),
      start: DateTime.parse(json['start'] as String),
      finish: DateTime.parse(json['finish'] as String),
    );

Map<String, dynamic> _$ApiReportingPeriodsToJson(
        ApiReportingPeriods instance) =>
    <String, dynamic>{
      'name': instance.name,
      'id': instance.id,
      'number': instance.number,
      'year': instance.year,
      'start': instance.start.toIso8601String(),
      'finish': instance.finish.toIso8601String(),
    };
