import 'package:json_annotation/json_annotation.dart';

part 'api_user_context.g.dart';

@JsonSerializable()
class ApiUserContextModel {
  final int userId, personId;
  final String firstName, lastName;
  final String? middleName;
  final String shortName;
  final String avatarUrl;
  final List<ApiSchoolDetails> schools;
  final List<ApiEduGroup> eduGroups;

  ApiUserContextModel({
    required this.userId,
    required this.personId,
    required this.firstName,
    required this.lastName,
    required this.middleName,
    required this.shortName,
    required this.avatarUrl,
    required this.schools,
    required this.eduGroups,
  });

  factory ApiUserContextModel.fromJson(Map<String, dynamic> json) =>
      _$ApiUserContextModelFromJson(json);
}

@JsonSerializable()
class ApiEduGroup {
  final int id;
  final int parallel;
  final int? timetable;
  final int studyyear;
  final String type;
  final String status;
  final String name;

  ApiEduGroup({
    required this.id,
    required this.parallel,
    required this.timetable,
    required this.studyyear,
    required this.type,
    required this.status,
    required this.name,
  });

  factory ApiEduGroup.fromJson(Map<String, dynamic> json) =>
      _$ApiEduGroupFromJson(json);
}

@JsonSerializable()
class ApiSchoolDetails {
  final int id;
  final String name;
  final String type;
  final List groupIds;

  ApiSchoolDetails(
      {required this.id,
      required this.name,
      required this.type,
      required this.groupIds});

  factory ApiSchoolDetails.fromJson(Map<String, dynamic> json) =>
      _$ApiSchoolDetailsFromJson(json);
}
