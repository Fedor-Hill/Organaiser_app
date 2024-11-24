import 'package:json_annotation/json_annotation.dart';

part 'homework.g.dart';

@JsonSerializable()
class HomeWork {
  HomeWork({
    required this.id, 
    required this.lesson,
    required this.text
  });

  final int id, lesson;
  final String text; 

  factory HomeWork.fromJson(Map<String, dynamic> json) => _$HomeWorkFromJson(json);
}
