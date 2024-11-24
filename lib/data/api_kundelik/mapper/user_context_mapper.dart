import 'package:organaiser/data/api_kundelik/model/api_reporting_periods/api_reporting_periods_model.dart';
import 'package:organaiser/data/api_kundelik/model/api_user_context/api_user_context.dart';
import 'package:organaiser/domain/model/edu_group.dart';
import 'package:organaiser/domain/model/user/user.dart';

class UserContextMapper {
  static UserModel fromApi(ApiUserContextModel apiUserContextModel,
      List<ApiReportingPeriods> apiReportingPeriods) {
    int? periodId, numberPeriod, year;
    DateTime? startPeriod, finishPeriod;
    String? namePeriod;
    DateTime now = DateTime.now();

    for (var item in apiReportingPeriods) {
      if (now.isAfter(item.start) && now.isBefore(item.finish)) {
        periodId = item.id;
        numberPeriod = item.number;
        year = item.year;
        startPeriod = item.start;
        finishPeriod = item.finish;
        namePeriod = item.name;
        break;
      }
    }

    EduGroup eduGroup = EduGroup(
      id: apiUserContextModel.eduGroups.first.id, 
      parallel: apiUserContextModel.eduGroups.first.parallel, 
      name: apiUserContextModel.eduGroups.first.name, 
      isActive: apiUserContextModel.eduGroups.first.status.compareTo("Active") == 0 ? true : false
    );

    return UserModel(
        userId: apiUserContextModel.userId,
        personId: apiUserContextModel.personId,
        schoolId: apiUserContextModel.schools.first.id,
        eduGroup: eduGroup,
        firstName: apiUserContextModel.firstName,
        lastName: apiUserContextModel.lastName,
        middleName: apiUserContextModel.middleName,
        shortName: apiUserContextModel.shortName,
        schoolName: apiUserContextModel.schools.first.name,
        avatarUrl: apiUserContextModel.avatarUrl,
        startPeriod: startPeriod,
        finishPeriod: finishPeriod,
        namePeriod: namePeriod,
        periodId: periodId,
        numberPeriod: numberPeriod,
        year: year);
  }
}
