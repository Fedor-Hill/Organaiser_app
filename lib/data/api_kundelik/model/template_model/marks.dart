import 'package:json_annotation/json_annotation.dart';

part 'marks.g.dart';

@JsonSerializable()
class Marks {
  final int id, person, work, lesson, number, workType; 
  final String type, value, textValue, mood;
  final DateTime date;

  Marks({
    required this.id,
    required this.person,
    required this.work,
    required this.lesson,
    required this.number,
    required this.workType,
    required this.type,
    required this.value,
    required this.textValue,
    required this.mood,
    required this.date
  });

  factory Marks.fromJson(Map<String, dynamic> json) => _$MarksFromJson(json);
}
