// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_lessons_list_id_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ApiLessonsListIdModel _$ApiLessonsListIdModelFromJson(
        Map<String, dynamic> json) =>
    ApiLessonsListIdModel(
      id: json['id'] as int,
      idStr: json['id_str'] as String,
      title: json['title'] as String,
      subject: Subject.fromJson(json['subject'] as Map<String, dynamic>),
      date: DateTime.parse(json['date'] as String),
    );

Map<String, dynamic> _$ApiLessonsListIdModelToJson(
        ApiLessonsListIdModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'subject': instance.subject,
      'date': instance.date.toIso8601String(),
      'id_str': instance.idStr,
    };
