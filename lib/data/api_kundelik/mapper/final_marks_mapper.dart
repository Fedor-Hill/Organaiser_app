import 'package:organaiser/data/api_kundelik/model/api_criteria_mark_total_l_model/api_criteria_mark_total_l_model.dart';
import 'package:organaiser/domain/model/mark/final_mark.dart';

class FinalMarksMapper {

  static FinalMarkData fromApi(List<ApiFinalMarksModel> apiFinalMarksModel, int userId) {
    final List<Quarter> quarters = [];
    final List<Year> years = [];
    final List<Quarter> userQuarters = [];
    final List<Year> userYears = [];

    
    for (ApiFinalMarksModel apiFinalMark in apiFinalMarksModel) {
      final String subjectName = apiFinalMark.subjectName;
      final int subjectId = apiFinalMark.subjectId;

      final List<PersonMark> userYearMark = [];
      final List<PersonMark> yearMark = [];

      //Year
      for (Summaries summaries in apiFinalMark.summaries) {
        if (summaries.mark != null && summaries.mark?.value != null) {
          int value = summaries.mark!.value!.toInt();
          final PersonMark mark = PersonMark(
            value: value,
            personId: summaries.student.personId,
            firstName: summaries.student.personName.firstName,
            lastName: summaries.student.personName.lastName,
            mood: value >= 4 ? "Good" : value == 3 ? "Average" : "Bad"
          );

          if (mark.personId == userId) userYearMark.add(mark);
          yearMark.add(mark);
        }
      }

      final Year userYear = Year(
        subjectName: subjectName,
        subjectId: subjectId,
        marks: userYearMark
      );

      final Year year = Year(
        subjectName: subjectName,
        subjectId: subjectId,
        marks: yearMark
      );
      
      userYears.add(userYear);
      years.add(year);
      
       

      //Quarter 
      for (FinalMarksDetail detail in apiFinalMark.finalMarksDetail) {
        final int rawNumber = detail.period.periodNumber.rawNumber;
        final List<PersonMark> userQuartersMarks = [];
        final List<PersonMark> quartersMarks = [];
        
        for (PersonFinalMarks personFinalMark in detail.personFinalMarks) {
          if (personFinalMark.mark != null && personFinalMark.mark?.value != null) {
            final int value = personFinalMark.mark!.value!.toInt();
            final PersonMark mark = PersonMark(
              value: value,
              personId: personFinalMark.student.personId,
              firstName: personFinalMark.student.personName.firstName,
              lastName: personFinalMark.student.personName.lastName,
              mood: value >= 4 ? "Good" : value == 3 ? "Average" : "Bad"
            );

            if (mark.personId == userId) userQuartersMarks.add(mark);
            quartersMarks.add(mark);
          }
        }

        Quarter userQuarter = Quarter(
          subjectId: subjectId,
          subjectName: subjectName,
          rawNumber: rawNumber,
          marks: userQuartersMarks
        );

        Quarter quarter = Quarter(
          subjectId: subjectId,
          subjectName: subjectName,
          rawNumber: rawNumber,
          marks: quartersMarks
        );

        userQuarters.add(userQuarter);
        quarters.add(quarter);
      }

    }

    return FinalMarkData(userFinalMark: FinalMark(
      quarters: userQuarters,
      year: userYears
    ), groupFinalMark: FinalMark(
      quarters: quarters,
      year: years
    ));
  }
 }
