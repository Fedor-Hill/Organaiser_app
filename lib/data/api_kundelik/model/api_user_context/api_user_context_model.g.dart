// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_user_context_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ApiUserContextModel _$ApiUserContextModelFromJson(Map<String, dynamic> json) =>
    ApiUserContextModel(
      userId: json['userId'] as int,
      personId: json['personId'] as int,
      firstName: json['firstName'] as String,
      lastName: json['lastName'] as String,
      middleName: json['middleName'] as String,
      avatarUrl: json['avatarUrl'] as String,
      schools: (json['schools'] as List<dynamic>)
          .map((e) => ApiSchoolDetails.fromJson(e as Map<String, dynamic>))
          .toList(),
      eduGroups: (json['eduGroups'] as List<dynamic>)
          .map((e) => ApiEduGroupsDetails.fromJson(e as Map<String, dynamic>))
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
      'avatarUrl': instance.avatarUrl,
      'schools': instance.schools,
      'eduGroups': instance.eduGroups,
    };
