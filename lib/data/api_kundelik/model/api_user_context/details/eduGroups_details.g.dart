// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'eduGroups_details.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ApiEduGroupsDetails _$ApiEduGroupsDetailsFromJson(Map<String, dynamic> json) =>
    ApiEduGroupsDetails(
      id: json['id'] as int,
      parallel: json['parallel'] as int,
      timetable: json['timetable'] as int?,
      studyyear: json['studyyear'] as int,
      type: json['type'] as String,
      name: json['name'] as String,
    );

Map<String, dynamic> _$ApiEduGroupsDetailsToJson(
        ApiEduGroupsDetails instance) =>
    <String, dynamic>{
      'id': instance.id,
      'parallel': instance.parallel,
      'timetable': instance.timetable,
      'studyyear': instance.studyyear,
      'type': instance.type,
      'name': instance.name,
    };
