import 'package:organaiser/data/api_kundelik/model/general/api_subject.dart';
import 'package:json_annotation/json_annotation.dart';

part 'api_section_model.g.dart';

@JsonSerializable()
class ApiSectionModel {
  ApiSectionModel(
      {required this.id,
      required this.part,
      required this.maxValue,
      required this.subject});

  final int id;
  final int part;
  @JsonKey(name: "maxvalue")
  final int maxValue;
  final ApiSubject subject;

  factory ApiSectionModel.fromJson(Map<String, dynamic> json) =>
      _$ApiSectionModelFromJson(json);
}
