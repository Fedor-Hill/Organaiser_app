// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_shedule_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ApiSheduleModel _$ApiSheduleModelFromJson(Map<String, dynamic> json) =>
    ApiSheduleModel(
      apiDayModel: (json['days'] as List<dynamic>)
          .map((e) => ApiDayModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ApiSheduleModelToJson(ApiSheduleModel instance) =>
    <String, dynamic>{
      'days': instance.apiDayModel,
    };

ApiDayModel _$ApiDayModelFromJson(Map<String, dynamic> json) => ApiDayModel(
      date: DateTime.parse(json['date'] as String),
      nextDate: json['nextDate'] == null
          ? null
          : DateTime.parse(json['nextDate'] as String),
      marks: (json['marks'] as List<dynamic>)
          .map((e) => ApiMark.fromJson(e as Map<String, dynamic>))
          .toList(),
      subjects: (json['subjects'] as List<dynamic>)
          .map((e) => ApiSubject.fromJson(e as Map<String, dynamic>))
          .toList(),
      lessons: (json['lessons'] as List<dynamic>)
          .map((e) => ApiLessonGeneral.fromJson(e as Map<String, dynamic>))
          .toList(),
      homeworks: (json['homeworks'] as List<dynamic>)
          .map((e) => ApiHomeWorkGeneral.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ApiDayModelToJson(ApiDayModel instance) =>
    <String, dynamic>{
      'date': instance.date.toIso8601String(),
      'nextDate': instance.nextDate?.toIso8601String(),
      'marks': instance.marks,
      'subjects': instance.subjects,
      'lessons': instance.lessons,
      'homeworks': instance.homeworks,
    };
