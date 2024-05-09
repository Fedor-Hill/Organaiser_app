class FinalMark {
  FinalMark({required this.quarters, required this.year});

  final List<Quarter> quarters;
  final List<Year> year;
}

class Quarter {
  Quarter(
      {required this.subjectName,
      required this.subjectId,
      required this.rawNumber,
      required this.marks});

  final String subjectName;
  final int subjectId;
  final int rawNumber;
  final List<PersonMark> marks;
}

class Year {
  Year(
      {required this.subjectName,
      required this.subjectId,
      required this.marks});

  final String subjectName;
  final int subjectId;
  final List<PersonMark> marks;
}

class PersonMark {
  PersonMark(
      {required this.firstName,
      required this.lastName,
      required this.personId,
      required this.value,
      required this.mood});

  final String firstName, lastName;
  final int personId;
  final int value;
  final String mood;
}

class FinalMarkData {
  FinalMarkData(
      {required FinalMark userFinalMark, required FinalMark groupFinalMark})
      : _userFinalMark = userFinalMark,
        _groupFinalMark = groupFinalMark;

  FinalMark _userFinalMark;
  FinalMark _groupFinalMark;

  List<Year> get yearFinalMark => _userFinalMark.year;

  void set(FinalMarkData finalMarkData) {
    _userFinalMark = finalMarkData._userFinalMark;
    _groupFinalMark = finalMarkData._groupFinalMark;
  }

  List<Quarter> getQuarterByRawNumber(int rawNumber) {
    List<Quarter> list = [];
    for (Quarter quarter in _userFinalMark.quarters) {
      if (quarter.rawNumber == rawNumber) list.add(quarter);
    }

    return list;
  }
}
//   QuarterStatistic getQuarterStatistic(int rawNumber) {
//     double previousMidValue = 0;
//     int previousCount = 0;
//
//     for (Quarter quarter in _userFinalMark.quarters) {
//       if (quarter.rawNumber == rawNumber - 1) {
//         previousCount++; 
//         previousMidValue += quarter.marks.first.value;
//       }
//     }
//
//     for (Quarter quarter in _groupFinalMark.quarters) {
//       if (quarter.rawNumber == rawNumber) {}
//     }
//
//     return QuarterStatistic();
//   }
// }
//
// class QuarterStatistic {
//   QuarterStatistic(this.countFive, this.countFour, this.countThree,
//       this.countTwo, this.countOne,
//       {this.previousMidValue, required this.midValue, required this.isBetter});
//   final int? previousMidValue;
//   final int midValue;
//   final int? countFive, countFour, countThree, countTwo, countOne;
//   final bool isBetter;
// }
