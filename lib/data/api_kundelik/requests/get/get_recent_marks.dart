part of 'get.dart';

Future<ApiRecentMarks> getApiRecentMarks(int personId, int groupId, String token) async {
  String url = "/v2/persons/$personId/group/$groupId/recentmarks";

  Map<String, String> queryParameters = {
    "limit": "7",
  };

  final rawData = await getData(url, token, queryParameters);
  final Map<String, dynamic> data = json.decode(rawData);
  return ApiRecentMarks.fromJson(data);
}
