import 'package:json_annotation/json_annotation.dart';
part 'children_details.g.dart';

@JsonSerializable()
class ApiChildrenDetails {

  final int personId;

  final String firstName;

  final String lastName;

  final String middleName;

  final String shortName;

  final List schoolIds;

  final List groupIds;

  ApiChildrenDetails({
    required this.personId,
    required this.firstName, 
    required this.lastName,
    required this.middleName,
    required this.shortName,
    required this.schoolIds,
    required this.groupIds
  });

  factory ApiChildrenDetails.fromJson(Map<String, dynamic> json) => _$ApiChildrenDetailsFromJson(json);
}
