class UserContextModel {
  const UserContextModel({
    required this.userId,
    required this.personId,
    required this.groupId,
    required this.schoolId,
    required this.parallel,
    required this.timetable,
    required this.firstName,
    required this.lastName, 
    required this.middleName,
    required this.schoolName,
    required this.parallelStr,
    required this.avatarUrl
  });

  final int userId, personId, groupId, schoolId, parallel; 
  final int? timetable;
  final String firstName, lastName, middleName, schoolName, parallelStr, avatarUrl;
}
