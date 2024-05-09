import 'dart:async';
<<<<<<< HEAD

import 'package:http/http.dart' as http;
=======
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:organaiser/data/api_kundelik/model/api_criteria_mark_total_l_model/api_criteria_mark_total_l_model.dart';
import 'package:organaiser/data/api_kundelik/model/api_homework_model/api_homework_model.dart';
import 'package:organaiser/data/api_kundelik/model/api_person_criteria_marks/api_person_criteria_marks_model.dart';
import 'package:organaiser/data/api_kundelik/model/api_recent_marks/api_recent_marks_model.dart';
import 'package:organaiser/data/api_kundelik/model/api_shedule_model/api_shedule_model.dart';
import 'package:organaiser/data/api_kundelik/model/api_reporting_periods/api_reporting_periods_model.dart';
import 'package:organaiser/data/api_kundelik/model/api_user_context/api_user_context.dart';
import 'package:organaiser/data/api_kundelik/model/general/api_person.dart';

part 'get_user_context.dart';
part 'get_recent_marks.dart';
part 'get_shedule.dart';
part 'get_homework.dart';
part 'get_reporting_periods.dart';
part 'get_person_criteria_marks.dart';
part 'get_final_mark.dart';
part 'get_edu_group_all.dart';
part 'get_persons.dart';
>>>>>>> 18c7d66 (version 3.0.1)

Future getData(
  String path, String token, Map<String, dynamic>? queryParameters) async {
  String mainUri = 'api.kundelik.kz';
  final http.Response response;

  Map<String, String> headers = <String, String>{
    "Content-Type": "application/json",
    "accept": "application/json",
    "Access-Token": token,
  };

  if (queryParameters != null) {
    response = await http.get(Uri.https(mainUri, path, queryParameters),
        headers: headers);
  } else {
    response = await http.get(Uri.https(mainUri, path), headers: headers);
  }

<<<<<<< HEAD
  if (response.statusCode == 200) {
    return response.body;
  } else if (response.statusCode == 401) {
    throw const FormatException("invalidToken");
  } else if (response.statusCode == 503) {
    throw const FormatException("ServerUnavailable");
  } else {
    throw const FormatException("Problem UwU");
  }
=======
  // print(response.body);


  switch (response.statusCode) {

    // STATUS: OK
    case 200:
      return response.body;

    case 401:
      // STATUS: Invalid token 
      throw const FormatException("401");

    case 403:
      //STATUS: authorizationFailed
      throw const FormatException("403");

    case 503: 
      //STATUS: Problem with Server
      throw const FormatException("503"); 
      
    default:
      throw const FormatException("Problem UwU");
  }

>>>>>>> 18c7d66 (version 3.0.1)
}
