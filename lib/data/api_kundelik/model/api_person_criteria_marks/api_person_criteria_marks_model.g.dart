// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_person_criteria_marks_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ApiCriteriaMarks _$ApiCriteriaMarksFromJson(Map<String, dynamic> json) =>
    ApiCriteriaMarks(
      subjectId: json['subject'] as int,
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
      person: json['person'] as int,
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
      id: json['id'] as int,
      section: json['section'] as int,
      value: json['value'] as int,
      date: DateTime.parse(json['date'] as String),
    );

Map<String, dynamic> _$ApiCrMarksToJson(ApiCrMarks instance) =>
    <String, dynamic>{
      'id': instance.id,
      'section': instance.section,
      'value': instance.value,
      'date': instance.date.toIso8601String(),
    };
