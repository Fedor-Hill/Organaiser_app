// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'marks.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Marks _$MarksFromJson(Map<String, dynamic> json) => Marks(
      id: json['id'] as int,
      person: json['person'] as int,
      work: json['work'] as int,
      lesson: json['lesson'] as int,
      number: json['number'] as int,
      workType: json['workType'] as int,
      type: json['type'] as String,
      value: json['value'] as String,
      textValue: json['textValue'] as String,
      mood: json['mood'] as String,
      date: DateTime.parse(json['date'] as String),
    );

Map<String, dynamic> _$MarksToJson(Marks instance) => <String, dynamic>{
      'id': instance.id,
      'person': instance.person,
      'work': instance.work,
      'lesson': instance.lesson,
      'number': instance.number,
      'workType': instance.workType,
      'type': instance.type,
      'value': instance.value,
      'textValue': instance.textValue,
      'mood': instance.mood,
      'date': instance.date.toIso8601String(),
    };
