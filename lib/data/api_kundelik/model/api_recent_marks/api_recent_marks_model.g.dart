// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_recent_marks_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ApiRecentMarksModel _$ApiRecentMarksModelFromJson(Map<String, dynamic> json) =>
    ApiRecentMarksModel(
      marks: (json['marks'] as List<dynamic>)
          .map((e) => Marks.fromJson(e as Map<String, dynamic>))
          .toList(),
      subject: (json['subjects'] as List<dynamic>)
          .map((e) => Subject.fromJson(e as Map<String, dynamic>))
          .toList(),
      lessons: (json['lessons'] as List<dynamic>)
          .map((e) => Lesson.fromJson(e as Map<String, dynamic>))
          .toList(),
      criteriabasedmarks: (json['criteriabasedmarks'] as List<dynamic>)
          .map((e) => CriteriaBasedMark.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ApiRecentMarksModelToJson(
        ApiRecentMarksModel instance) =>
    <String, dynamic>{
      'marks': instance.marks,
      'subjects': instance.subject,
      'lessons': instance.lessons,
      'criteriabasedmarks': instance.criteriabasedmarks,
    };
