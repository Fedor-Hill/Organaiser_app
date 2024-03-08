class SheduleModel {
  SheduleModel({required this.dayModel});

  final List<DayModel> dayModel;

}

class DayModel {
  DayModel({required this.date, required this.nextDate, required this.lessons});

  final DateTime date;
  final DateTime? nextDate;
  final List<LessonSheduleModel> lessons;
}

class LessonSheduleModel {
  LessonSheduleModel({
    required this.number,
    required this.hours,
    required this.title,
    required this.homework,
    required this.subject
    });

  final String subject, title, hours;
  final String? homework;
  final int number;
}
