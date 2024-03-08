import 'package:json_annotation/json_annotation.dart';

import 'package:organaiser/data/api_kundelik/model/api_user_context/details/school_details.dart';
import 'package:organaiser/data/api_kundelik/model/api_user_context/details/eduGroups_details.dart';

part 'api_user_context_model.g.dart';

@JsonSerializable()
class ApiUserContextModel {

  final int userId;
  final int personId;
  final String firstName;
  final String lastName; 
  final String middleName;
  final String avatarUrl;
  final List<ApiSchoolDetails> schools;
  final List<ApiEduGroupsDetails> eduGroups;
 
  ApiUserContextModel({
    required this.userId, 
    required this.personId,
    required this.firstName, 
    required this.lastName,
    required this.middleName,
    required this.avatarUrl,
    required this.schools,
    required this.eduGroups,
  });

  factory ApiUserContextModel.fromJson(Map<String, dynamic> json) => _$ApiUserContextModelFromJson(json);

}
