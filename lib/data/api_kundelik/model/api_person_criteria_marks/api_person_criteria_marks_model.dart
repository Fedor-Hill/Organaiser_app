import 'package:json_annotation/json_annotation.dart';

part 'api_person_criteria_marks_model.g.dart';

@JsonSerializable()
class ApiCriteriaMarks {
  ApiCriteriaMarks({required this.subjectId, required this.apiPersonMarks});

  @JsonKey(name: "subject")
  final int subjectId;
  @JsonKey(name: "personmarks")
  final List<ApiPersonMarks> apiPersonMarks;

  factory ApiCriteriaMarks.fromJson(Map<String, dynamic> json) => _$ApiCriteriaMarksFromJson(json);

}

@JsonSerializable()
class ApiPersonMarks {
  ApiPersonMarks({required this.person, required this.apiCrMarks});

  final int person;
  @JsonKey(name: "criteriamarks")
  final List<ApiCrMarks> apiCrMarks;

  factory ApiPersonMarks.fromJson(Map<String, dynamic> json) => _$ApiPersonMarksFromJson(json);
}

@JsonSerializable()
class ApiCrMarks {
  ApiCrMarks(
      {required this.id,
      required this.section,
      required this.value,
      required this.date});

  final int id, section, value;
  final DateTime date;

  factory ApiCrMarks.fromJson(Map<String, dynamic> json) => _$ApiCrMarksFromJson(json);

}
