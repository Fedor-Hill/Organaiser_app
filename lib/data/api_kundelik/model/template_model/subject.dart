import 'package:json_annotation/json_annotation.dart';

part 'subject.g.dart';

@JsonSerializable()
class Subject {
  Subject({
    required this.id, 
    required this.name
  });

  final int id; 
  final String name;


  factory Subject.fromJson(Map<String, dynamic> json) => _$SubjectFromJson(json);

}
