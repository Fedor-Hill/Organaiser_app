import 'package:organaiser/domain/model/edu_group.dart';

class UserModel {
  const UserModel({
    required this.userId,
    required this.personId,
    required this.schoolId,
    required this.eduGroup,
    required this.schoolName,
    required this.lastName,
    required this.firstName,
    required this.shortName,
    required this.middleName,
    required this.avatarUrl,
    required this.periodId,
    required this.numberPeriod,
    required this.year,
    required this.startPeriod,
    required this.finishPeriod,
    required this.namePeriod
  });

  final int userId, personId, schoolId;
  final EduGroup eduGroup;
  final String schoolName;
  final String firstName, lastName, shortName;
  final String? middleName;
  final String avatarUrl;


  final int? periodId, numberPeriod, year;
  final DateTime? startPeriod, finishPeriod; 
  final String? namePeriod;
}

class AuthorizedUser {
  const AuthorizedUser({required UserModel userModel}) : _userModel = userModel;

  final UserModel _userModel;

  UserModel get user => _userModel;
}
