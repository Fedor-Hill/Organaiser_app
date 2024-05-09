<<<<<<< HEAD
import 'dart:convert';

import 'package:organaiser/data/api_kundelik/model/api_person/api_person_model.dart';
import 'package:organaiser/data/api_kundelik/requests/get/get.dart';

Future<List<ApiPersonModel>> getApiPersons(int groupId, String token) async {
=======
part of 'get.dart';

Future<List<ApiPerson>> getApiPersons(int groupId, String token) async {
>>>>>>> 18c7d66 (version 3.0.1)
  const String path = '/v1/persons';
  Map<String, String> queryParameters = {"eduGroup": groupId.toString()};
  final rawData = await getData(path, token, queryParameters);

  Iterable i = json.decode(rawData);
<<<<<<< HEAD
  List<ApiPersonModel> list = List<ApiPersonModel>.from(
      i.map((model) => ApiPersonModel.fromJson(model)));
  return list;
=======
  return List<ApiPerson>.from(i.map((model) => ApiPerson.fromJson(model)));
>>>>>>> 18c7d66 (version 3.0.1)
}
