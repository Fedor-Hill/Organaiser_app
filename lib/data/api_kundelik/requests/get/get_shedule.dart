<<<<<<< HEAD
import 'dart:convert';

import 'package:organaiser/data/api_kundelik/requests/get/get.dart';
import 'package:organaiser/data/api_kundelik/model/api_shedule/api_shedule_model.dart';
=======
part of 'get.dart';
>>>>>>> 18c7d66 (version 3.0.1)

Future getApiShedule(int personId, int groupId, DateTime fromDate, DateTime endDate, String token) async {
  String url = "/v1/persons/$personId/groups/$groupId/schedules";
  Map<String, String> queryParameters = {
<<<<<<< HEAD
    "startDate": fromDate.toIso8601String(), 
    "endDate": endDate.toIso8601String() 
  }; 
=======
    "startDate": fromDate.toIso8601String(),
    "endDate": endDate.toIso8601String()
  };

>>>>>>> 18c7d66 (version 3.0.1)

  final rawData = await getData(url, token, queryParameters);
  final Map<String, dynamic> data = json.decode(rawData);

<<<<<<< HEAD
=======

>>>>>>> 18c7d66 (version 3.0.1)
  return ApiSheduleModel.fromJson(data);
}
