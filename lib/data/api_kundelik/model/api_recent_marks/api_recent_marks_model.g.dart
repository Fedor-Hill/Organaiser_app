// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_recent_marks_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ApiRecentMarks _$ApiRecentMarksFromJson(Map<String, dynamic> json) =>
    ApiRecentMarks(
      marks: (json['marks'] as List<dynamic>)
          .map((e) => ApiMark.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ApiRecentMarksToJson(ApiRecentMarks instance) =>
    <String, dynamic>{
      'marks': instance.marks,
    };
