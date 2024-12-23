part of 'get.dart';

Future getApiShedule(int personId, int groupId, DateTime fromDate, DateTime endDate, String token) async {
  String url = "/v1/persons/$personId/groups/$groupId/schedules";
  Map<String, String> queryParameters = {
    "startDate": fromDate.toIso8601String(), 
    "endDate": endDate.toIso8601String() 
  }; 

  final rawData = await getData(url, token, queryParameters);
  final Map<String, dynamic> data = json.decode(rawData);
  return ApiSheduleModel.fromJson(data);
}
