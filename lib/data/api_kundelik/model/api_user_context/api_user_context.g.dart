// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_user_context.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ApiUserContextModel _$ApiUserContextModelFromJson(Map<String, dynamic> json) =>
    ApiUserContextModel(
      userId: json['userId'] as int,
      personId: json['personId'] as int,
      firstName: json['firstName'] as String,
      lastName: json['lastName'] as String,
      middleName: json['middleName'] as String?,
      shortName: json['shortName'] as String,
      avatarUrl: json['avatarUrl'] as String,
      schools: (json['schools'] as List<dynamic>)
          .map((e) => ApiSchoolDetails.fromJson(e as Map<String, dynamic>))
          .toList(),
      eduGroups: (json['eduGroups'] as List<dynamic>)
          .map((e) => ApiEduGroup.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ApiUserContextModelToJson(
        ApiUserContextModel instance) =>
    <String, dynamic>{
      'userId': instance.userId,
      'personId': instance.personId,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'middleName': instance.middleName,
      'shortName': instance.shortName,
      'avatarUrl': instance.avatarUrl,
      'schools': instance.schools,
      'eduGroups': instance.eduGroups,
    };

ApiEduGroup _$ApiEduGroupFromJson(Map<String, dynamic> json) => ApiEduGroup(
      id: json['id'] as int,
      parallel: json['parallel'] as int,
      timetable: json['timetable'] as int?,
      studyyear: json['studyyear'] as int,
      type: json['type'] as String,
      status: json['status'] as String,
      name: json['name'] as String,
    );

Map<String, dynamic> _$ApiEduGroupToJson(ApiEduGroup instance) =>
    <String, dynamic>{
      'id': instance.id,
      'parallel': instance.parallel,
      'timetable': instance.timetable,
      'studyyear': instance.studyyear,
      'type': instance.type,
      'status': instance.status,
      'name': instance.name,
    };

ApiSchoolDetails _$ApiSchoolDetailsFromJson(Map<String, dynamic> json) =>
    ApiSchoolDetails(
      id: json['id'] as int,
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
