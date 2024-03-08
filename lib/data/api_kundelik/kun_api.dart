//repository
import 'package:organaiser/data/api_kundelik/requests/get/get_homeworks.dart';
import 'package:organaiser/data/api_kundelik/requests/get/get_persons.dart';
import 'package:organaiser/domain/model/person_model/person_model.dart';
import 'package:organaiser/domain/repository/kundelik/user_repository.dart';
import 'package:organaiser/domain/repository/kundelik/data_repository.dart';

//model
import 'package:organaiser/domain/model/user_context_model/user_context.dart';
import 'package:organaiser/domain/model/recent_mark_model/recent_mark_model.dart';
import 'package:organaiser/domain/model/shedule_model/shedule_model.dart';

//api model
import 'package:organaiser/data/api_kundelik/model/api_shedule/api_shedule_model.dart';

//mapper
import 'package:organaiser/data/api_kundelik/mapper/recent_marks_mapper.dart';
import 'package:organaiser/data/api_kundelik/mapper/user_context_mapper.dart';
import 'package:organaiser/data/api_kundelik/mapper/shedule_mapper.dart';
import 'package:organaiser/data/api_kundelik/mapper/persons_mapper.dart';

//get requests
import 'package:organaiser/data/api_kundelik/requests/get/get_user_context.dart';
import 'package:organaiser/data/api_kundelik/requests/get/get_recent_marks.dart';
import 'package:organaiser/data/api_kundelik/requests/get/get_shedule.dart';

//post requests
import 'package:organaiser/data/api_kundelik/requests/post/post_token.dart';
import 'package:organaiser/data/api_kundelik/requests/post/post_lesson.dart';
import 'package:organaiser/data/api_kundelik/requests/post/post_criteria_marks.dart';

class BaseMethods {
  Token token = Token();

  Future<String> createToken(String login, String password) async {
    return await token.createToken(login, password);
  }

  Future<String> getToken() async {
    return await token.checkToken();
  }

  Future<void> refreshToken() async {}

  Future<void> deleteToken() async {
    return await token.deleteToken();
  }
}

class ApiUserSevice extends BaseMethods implements UserRepository {
  @override
  Future<UserContextModel> setUser(String login, String password) async {
    String token = await createToken(login, password);
    final apiUserContext = await getApiUserContext(token);
    return UserContextMapper.fromApi(apiUserContext);
  }

  @override
  Future<UserContextModel> getUser() async {
    final apiUserContext = await getApiUserContext(await getToken());
    return UserContextMapper.fromApi(apiUserContext);
  }

  @override
  Future<void> logOut() async {
    return deleteToken();
  }
}

class KunApiWidgetData
    implements
        RecentMarkRepository,
        SheduleRepository,
        PersonsRepository,
        CriteriaJournalMarksRepository {
  late Future<String> token = BaseMethods().getToken();

  @override
  Future<List<RecentMarkModel>> getRecentMark(int personId, int groupId) async {
    DateTime nowDate = DateTime.now();
    DateTime date;

    if (nowDate.month >= 9 && nowDate.month < 10) {
      date = DateTime.utc(nowDate.year, 9, 1);
    } else if (nowDate.month >= 10 && nowDate.month < 13) {
      date = DateTime.utc(nowDate.year, 10, 6);
    } else if (nowDate.month >= 1 && nowDate.month < 4) {
      date = DateTime.utc(nowDate.year, 1, 7);
    } else {
      date = DateTime.utc(nowDate.year, 4, 1);
    }

    final apiRecentMarkModel =
        await getApiRecentMark(personId, groupId, await token);

    // final List<int> arraySection = []; 
    //
    // for (var value in apiRecentMarkModel.criteriabasedmarks) {
    //   arraySection.add(value.section);
    // }
    //
    // await postApiCriteriaMarks(arraySection, await token);

    final List<int> lessonId = [];
    for (var value in apiRecentMarkModel.marks) {
      if (lessonId.length >= 12 || value.date.isBefore(date)) {
        break;
      }
      lessonId.add(value.lesson);
    }

    final apiLessonListIdModel =
        await postApiListLessonId(lessonId, await token);
    return RecentMarksMapper.fromApi(apiRecentMarkModel, apiLessonListIdModel);
  }

  @override
  Future<SheduleModel> getShedule(int personId, int groupId, DateTime fromDate,
      DateTime endDate, int schoolId) async {
    final ApiSheduleModel apiSheduleModel =
        await getApiShedule(personId, groupId, fromDate, endDate, await token);

    List<String> lessonsId = [];

    for (var item in apiSheduleModel.apiDayModel[0].lessons) {
      lessonsId.add(item.id.toString());
    }

    final apiHomeWorkModel = await getApiHomeWorks(
        personId, schoolId, fromDate, endDate, await token);

    return SheduleMapper.fromApi(apiSheduleModel, apiHomeWorkModel);
  }

  @override
  Future<List<PersonModel>> getPersons(int groupId) async {
    final apiPersonModel = await getApiPersons(groupId, await token);
    return PersonsMapper.fromApi(apiPersonModel);
  }

  @override
  Future<void> getFinalMarks(int groupId, int personId) async {}
}
