<<<<<<< HEAD
import 'package:organaiser/data/api_kundelik/model/api_home_works/api_home_works_model.dart';
import 'package:organaiser/domain/model/shedule_model/shedule_model.dart';
import 'package:organaiser/data/api_kundelik/model/api_shedule/api_shedule_model.dart';

class SheduleMapper {
  static SheduleModel fromApi(
      ApiSheduleModel apiSheduleModel, ApiHomeWorkModel apiHomeWorkModel) {
    SheduleModel sheduleModel = SheduleModel(
=======
import 'package:organaiser/data/api_kundelik/model/api_homework_model/api_homework_model.dart';
import 'package:organaiser/data/api_kundelik/model/api_shedule_model/api_shedule_model.dart';
import 'package:organaiser/domain/model/shedule.dart';

class SheduleMapper {
  static Shedule fromApi(
      ApiSheduleModel apiSheduleModel, ApiHomeWorkModel apiHomeWorkModel) {
    Shedule sheduleModel = Shedule(
>>>>>>> 18c7d66 (version 3.0.1)
        dayModel: DayMapper()
            .fromApi(apiSheduleModel.apiDayModel, apiHomeWorkModel.works));

    return sheduleModel;
  }
}

class DayMapper {
  List<DayModel> fromApi(List<ApiDayModel> listApiDayModel,
      List<ApiHomeWorkDetailsModel> listApiHomework) {
    List<DayModel> list = [];

    //from list
    for (ApiDayModel apiDayModel in listApiDayModel) {
      DayModel dayModel = DayModel(
          date: apiDayModel.date,
          nextDate: apiDayModel.nextDate,
          lessons: LessonsMapper().fromApi(apiDayModel, listApiHomework));
      list.add(dayModel);
    }

    return list;
  }
}

class LessonsMapper {
  List<LessonSheduleModel> fromApi(
      ApiDayModel apiDayModel, List<ApiHomeWorkDetailsModel> listApiHomework) {
    List<LessonSheduleModel> list = [];

    for (int i = 0; i < apiDayModel.lessons.length; i++) {
      LessonSheduleModel model = LessonSheduleModel(
          subject: getSubject(apiDayModel.lessons[i].subjectId, apiDayModel),
          title: apiDayModel.lessons[i].title,
          hours: apiDayModel.lessons[i].hours,
          number: apiDayModel.lessons[i].number,
          homework: getHomework(apiDayModel.lessons[i].id, listApiHomework));
      list.add(model);
    }

    list.sort((a, b) => a.number.compareTo(b.number));

    return list;
  }

  String getSubject(int subjectId, ApiDayModel apiDayModel) {
    String subject = "null";

    for (var i = 0; i < apiDayModel.subjects.length; i++) {
      if (subjectId == apiDayModel.subjects[i].id) {
        subject = apiDayModel.subjects[i].name;
        break;
      }
    }

    return subject;
  }

  String? getHomework(
      int lessonId, List<ApiHomeWorkDetailsModel> listApiHomework) {
    String? homeWork;

<<<<<<< HEAD
    // for (int i = 0; i < listApiHomework.length; i++) {
    //   if (lessonId == listApiHomework[i].lesson) {}
    // }

=======
>>>>>>> 18c7d66 (version 3.0.1)
    for (var item in listApiHomework) {
      if (lessonId == item.lesson) {
        if (homeWork == null) {
          homeWork = item.text;
        } else {
          homeWork = "$homeWork, ${item.text}";
        }
      }
    }

    return homeWork;
  }
}
