import 'package:organaiser/domain/model/user_context_model/user_context.dart';
import 'package:organaiser/data/api_kundelik/model/api_user_context/api_user_context_model.dart';

class UserContextMapper {
  static UserContextModel fromApi(ApiUserContextModel apiUserContextModel) {
    return UserContextModel(
        userId: apiUserContextModel.userId,
        personId: apiUserContextModel.personId,
        groupId: apiUserContextModel.eduGroups.first.id,
        schoolId: apiUserContextModel.schools.first.id,
        parallel: apiUserContextModel.eduGroups.first.parallel,
        timetable: apiUserContextModel.eduGroups.first.timetable,
        firstName: apiUserContextModel.firstName,
        lastName: apiUserContextModel.lastName,
        middleName: apiUserContextModel.middleName,
        schoolName: apiUserContextModel.schools.first.name,
        parallelStr: apiUserContextModel.eduGroups.first.name,
        avatarUrl: apiUserContextModel.avatarUrl);
  }
}
