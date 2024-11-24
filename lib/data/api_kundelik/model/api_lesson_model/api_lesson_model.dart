import 'package:json_annotation/json_annotation.dart';
import 'package:organaiser/data/api_kundelik/model/general/api_subject.dart';

part 'api_lesson_model.g.dart';

@JsonSerializable()
class ApiLesson {
  ApiLesson(this.subject,
      {required this.id, required this.title, required this.date});

  final int id;
  final String title;
  final ApiSubject subject;
  final DateTime date;

  factory ApiLesson.fromJson(Map<String, dynamic> json) => _$ApiLessonFromJson(json);
}
