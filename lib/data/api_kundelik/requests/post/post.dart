import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;

Future getData(String sUri, token, List<int> bodyData) async {
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
