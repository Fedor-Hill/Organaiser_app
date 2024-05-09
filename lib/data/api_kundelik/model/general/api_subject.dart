import 'package:json_annotation/json_annotation.dart';

part 'api_subject.g.dart';

@JsonSerializable()
class ApiSubject {
  ApiSubject({required this.id, required this.name});

  final int id;
  final String name;

  factory ApiSubject.fromJson(Map<String, dynamic> json) => _$ApiSubjectFromJson(json);

}
