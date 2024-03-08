import 'package:organaiser/domain/model/recent_mark_model/recent_mark_model.dart';

import 'package:organaiser/data/api_kundelik/model/api_recent_marks/api_recent_marks_model.dart';
import 'package:organaiser/data/api_kundelik/model/api_lessons_list_id/api_lessons_list_id_model.dart';

class RecentMarksMapper {
  static List<RecentMarkModel> fromApi(ApiRecentMarksModel apiRecentMarksModel,
      List<ApiLessonsListIdModel> apiLessonsListIdModel) {
    List<RecentMarkModel> list = [];
    for (int i = 0; i < apiLessonsListIdModel.length; i++) {
      for (int j = 0; j < apiLessonsListIdModel.length; j++) {
        if (apiRecentMarksModel.marks[i].lesson ==
            apiLessonsListIdModel[j].id) {
          final String subject = apiLessonsListIdModel[j].subject.name;
          final String title = apiLessonsListIdModel[j].title;
          final DateTime date = apiLessonsListIdModel[j].date;
          bool isNewTitle = (i == 0)
              ? true
              : apiRecentMarksModel.marks[i - 1].date.day !=
                  apiRecentMarksModel.marks[i].date.day;

          list.add(RecentMarkModel(
              subject: subject,
              lesson: title,
              value: apiRecentMarksModel.marks[i].textValue,
              mood: apiRecentMarksModel.marks[i].mood,
              markDate: apiRecentMarksModel.marks[i].date,
              lessonDate: date,
              isNewTitle: isNewTitle));

          break;
        }
      }
    }
    return list;
  }
}
