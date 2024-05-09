import 'package:json_annotation/json_annotation.dart';

part 'api_mark.g.dart';

@JsonSerializable()
class ApiMark {
  ApiMark(
      {required this.id,
      required this.person,
      required this.lesson,
      required this.value,
      required this.mood,
      required this.date});
  
  final int id, person, lesson;
  final String value, mood;
  final DateTime date;

  factory ApiMark.fromJson(Map<String, dynamic> json) => _$ApiMarkFromJson(json);
}
