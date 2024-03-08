import 'package:json_annotation/json_annotation.dart';
part 'school_details.g.dart';

@JsonSerializable()
class ApiSchoolDetails {

  final int id;
  final String name;
  final String type;
  final List groupIds;

  ApiSchoolDetails({
    required this.id, 
    required this.name,
    required this.type,
    required this.groupIds
  });

  factory ApiSchoolDetails.fromJson(Map<String, dynamic> json) => _$ApiSchoolDetailsFromJson(json);
}
