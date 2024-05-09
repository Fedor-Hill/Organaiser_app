//get
import 'package:get_it/get_it.dart';
import 'package:organaiser/data/api_kundelik/model/api_lesson_model/api_lesson_model.dart';
import 'package:organaiser/data/api_kundelik/model/api_section_model/api_section_model.dart';
import 'package:organaiser/data/api_kundelik/requests/get/get.dart';

//post
import 'package:organaiser/data/api_kundelik/requests/post/post_token.dart';
import 'package:organaiser/data/api_kundelik/requests/post/post.dart';

//mapper
import 'package:organaiser/data/api_kundelik/mapper/user_context_mapper.dart';
import 'package:organaiser/data/api_kundelik/mapper/recent_marks_mapper.dart';
import 'package:organaiser/data/api_kundelik/mapper/edu_group_all_mapper.dart';
import 'package:organaiser/data/api_kundelik/mapper/final_marks_mapper.dart';
import 'package:organaiser/data/api_kundelik/mapper/shedule_mapper.dart';
import 'package:organaiser/data/api_kundelik/mapper/my_classmate_mapper.dart';


//model
import 'package:organaiser/domain/model/user/user.dart';
import 'package:organaiser/domain/model/person.dart';
import 'package:organaiser/domain/model/shedule.dart';
import 'package:organaiser/domain/model/edu_group.dart';
import 'package:organaiser/domain/model/mark/final_mark.dart';
import 'package:organaiser/domain/model/mark/mark.dart';
import 'package:organaiser/data/api_kundelik/model/api_person_criteria_marks/api_person_criteria_marks_model.dart';

//repository
import 'package:organaiser/domain/repository/user.dart';
import 'package:organaiser/domain/repository/widget_data.dart';

class ApiUserMethods implements UserRepository {
  final Token _token = Token();

  @override
  Future<UserModel> signInUser(String login, String password) async {
    await _token.createToken(login, password);
    return setUser();
  }

  @override
  Future<UserModel> setUser() async {
    final apiUserContextModel =
        await getApiUserContext(await _token.checkToken());

    final apiReportingPeriods = await getApiReportingPeriods(
        apiUserContextModel.eduGroups[0].id, await _token.checkToken());

    return UserContextMapper.fromApi(apiUserContextModel, apiReportingPeriods);
  }

  @override
  Future<void> delUser() async => await _token.deleteToken();

  @override
  Future<PersonData> getClassmate() async {
    late final UserModel user = GetIt.I<AuthorizedUser>().user;

    final apiPersons = await getApiPersons(user.eduGroup.id, await _token.checkToken());

    return PersonMapper.fromApi(apiPersons);
  }
}

class ApiWidgetDataMethods implements WidgetDataRepository {
  late final UserModel _user = GetIt.I<AuthorizedUser>().user;
  final Token _token = Token();

  @override
  Future<EduGroupData> getUserEduGroupAll() async {
    final apiEduGroupAll = await getApiEduGroupsAll(
      _user.personId, await _token.checkToken()
    );

    return EduGroupAllMapper.fromApi(apiEduGroupAll);
  }


  @override
  Future<RecentMarkData> getRecentMarks() async {
    
    // 1: from api take RecentMarks and CriteriaMarks
    final apiRecentMarks = await getApiRecentMarks(
      _user.personId, _user.eduGroup.id, await _token.checkToken());

    final apiCriteriaMarks = await getApiPersonCriteriaMark(
      _user.personId, _user.eduGroup.id, await _token.checkToken());

    // 2: from api result take some ids for important info
    final DateTime startPeriod = _user.startPeriod ?? DateTime.utc(1970, 1, 1);
    DateTime lastTime = DateTime.now();
    final List<int> lessonsId = [];
    final List<int> sectionsId = [];

    for (var val in apiRecentMarks.marks) {
      if (lessonsId.length >= 12) break;
      if (val.date.isBefore(startPeriod)) break;

      if (val.date.isBefore(lastTime)) lastTime = val.date;
        lessonsId.add(val.lesson);
    }


    final List<ApiCrMarks> sortedApiCriteriaMarks = [];

    for (int i = 0; i < apiCriteriaMarks.length; i++) {
      if (apiCriteriaMarks[i].apiPersonMarks.firstOrNull == null) {
        break;
      } else {
        for (var val in apiCriteriaMarks[i].apiPersonMarks[0].apiCrMarks) {
          if (val.date.isAfter(lastTime)) {
            sectionsId.add(val.section);
            sortedApiCriteriaMarks.add(val);
          }
        }
      }
    }

    List<ApiSectionModel>? apiSections;
    List<ApiLesson>? apiLessons;

    // 3: create new requsts
    if (lessonsId.isNotEmpty) {
      apiLessons = await postApiListLessonId(lessonsId, await _token.checkToken());
    }
    

    if (sectionsId.isNotEmpty) {
      apiSections = await postApiSectionsId(sectionsId, await _token.checkToken());
    }


    return RecentMarksMapper.fromApi(apiRecentMarks, apiLessons, sortedApiCriteriaMarks, apiSections);
  }

  @override
  Future<Shedule> getShedule(DateTime fromDate, DateTime endDate) async {
    final apiSheduleModel = await getApiShedule(_user.personId, _user.eduGroup.id,
        fromDate, endDate, await _token.checkToken());

    final apiHomeWorkModel = await getApiHomeWorks(_user.personId, _user.schoolId,
        fromDate, endDate, await _token.checkToken());

    return SheduleMapper.fromApi(apiSheduleModel, apiHomeWorkModel);
  }


  @override
  Future<FinalMarkData> getFinalMarks(int? eduGroupId) async {
    // If eduGroupId null -> return base :D
    final apiFinalMark = await getApiFinalMarks(eduGroupId ?? _user.eduGroup.id, await _token.checkToken());

    return FinalMarksMapper.fromApi(apiFinalMark, _user.personId);
  }
}
