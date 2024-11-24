// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'criteriabasedmarks.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CriteriaBasedMark _$CriteriaBasedMarkFromJson(Map<String, dynamic> json) =>
    CriteriaBasedMark(
      id: (json['id'] as num).toInt(),
      value: (json['value'] as num).toInt(),
      section: (json['section'] as num).toInt(),
      date: DateTime.parse(json['date'] as String),
    );

Map<String, dynamic> _$CriteriaBasedMarkToJson(CriteriaBasedMark instance) =>
    <String, dynamic>{
      'id': instance.id,
      'value': instance.value,
      'section': instance.section,
      'date': instance.date.toIso8601String(),
    };
