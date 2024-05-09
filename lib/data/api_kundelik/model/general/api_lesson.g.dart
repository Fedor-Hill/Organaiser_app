// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_lesson.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ApiLessonGeneral _$ApiLessonGeneralFromJson(Map<String, dynamic> json) =>
    ApiLessonGeneral(
      id: json['id'] as int,
      subjectId: json['subjectId'] as int,
      number: json['number'] as int,
      title: json['title'] as String,
      hours: json['hours'] as String,
    );

Map<String, dynamic> _$ApiLessonGeneralToJson(ApiLessonGeneral instance) =>
    <String, dynamic>{
      'id': instance.id,
      'subjectId': instance.subjectId,
      'number': instance.number,
      'title': instance.title,
      'hours': instance.hours,
    };
