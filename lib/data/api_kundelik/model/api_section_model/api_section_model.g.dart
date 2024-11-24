// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_section_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ApiSectionModel _$ApiSectionModelFromJson(Map<String, dynamic> json) =>
    ApiSectionModel(
      id: (json['id'] as num).toInt(),
      part: (json['part'] as num).toInt(),
      maxValue: (json['maxvalue'] as num).toInt(),
      subject: ApiSubject.fromJson(json['subject'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ApiSectionModelToJson(ApiSectionModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'part': instance.part,
      'maxvalue': instance.maxValue,
      'subject': instance.subject,
    };
