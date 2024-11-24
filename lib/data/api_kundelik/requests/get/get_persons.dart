part of 'get.dart';

Future<List<ApiPerson>> getApiPersons(int groupId, String token) async {
  const String path = '/v1/persons';
  Map<String, String> queryParameters = {"eduGroup": groupId.toString()};
  final rawData = await getData(path, token, queryParameters);

  Iterable i = json.decode(rawData);
  return List<ApiPerson>.from(i.map((model) => ApiPerson.fromJson(model)));
}
