// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_person_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ApiPersonModel _$ApiPersonModelFromJson(Map<String, dynamic> json) =>
    ApiPersonModel(
      userId: (json['userId'] as num).toInt(),
      firstName: json['firstName'] as String,
      lastName: json['lastName'] as String,
      middleName: json['middleName'] as String,
      shortName: json['shortName'] as String,
      sex: json['sex'] as String,
    );

Map<String, dynamic> _$ApiPersonModelToJson(ApiPersonModel instance) =>
    <String, dynamic>{
      'userId': instance.userId,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'middleName': instance.middleName,
      'shortName': instance.shortName,
      'sex': instance.sex,
    };
