import 'package:organaiser/data/api_kundelik/model/api_person/api_person_model.dart';
import 'package:organaiser/domain/model/person_model/person_model.dart';

class PersonsMapper {
  static List<PersonModel> fromApi(List<ApiPersonModel> apiPersonModel) {
    List<PersonModel> list = [];

    for (var element in apiPersonModel) {
      PersonModel personModel = PersonModel(
        sex: element.sex,
        firstName: element.firstName,
        lastName: element.lastName,
        middleName: element.middleName,
        shortName: element.shortName,
        userId: element.userId
      );
      list.add(personModel);
    }

    return list;
  }
}
