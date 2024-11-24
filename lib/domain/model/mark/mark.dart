part 'criteria_mark.dart';
part 'recent_mark.dart';

class Mark {
  const Mark(
      {required this.subject,
      required this.value,
      required this.mood,
      required this.markDate});

  final String subject;
  final int value;
  final String mood;
  final DateTime markDate;
}
