class PersonModel {
  const PersonModel(
      {required this.userId,
      required this.firstName,
      required this.lastName,
      required this.middleName,
      required this.shortName,
      required this.sex});
  final int userId;
  final String firstName, lastName, middleName, shortName, sex;
}
