// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'school_details.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ApiSchoolDetails _$ApiSchoolDetailsFromJson(Map<String, dynamic> json) =>
    ApiSchoolDetails(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      type: json['type'] as String,
      groupIds: json['groupIds'] as List<dynamic>,
    );

Map<String, dynamic> _$ApiSchoolDetailsToJson(ApiSchoolDetails instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'type': instance.type,
      'groupIds': instance.groupIds,
    };
