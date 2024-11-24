import 'package:json_annotation/json_annotation.dart';

part 'api_lesson.g.dart';

@JsonSerializable()
class ApiLessonGeneral {
  final int id, subjectId, number;
  final String title, hours;

  ApiLessonGeneral({
    required this.id,
    required this.subjectId,
    required this.number,
    required this.title,
    required this.hours
  });

  factory ApiLessonGeneral.fromJson(Map<String, dynamic> json) => _$ApiLessonGeneralFromJson(json);
}
