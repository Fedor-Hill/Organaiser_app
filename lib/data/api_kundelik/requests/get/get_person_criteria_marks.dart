part of 'get.dart';


Future<List<ApiCriteriaMarks>> getApiPersonCriteriaMark(int person, int eduGroup, String token) async {
  String path = '/v2/edu-group/$eduGroup/person/$person/criteria-marks';
  // String path = '/v2/edu-group/$eduGroup/person/1000002768847/criteria-marks';
  final rawData = await getData(path, token, null);

  print(rawData);

  Iterable data = json.decode(rawData);
  return (data as List).map((e) => ApiCriteriaMarks.fromJson(e)).toList();
}
