// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'children_details.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ApiChildrenDetails _$ApiChildrenDetailsFromJson(Map<String, dynamic> json) =>
    ApiChildrenDetails(
      personId: (json['personId'] as num).toInt(),
      firstName: json['firstName'] as String,
      lastName: json['lastName'] as String,
      middleName: json['middleName'] as String,
      shortName: json['shortName'] as String,
      schoolIds: json['schoolIds'] as List<dynamic>,
      groupIds: json['groupIds'] as List<dynamic>,
    );

Map<String, dynamic> _$ApiChildrenDetailsToJson(ApiChildrenDetails instance) =>
    <String, dynamic>{
      'personId': instance.personId,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'middleName': instance.middleName,
      'shortName': instance.shortName,
      'schoolIds': instance.schoolIds,
      'groupIds': instance.groupIds,
    };
