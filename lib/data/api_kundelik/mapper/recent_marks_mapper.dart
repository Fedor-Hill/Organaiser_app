<<<<<<< HEAD
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
=======
import 'package:organaiser/data/api_kundelik/model/api_lesson_model/api_lesson_model.dart';
import 'package:organaiser/data/api_kundelik/model/api_person_criteria_marks/api_person_criteria_marks_model.dart';
import 'package:organaiser/data/api_kundelik/model/api_recent_marks/api_recent_marks_model.dart';
import 'package:organaiser/data/api_kundelik/model/api_section_model/api_section_model.dart';
import 'package:organaiser/domain/model/mark/mark.dart';


class RecentMarksMapper {
  static RecentMarkData fromApi(ApiRecentMarks apiRecentMarks,
      List<ApiLesson>? apiLessons, List<ApiCrMarks> apiCrMarks, List<ApiSectionModel>? apiSectionModel) {
    final List<Mark> marks = [];

    //First loop for every lesson 
    if (apiLessons != null) {
      for (int i = 0; i < apiLessons.length; i++) {
        // Second loop for find in marks.lessonId == lessons.id 
        for (int j = 0; i < apiLessons.length; j++) {
          if (apiRecentMarks.marks[i].lesson == apiLessons[j].id) {
            final RecentMark recentMark = RecentMark(
              subject: apiLessons[j].subject.name,
              title: apiLessons[j].title,
              value: int.parse(apiRecentMarks.marks[i].value),
              // value: 10,
              mood: apiRecentMarks.marks[i].mood,
              markDate: apiRecentMarks.marks[i].date,
              lessonDate: apiLessons[j].date,
            );
            marks.add(recentMark);
            break;
          }
        }
      }
    }

    if (apiSectionModel != null) {
      for (int i = 0; i < apiSectionModel.length; i++) {
        for (int j = 0; j < apiSectionModel.length; j++) {
          if (apiCrMarks[i].section == apiSectionModel[j].id) {
            final String mood = apiCrMarks[i].value / apiSectionModel[j].maxValue >= 0.64 ? "Good" : "Average";
            
            CriteriaMark criteriamark = CriteriaMark(
              subject: apiSectionModel[j].subject.name,
              value: apiCrMarks[i].value,
              maxValue: apiSectionModel[j].maxValue,
              mood: mood,
              markDate: apiCrMarks[i].date,
              section: apiSectionModel[j].id,
              part: apiSectionModel[j].part
            );
            marks.add(criteriamark);
            break;
          }
        }
      }
    }

    marks.sort((a, b) => b.markDate.compareTo(a.markDate));
    return RecentMarkData(list: marks);
>>>>>>> 18c7d66 (version 3.0.1)
  }
}
