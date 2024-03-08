import 'package:json_annotation/json_annotation.dart';

part 'criteriabasedmarks.g.dart';

@JsonSerializable()
class CriteriaBasedMark {
  CriteriaBasedMark({
    required this.id, 
    required this.value,
    required this.section,
    required this.date
  }); 

  final int id, value, section; 
  final DateTime date; 

  factory CriteriaBasedMark.fromJson(Map<String, dynamic> json) => _$CriteriaBasedMarkFromJson(json);
}
