import 'package:json_annotation/json_annotation.dart';

part 'api_person_model.g.dart';

@JsonSerializable()
class ApiPersonModel {
  const ApiPersonModel(
      {required this.userId,
      required this.firstName,
      required this.lastName,
      required this.middleName,
      required this.shortName,
      required this.sex});
  final int userId;
  final String firstName, lastName, middleName, shortName, sex;

  factory ApiPersonModel.fromJson(Map<String, dynamic> json) => _$ApiPersonModelFromJson(json);
}
