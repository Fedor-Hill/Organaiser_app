import 'package:json_annotation/json_annotation.dart';

part 'api_person.g.dart';

@JsonSerializable()
class ApiPerson {
  const ApiPerson(
      {required this.userId,
      required this.firstName,
      required this.lastName,
      required this.middleName,
      required this.shortName,
      required this.sex});
  final int userId;
  final String firstName, lastName, middleName, shortName, sex;

  factory ApiPerson.fromJson(Map<String, dynamic> json) => _$ApiPersonFromJson(json);
}
