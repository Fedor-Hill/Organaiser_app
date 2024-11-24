import 'package:json_annotation/json_annotation.dart';

import 'package:organaiser/data/api_kundelik/model/template_model/subject.dart';

part 'api_lessons_list_id_model.g.dart';

@JsonSerializable()
class ApiLessonsListIdModel {
  final int id;
  final String title; 
  final Subject subject;
  final DateTime date; 

  @JsonKey(name: "id_str")
  final String idStr;

  ApiLessonsListIdModel({
    required this.id,
    required this.idStr,
    required this.title,
    required this.subject,
    required this.date
  });

  factory ApiLessonsListIdModel.fromJson(Map<String, dynamic> json) => _$ApiLessonsListIdModelFromJson(json);

}
