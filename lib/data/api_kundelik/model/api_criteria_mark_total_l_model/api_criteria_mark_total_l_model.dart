import 'package:json_annotation/json_annotation.dart';
part 'api_criteria_mark_total_l_model.g.dart';

@JsonSerializable()
class ApiFinalMarksModel {
  ApiFinalMarksModel(
      {required this.subjectName,
      required this.subjectId,
      required this.finalMarksDetail,
      required this.summaries});

  @JsonKey(name: "SubjectName")
  final String subjectName;
  @JsonKey(name: "SubjectId")
  final int subjectId;

  @JsonKey(name: "FinalMarks")
  final List<FinalMarksDetail> finalMarksDetail;

  @JsonKey(name: "Summaries")
  final List<Summaries> summaries;

  factory ApiFinalMarksModel.fromJson(Map<String, dynamic> json) =>
      _$ApiFinalMarksModelFromJson(json);
}

@JsonSerializable()
class FinalMarksDetail {
  const FinalMarksDetail(
      {required this.personFinalMarks,
      required this.period});

  @JsonKey(name: "Period")
  final Period period;

  @JsonKey(name: "FinalMarks")
  final List<PersonFinalMarks> personFinalMarks;

  factory FinalMarksDetail.fromJson(Map<String, dynamic> json) =>
      _$FinalMarksDetailFromJson(json);
}

@JsonSerializable()
class Summaries {
  Summaries({required this.student, required this.mark});

  @JsonKey(name: "Student")
  final Student student;
  @JsonKey(name: "TotalMark")
  final Mark? mark;

  factory Summaries.fromJson(Map<String, dynamic> json) =>
      _$SummariesFromJson(json);
}

@JsonSerializable()
class Period {
  const Period(
      {required this.periodNumber,
      required this.dateFinish,
      required this.dateStart,
      required this.id});
  @JsonKey(name: "Id")
  final int id;
  @JsonKey(name: "PeriodNumber")
  final PeriodNumber periodNumber;
  @JsonKey(name: "DateStart")
  final DateTime dateStart;
  @JsonKey(name: "DateFinish")
  final DateTime dateFinish;

  factory Period.fromJson(Map<String, dynamic> json) => _$PeriodFromJson(json);
}

@JsonSerializable()
class PeriodNumber {
  const PeriodNumber({required this.rawNumber});

  @JsonKey(name: "RawNumber")
  final int rawNumber;

  factory PeriodNumber.fromJson(Map<String, dynamic> json) =>
      _$PeriodNumberFromJson(json);
}

@JsonSerializable()
class PersonFinalMarks {
  const PersonFinalMarks({required this.mark, required this.student});

  @JsonKey(name: "Student")
  final Student student;

  @JsonKey(name: "Mark")
  final Mark? mark;

  factory PersonFinalMarks.fromJson(Map<String, dynamic> json) =>
      _$PersonFinalMarksFromJson(json);
}

@JsonSerializable()
class Student {
  const Student({required this.personName, required this.personId});
  @JsonKey(name: "PersonId")
  final int personId;
  @JsonKey(name: "PersonName")
  final PersonName personName;

  factory Student.fromJson(Map<String, dynamic> json) =>
      _$StudentFromJson(json);
}

@JsonSerializable()
class PersonName {
  const PersonName(
      {required this.firstName,
      required this.lastName,
      required this.middleName});

  @JsonKey(name: "LastName")
  final String lastName;
  @JsonKey(name: "FirstName")
  final String firstName;
  @JsonKey(name: "MiddleName")
  final String? middleName;

  factory PersonName.fromJson(Map<String, dynamic> json) =>
      _$PersonNameFromJson(json);
}

@JsonSerializable()
class Mark {
  const Mark({required this.value});

  @JsonKey(name: "Value")
  final double? value;

  factory Mark.fromJson(Map<String, dynamic> json) => _$MarkFromJson(json);
}
