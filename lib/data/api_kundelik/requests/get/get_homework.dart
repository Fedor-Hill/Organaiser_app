part of 'get.dart';

Future<ApiHomeWorkModel> getApiHomeWorks(int personId, int schoolId,
    DateTime fromDate, DateTime endDate, String token) async {

  String path = '/v1/persons/$personId/school/$schoolId/homeworks';
  Map<String, String> queryParameters = {
    "startDate": fromDate.toIso8601String(),
    "endDate": endDate.toIso8601String()
  };

  final rawData = await getData(path, token, queryParameters);
  final Map<String, dynamic> data = json.decode(rawData);

  return ApiHomeWorkModel.fromJson(data);
}
