class EduGroupsDetails {

  final int id;
  final int? parallel;
  final int? timetable;
  final int? studyyear;
  final String type;
  final String name;
  final String status;
  final String journaltype;
  final String? fullName;
  final List? parentIds; 
  final String timetableStr;
  final List? parentIdsStr;

  EduGroupsDetails({
    required this.id,
    required this.parallel,
    required this.timetable,
    required this.studyyear,
    required this.type,
    required this.name,
    required this.fullName,
    required this.status,
    required this.journaltype,
    required this.parentIds,
    required this.timetableStr,
    required this.parentIdsStr,
  });

  factory EduGroupsDetails.toList(Map<String, dynamic> e) {
    return EduGroupsDetails(
        id: e['id'], 
        parallel: e['parallel'], 
        timetable: e['timetable'], 
        studyyear: e['studyyear'], 
        type: e['type'], 
        name: e['name'], 
        fullName: e['fullName'], 
        status: e['status'],
        journaltype: e['journaltype'],
        parentIds: e['parentIds'], 
        timetableStr: e['timetableStr'], 
        parentIdsStr: e['parentIdsStr'],
        );
  }
}
