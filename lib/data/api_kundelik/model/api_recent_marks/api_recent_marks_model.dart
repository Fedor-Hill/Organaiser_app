import 'package:json_annotation/json_annotation.dart';

import 'package:organaiser/data/api_kundelik/model/template_model/marks.dart';
import 'package:organaiser/data/api_kundelik/model/template_model/subject.dart';
import 'package:organaiser/data/api_kundelik/model/template_model/lesson.dart';
import 'package:organaiser/data/api_kundelik/model/template_model/criteriabasedmarks.dart';

part 'api_recent_marks_model.g.dart';

@JsonSerializable()
class ApiRecentMarksModel {
  ApiRecentMarksModel({
    required this.marks, 
    required this.subject, 
    required this.lessons,
    required this.criteriabasedmarks
  });


  final List<Marks> marks;
  @JsonKey(name: "subjects")
  final List<Subject> subject; 
  final List<Lesson> lessons;
  @JsonKey(name: "criteriabasedmarks")
  final List<CriteriaBasedMark> criteriabasedmarks;

  factory ApiRecentMarksModel.fromJson(Map<String, dynamic> json) => _$ApiRecentMarksModelFromJson(json);
}
