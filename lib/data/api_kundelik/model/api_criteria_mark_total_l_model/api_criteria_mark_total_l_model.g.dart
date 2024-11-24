// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_criteria_mark_total_l_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ApiFinalMarksModel _$ApiFinalMarksModelFromJson(Map<String, dynamic> json) =>
    ApiFinalMarksModel(
      subjectName: json['SubjectName'] as String,
      subjectId: (json['SubjectId'] as num).toInt(),
      finalMarksDetail: (json['FinalMarks'] as List<dynamic>)
          .map((e) => FinalMarksDetail.fromJson(e as Map<String, dynamic>))
          .toList(),
      summaries: (json['Summaries'] as List<dynamic>)
          .map((e) => Summaries.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ApiFinalMarksModelToJson(ApiFinalMarksModel instance) =>
    <String, dynamic>{
      'SubjectName': instance.subjectName,
      'SubjectId': instance.subjectId,
      'FinalMarks': instance.finalMarksDetail,
      'Summaries': instance.summaries,
    };

FinalMarksDetail _$FinalMarksDetailFromJson(Map<String, dynamic> json) =>
    FinalMarksDetail(
      personFinalMarks: (json['FinalMarks'] as List<dynamic>)
          .map((e) => PersonFinalMarks.fromJson(e as Map<String, dynamic>))
          .toList(),
      period: Period.fromJson(json['Period'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$FinalMarksDetailToJson(FinalMarksDetail instance) =>
    <String, dynamic>{
      'Period': instance.period,
      'FinalMarks': instance.personFinalMarks,
    };

Summaries _$SummariesFromJson(Map<String, dynamic> json) => Summaries(
      student: Student.fromJson(json['Student'] as Map<String, dynamic>),
      mark: json['TotalMark'] == null
          ? null
          : Mark.fromJson(json['TotalMark'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$SummariesToJson(Summaries instance) => <String, dynamic>{
      'Student': instance.student,
      'TotalMark': instance.mark,
    };

Period _$PeriodFromJson(Map<String, dynamic> json) => Period(
      periodNumber:
          PeriodNumber.fromJson(json['PeriodNumber'] as Map<String, dynamic>),
      dateFinish: DateTime.parse(json['DateFinish'] as String),
      dateStart: DateTime.parse(json['DateStart'] as String),
      id: (json['Id'] as num).toInt(),
    );

Map<String, dynamic> _$PeriodToJson(Period instance) => <String, dynamic>{
      'Id': instance.id,
      'PeriodNumber': instance.periodNumber,
      'DateStart': instance.dateStart.toIso8601String(),
      'DateFinish': instance.dateFinish.toIso8601String(),
    };

PeriodNumber _$PeriodNumberFromJson(Map<String, dynamic> json) => PeriodNumber(
      rawNumber: (json['RawNumber'] as num).toInt(),
    );

Map<String, dynamic> _$PeriodNumberToJson(PeriodNumber instance) =>
    <String, dynamic>{
      'RawNumber': instance.rawNumber,
    };

PersonFinalMarks _$PersonFinalMarksFromJson(Map<String, dynamic> json) =>
    PersonFinalMarks(
      mark: json['Mark'] == null
          ? null
          : Mark.fromJson(json['Mark'] as Map<String, dynamic>),
      student: Student.fromJson(json['Student'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$PersonFinalMarksToJson(PersonFinalMarks instance) =>
    <String, dynamic>{
      'Student': instance.student,
      'Mark': instance.mark,
    };

Student _$StudentFromJson(Map<String, dynamic> json) => Student(
      personName:
          PersonName.fromJson(json['PersonName'] as Map<String, dynamic>),
      personId: (json['PersonId'] as num).toInt(),
    );

Map<String, dynamic> _$StudentToJson(Student instance) => <String, dynamic>{
      'PersonId': instance.personId,
      'PersonName': instance.personName,
    };

PersonName _$PersonNameFromJson(Map<String, dynamic> json) => PersonName(
      firstName: json['FirstName'] as String,
      lastName: json['LastName'] as String,
      middleName: json['MiddleName'] as String?,
    );

Map<String, dynamic> _$PersonNameToJson(PersonName instance) =>
    <String, dynamic>{
      'LastName': instance.lastName,
      'FirstName': instance.firstName,
      'MiddleName': instance.middleName,
    };

Mark _$MarkFromJson(Map<String, dynamic> json) => Mark(
      value: (json['Value'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$MarkToJson(Mark instance) => <String, dynamic>{
      'Value': instance.value,
    };
