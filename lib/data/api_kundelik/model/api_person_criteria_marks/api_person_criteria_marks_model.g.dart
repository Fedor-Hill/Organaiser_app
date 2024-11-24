// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_person_criteria_marks_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ApiCriteriaMarks _$ApiCriteriaMarksFromJson(Map<String, dynamic> json) =>
    ApiCriteriaMarks(
      subjectId: (json['subject'] as num).toInt(),
      apiPersonMarks: (json['personmarks'] as List<dynamic>)
          .map((e) => ApiPersonMarks.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ApiCriteriaMarksToJson(ApiCriteriaMarks instance) =>
    <String, dynamic>{
      'subject': instance.subjectId,
      'personmarks': instance.apiPersonMarks,
    };

ApiPersonMarks _$ApiPersonMarksFromJson(Map<String, dynamic> json) =>
    ApiPersonMarks(
      person: (json['person'] as num).toInt(),
      apiCrMarks: (json['criteriamarks'] as List<dynamic>)
          .map((e) => ApiCrMarks.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ApiPersonMarksToJson(ApiPersonMarks instance) =>
    <String, dynamic>{
      'person': instance.person,
      'criteriamarks': instance.apiCrMarks,
    };

ApiCrMarks _$ApiCrMarksFromJson(Map<String, dynamic> json) => ApiCrMarks(
      id: (json['id'] as num).toInt(),
      section: (json['section'] as num).toInt(),
      value: (json['value'] as num).toInt(),
      date: DateTime.parse(json['date'] as String),
    );

Map<String, dynamic> _$ApiCrMarksToJson(ApiCrMarks instance) =>
    <String, dynamic>{
      'id': instance.id,
      'section': instance.section,
      'value': instance.value,
      'date': instance.date.toIso8601String(),
    };
