class Person {
  const Person(
      {required this.personId,
      required this.firstName,
      required this.lastName,
      required this.middleName,
      required this.sex});
  final int personId;
  final String firstName, lastName;
  final String? middleName;
  final String sex;

  String getFullName() => "$lastName $firstName $middleName";
}

class PersonData {
  PersonData({required List<Person> persons}) : _persons = persons;

  final List<Person> _persons;

  List<Person> get persons => _persons;
}
