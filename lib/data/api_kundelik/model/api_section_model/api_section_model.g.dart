// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_section_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ApiSectionModel _$ApiSectionModelFromJson(Map<String, dynamic> json) =>
    ApiSectionModel(
      id: json['id'] as int,
      part: json['part'] as int,
      maxValue: json['maxvalue'] as int,
      subject: ApiSubject.fromJson(json['subject'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ApiSectionModelToJson(ApiSectionModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'part': instance.part,
      'maxvalue': instance.maxValue,
      'subject': instance.subject,
    };
