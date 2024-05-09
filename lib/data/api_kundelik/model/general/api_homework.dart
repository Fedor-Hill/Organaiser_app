import 'package:json_annotation/json_annotation.dart';

part 'api_homework.g.dart';

@JsonSerializable()
class ApiHomeWorkGeneral {
  ApiHomeWorkGeneral({
    required this.id,
    required this.lesson,
    required this.text
  });

  final int id, lesson;
  final String text;

  factory ApiHomeWorkGeneral.fromJson(Map<String, dynamic> json) => _$ApiHomeWorkGeneralFromJson(json);
}
