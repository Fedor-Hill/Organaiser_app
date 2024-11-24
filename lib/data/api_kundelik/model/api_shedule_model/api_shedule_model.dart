import 'package:json_annotation/json_annotation.dart';

import 'package:organaiser/data/api_kundelik/model/general/api_lesson.dart';
import 'package:organaiser/data/api_kundelik/model/general/api_homework.dart';
import 'package:organaiser/data/api_kundelik/model/general/api_mark.dart';
import 'package:organaiser/data/api_kundelik/model/general/api_subject.dart';

part 'api_shedule_model.g.dart';

@JsonSerializable()
class ApiSheduleModel {
  ApiSheduleModel({
    required this.apiDayModel,
  });

  @JsonKey(name: "days")
  final List<ApiDayModel> apiDayModel;
  factory ApiSheduleModel.fromJson(Map<String, dynamic> json) =>
      _$ApiSheduleModelFromJson(json);
}

@JsonSerializable()
class ApiDayModel {
  ApiDayModel(
      {required this.date,
      required this.nextDate,
      required this.marks,
      required this.subjects,
      required this.lessons,
      required this.homeworks});

  final DateTime date;
  final DateTime? nextDate;
  final List<ApiMark> marks;
  @JsonKey(name: "subjects")
  final List<ApiSubject> subjects;
  @JsonKey(name: "lessons")
  final List<ApiLessonGeneral> lessons;
  @JsonKey(name: "homeworks")
  final List<ApiHomeWorkGeneral> homeworks;

  factory ApiDayModel.fromJson(Map<String, dynamic> json) =>
      _$ApiDayModelFromJson(json);
}
