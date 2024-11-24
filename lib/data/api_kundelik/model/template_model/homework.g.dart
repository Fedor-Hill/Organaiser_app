// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'homework.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HomeWork _$HomeWorkFromJson(Map<String, dynamic> json) => HomeWork(
      id: (json['id'] as num).toInt(),
      lesson: (json['lesson'] as num).toInt(),
      text: json['text'] as String,
    );

Map<String, dynamic> _$HomeWorkToJson(HomeWork instance) => <String, dynamic>{
      'id': instance.id,
      'lesson': instance.lesson,
      'text': instance.text,
    };
