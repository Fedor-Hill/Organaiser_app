import 'package:organaiser/data/api_kundelik/model/api_user_context/api_user_context.dart';
import 'package:organaiser/domain/model/edu_group.dart';

class EduGroupAllMapper {

  static EduGroupData fromApi(List<ApiEduGroup> apiEduGroupAll) {
    final List<EduGroup> list = [];

    for (var val in apiEduGroupAll) {
      if (val.type.compareTo("Group") == 0) {
        list.add(EduGroup(
          id: val.id, 
          parallel: val.parallel, 
          name: val.name,
          isActive: val.status.compareTo("Active") == 0 ? true : false
        ));
      }
    }

    return EduGroupData(userEduGroups: list);
  }
}
