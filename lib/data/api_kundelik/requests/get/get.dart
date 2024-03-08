import 'dart:async';

import 'package:http/http.dart' as http;

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

  if (response.statusCode == 200) {
    return response.body;
  } else if (response.statusCode == 401) {
    throw const FormatException("invalidToken");
  } else if (response.statusCode == 503) {
    throw const FormatException("ServerUnavailable");
  } else {
    throw const FormatException("Problem UwU");
  }
}
