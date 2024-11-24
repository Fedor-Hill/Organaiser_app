part of 'mark.dart';

class RecentMark extends Mark {
  const RecentMark(
      {required super.subject,
      required super.value,
      required super.markDate,
      required this.title,
      required this.lessonDate, required super.mood});

  final String title;
  final DateTime lessonDate;
}

class RecentMarkData {
  RecentMarkData({required List<Mark> list}) : _list = list;

  final List<Mark> _list;

  List<Mark> get recentMarks => _list;

  RecentMarkStats getStats() {
    double midValue = 0;
    int count = 0;

    for (int i = 0; i < _list.length; i++) {
      if (_list[i] is RecentMark) {
        count++; 
        midValue += _list[i].value;
      }
    }

    if (count > 0) midValue = midValue / count;

    return RecentMarkStats(
      mood: midValue >= 8 ? 0 : midValue >= 5 ? 1 : 2,
      midValue: midValue,
      count: count
    );
  }

}

class RecentMarkStats {
  RecentMarkStats({required this.mood, required this.midValue, required this.count});

  // 0 - good, 1 - average, 2 - bad
  final int mood;
  final double midValue;
  final int count;
}
