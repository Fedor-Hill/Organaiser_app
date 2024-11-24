import 'package:organaiser/data/api_kundelik/model/general/api_mark.dart';
import 'package:json_annotation/json_annotation.dart';

part 'api_recent_marks_model.g.dart';

@JsonSerializable()
class ApiRecentMarks {
  ApiRecentMarks({required this.marks});

  final List<ApiMark> marks;

  factory ApiRecentMarks.fromJson(Map<String, dynamic> json) => _$ApiRecentMarksFromJson(json);
}
