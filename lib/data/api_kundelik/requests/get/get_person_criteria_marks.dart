part of 'get.dart';


Future<List<ApiCriteriaMarks>> getApiPersonCriteriaMark(int person, int eduGroup, String token) async {
  String path = '/v2/edu-group/$eduGroup/person/$person/criteria-marks';
  final rawData = await getData(path, token, null);

  Iterable data = json.decode(rawData);
  return (data as List).map((e) => ApiCriteriaMarks.fromJson(e)).toList();
}
