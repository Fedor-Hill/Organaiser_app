import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:organaiser/data/api_kundelik/model/api_lesson_model/api_lesson_model.dart';
import 'package:organaiser/data/api_kundelik/model/api_section_model/api_section_model.dart';

part 'post_lesson_id_list.dart';
part 'post_sections_by_id.dart';

Future getData(String sUri, token, List<int>? bodyData) async {
  const String fUri = 'https://api.kundelik.kz';
  final String uri = '$fUri$sUri';

  Map<String, String> headersData = <String, String> {
    "Content-Type": "application/json",
    "accept": "application/json",
    "Access-Token": "$token",
  };

  final response = await http
        .post(Uri.parse(uri),
            headers: headersData,
            body: json.encode(bodyData),
            );

  if (response.statusCode == 200) {
    //final Map<String, dynamic> rawData = json.decode(response.body);
    final rawData = json.decode(response.body);
    return rawData;
  } 

  if (response.statusCode == 401) {
    return response.statusCode;
  }

  return null;
}
