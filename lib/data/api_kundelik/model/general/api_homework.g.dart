// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_homework.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ApiHomeWorkGeneral _$ApiHomeWorkGeneralFromJson(Map<String, dynamic> json) =>
    ApiHomeWorkGeneral(
      id: (json['id'] as num).toInt(),
      lesson: (json['lesson'] as num).toInt(),
      text: json['text'] as String,
    );

Map<String, dynamic> _$ApiHomeWorkGeneralToJson(ApiHomeWorkGeneral instance) =>
    <String, dynamic>{
      'id': instance.id,
      'lesson': instance.lesson,
      'text': instance.text,
    };
