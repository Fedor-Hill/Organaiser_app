// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_homework_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ApiHomeWorkModel _$ApiHomeWorkModelFromJson(Map<String, dynamic> json) =>
    ApiHomeWorkModel(
      works: (json['works'] as List<dynamic>)
          .map((e) =>
              ApiHomeWorkDetailsModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ApiHomeWorkModelToJson(ApiHomeWorkModel instance) =>
    <String, dynamic>{
      'works': instance.works,
    };

ApiHomeWorkDetailsModel _$ApiHomeWorkDetailsModelFromJson(
        Map<String, dynamic> json) =>
    ApiHomeWorkDetailsModel(
      text: json['text'] as String,
      lesson: (json['lesson'] as num).toInt(),
      id: (json['id'] as num).toInt(),
    );

Map<String, dynamic> _$ApiHomeWorkDetailsModelToJson(
        ApiHomeWorkDetailsModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'lesson': instance.lesson,
      'text': instance.text,
    };
