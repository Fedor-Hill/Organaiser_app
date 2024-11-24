// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_subject.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ApiSubject _$ApiSubjectFromJson(Map<String, dynamic> json) => ApiSubject(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
    );

Map<String, dynamic> _$ApiSubjectToJson(ApiSubject instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
    };
