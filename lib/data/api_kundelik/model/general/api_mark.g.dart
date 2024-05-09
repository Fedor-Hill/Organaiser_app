// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_mark.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ApiMark _$ApiMarkFromJson(Map<String, dynamic> json) => ApiMark(
      id: json['id'] as int,
      person: json['person'] as int,
      lesson: json['lesson'] as int,
      value: json['value'] as String,
      mood: json['mood'] as String,
      date: DateTime.parse(json['date'] as String),
    );

Map<String, dynamic> _$ApiMarkToJson(ApiMark instance) => <String, dynamic>{
      'id': instance.id,
      'person': instance.person,
      'lesson': instance.lesson,
      'value': instance.value,
      'mood': instance.mood,
      'date': instance.date.toIso8601String(),
    };
