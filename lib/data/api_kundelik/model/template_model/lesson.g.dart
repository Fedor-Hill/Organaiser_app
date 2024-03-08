// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'lesson.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Lesson _$LessonFromJson(Map<String, dynamic> json) => Lesson(
      id: json['id'] as int,
      subjectId: json['subjectId'] as int,
      number: json['number'] as int,
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
