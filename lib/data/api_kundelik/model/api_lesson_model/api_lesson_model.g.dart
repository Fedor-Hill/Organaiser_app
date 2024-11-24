// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_lesson_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ApiLesson _$ApiLessonFromJson(Map<String, dynamic> json) => ApiLesson(
      ApiSubject.fromJson(json['subject'] as Map<String, dynamic>),
      id: (json['id'] as num).toInt(),
      title: json['title'] as String,
      date: DateTime.parse(json['date'] as String),
    );

Map<String, dynamic> _$ApiLessonToJson(ApiLesson instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'subject': instance.subject,
      'date': instance.date.toIso8601String(),
    };
