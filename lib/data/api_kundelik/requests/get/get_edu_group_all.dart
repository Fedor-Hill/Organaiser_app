part of 'get.dart';

Future<List<ApiEduGroup>> getApiEduGroupsAll(int personId, String token) async {
  String url = "/v2/persons/$personId/edu-groups/all";
  final rawData = await getData(url, token, null);

  Iterable data = json.decode(rawData);
  return (data as List).map((e) => ApiEduGroup.fromJson(e)).toList();
}
