import 'package:organaiser/data/api_kundelik/model/general/api_person.dart';
import 'package:organaiser/domain/model/person.dart';

class PersonMapper {
  static PersonData fromApi(List<ApiPerson> apiPersons) {
    List<Person> persons = [];

    for (var element in apiPersons) {
      Person person = Person(
        sex: element.sex,
        firstName: element.firstName,
        lastName: element.lastName,
        middleName: element.middleName,
        personId: element.userId
      );
      persons.add(person);
    }

    return PersonData(persons: persons);
  }
}
