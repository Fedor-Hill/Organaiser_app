import 'package:json_annotation/json_annotation.dart';

part 'api_home_works_model.g.dart';

@JsonSerializable()
class ApiHomeWorkModel {
  ApiHomeWorkModel({
    required this.works
    });

  final List<ApiHomeWorkDetailsModel> works;

  factory ApiHomeWorkModel.fromJson(Map<String, dynamic> json) => _$ApiHomeWorkModelFromJson(json);
}

@JsonSerializable()
class ApiHomeWorkDetailsModel {
  ApiHomeWorkDetailsModel(
      {required this.text, required this.lesson, required this.id});

  final int id, lesson;
  final String text;

  factory ApiHomeWorkDetailsModel.fromJson(Map<String, dynamic> json) => _$ApiHomeWorkDetailsModelFromJson(json);
}
