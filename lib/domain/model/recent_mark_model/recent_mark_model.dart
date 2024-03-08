import 'package:equatable/equatable.dart';

class RecentMarkModel extends Equatable {
  const RecentMarkModel({
    required this.subject,
    required this.lesson,
    required this.value,
    required this.mood,
    required this.markDate,
    required this.lessonDate,
    required this.isNewTitle
  });

  final String subject, lesson, value, mood;
  final DateTime markDate, lessonDate;
  final bool isNewTitle;

  @override
  List<Object> get props => [subject, lesson, value, mood, markDate, lessonDate, isNewTitle];
}
