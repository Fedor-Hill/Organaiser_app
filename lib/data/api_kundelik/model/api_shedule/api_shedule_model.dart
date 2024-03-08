import 'package:json_annotation/json_annotation.dart';

import 'package:organaiser/data/api_kundelik/model/template_model/lesson.dart';
import 'package:organaiser/data/api_kundelik/model/template_model/marks.dart';
import 'package:organaiser/data/api_kundelik/model/template_model/subject.dart';
import 'package:organaiser/data/api_kundelik/model/template_model/homework.dart';

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
  final List<Marks> marks;
  @JsonKey(name: "subjects")
  final List<Subject> subjects;
  @JsonKey(name: "lessons")
  final List<Lesson> lessons;
  @JsonKey(name: "homeworks")
  final List<HomeWork> homeworks;

  factory ApiDayModel.fromJson(Map<String, dynamic> json) =>
      _$ApiDayModelFromJson(json);
}
