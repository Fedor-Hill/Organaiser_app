part of 'get.dart';

Future<List<ApiFinalMarksModel>> getApiFinalMarks(int groupId, String token) async {
  String uri = "/v2/edu-group/$groupId/criteria-marks-totals-light";

  final rawData = await getData(uri, token, null);
  Iterable data = json.decode(rawData);

  return (data as List).map((e) => ApiFinalMarksModel.fromJson(e)).toList();
}
