// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'lesson.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Lesson _$LessonFromJson(Map<String, dynamic> json) => Lesson(
      id: (json['id'] as num).toInt(),
      subjectId: (json['subjectId'] as num).toInt(),
      number: (json['number'] as num).toInt(),
      title: json['title'] as String,
      hours: json['hours'] as String,
    );

Map<String, dynamic> _$LessonToJson(Lesson instance) => <String, dynamic>{
      'id': instance.id,
      'subjectId': instance.subjectId,
      'number': instance.number,
      'title': instance.title,
      'hours': instance.hours,
    };
