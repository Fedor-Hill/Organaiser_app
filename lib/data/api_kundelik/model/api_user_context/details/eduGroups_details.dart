import 'package:json_annotation/json_annotation.dart';

part 'eduGroups_details.g.dart';

@JsonSerializable()
class ApiEduGroupsDetails {

  final int id;
  final int parallel;
  final int? timetable;
  final int studyyear;
  final String type;
  final String name;

  ApiEduGroupsDetails({
    required this.id,
    required this.parallel,
    required this.timetable,
    required this.studyyear,
    required this.type,
    required this.name,
  });

  factory ApiEduGroupsDetails.fromJson(Map<String, dynamic> json) => _$ApiEduGroupsDetailsFromJson(json);

}
