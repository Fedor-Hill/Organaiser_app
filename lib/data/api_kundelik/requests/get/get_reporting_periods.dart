part of 'get.dart';


Future<List<ApiReportingPeriods>> getApiReportingPeriods(int eduGroup, String token) async {
  String path = '/v2/edu-groups/$eduGroup/reporting-periods';

  final rawData = await getData(path, token, null);
  Iterable data = json.decode(rawData);

  return (data as List).map((e) => ApiReportingPeriods.fromJson(e)).toList();
}
