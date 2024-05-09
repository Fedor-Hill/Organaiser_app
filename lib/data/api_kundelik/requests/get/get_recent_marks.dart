<<<<<<< HEAD
import 'dart:convert';

import 'package:organaiser/data/api_kundelik/model/api_recent_marks/api_recent_marks_model.dart';
import 'package:organaiser/data/api_kundelik/requests/get/get.dart';

Future<ApiRecentMarksModel> getApiRecentMark(int personId, int groupId, String token) async {
  String url = "/v1/persons/$personId/group/$groupId/recentmarks"; 

  final rawData = await getData(url, token, null);

  final Map<String, dynamic> data = json.decode(rawData);

  // String urlTest = "/v1/edu-groups/$groupId/reporting-period-group"; // /v2/edu-groups/{eduGroup}/reporting-periods
  // final rawDataTest = await getData(urlTest, token, null);
  // print(rawDataTest);
  
  // int peroid = 2120551935349716683;
  // String urlThree = "/v2/edu-group/$groupId/period/$peroid/criteria-marks"; 
  // final rawDataThree = await getData(urlThree, token, null);
  // print(rawDataThree);
  // const int period = 3; 
  // String urlTwo = "/v2/edu-group/$groupId/person/$personId/criteria-marks-totals-light";
  // String urlTwo = "/v1/edu-group/$groupId/person/$personId/criteria-marks"; 

  // final rawDataTwo = await getData(urlTwo, token, null);
  // print(rawDataTwo);


  return ApiRecentMarksModel.fromJson(data);
=======
part of 'get.dart';

Future<ApiRecentMarks> getApiRecentMarks(int personId, int groupId, String token) async {
  String url = "/v2/persons/$personId/group/$groupId/recentmarks";
  Map<String, String> queryParameters = {
    "limit": "7",
  };

  final rawData = await getData(url, token, queryParameters);
  final Map<String, dynamic> data = json.decode(rawData);
  return ApiRecentMarks.fromJson(data);
>>>>>>> 18c7d66 (version 3.0.1)
}
