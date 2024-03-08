import 'package:json_annotation/json_annotation.dart';

part 'lesson.g.dart';

@JsonSerializable()
class Lesson {
  final int id, subjectId, number; 
  final String title, hours;

  Lesson({
    required this.id,
    required this.subjectId,
    required this.number,
    required this.title,
    required this.hours
  });

  factory Lesson.fromJson(Map<String, dynamic> json) => _$LessonFromJson(json);
}
