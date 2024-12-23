import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:organaiser/data/storage/storage_service.dart';

class Token {
  static const String uri =
      'https://api.kundelik.kz/v1/authorizations/bycredentials';
  static const String _clinetIdentifier = "387d44e3-e0c9-4265-a9e4-a4caaad5111c";
  static const String _clientSecret = "8a7d709c-fdbb-4047-b0ea-8947afe89d67";

  final StorageService _storage = StorageService();

  Future<String> checkToken() async {
    String? accessToken = await _storage.readStorage("accessToken");
    if (accessToken == null) {
        return "null";
      } else {
        return accessToken;
      }
  }
  

  Future<String> createToken(String login, String password) async {
    Map<String, String> bodyData = <String, String>{
      "grant_type": "password",
      "client_id": _clinetIdentifier,
      "client_secret": _clientSecret,
      "username": login,
      "password": password,
      "scope": "Schools,Relatives,EduGroups,Lessons,marks,EduWorks,Avatar,"
          "EducationalInfo,CommonInfo,ContactInfo,FriendsAndRelatives,"
          "Files,Wall,Messages",
    };

    Map<String, String> headersData = <String, String>{
      "Content-Type": "application/json",
      "accept": "application/json",
    };

    final response = await http.post(Uri.parse(uri),
        headers: headersData, body: const JsonEncoder().convert(bodyData));

    // print(response.statusCode);
    // print(response.body);

    switch (response.statusCode) {
      case 200:
        final rawData = jsonDecode(response.body);
        Map<String, dynamic> data = rawData;

        String accessToken = data['accessToken'];
        String refreshToken = data['refreshToken'];

        await _storage.writeStorage("accessToken", accessToken);
        await _storage.writeStorage("refreshToken", refreshToken);
        return accessToken;

      case 401:
        throw const FormatException("401");

      case 403:
        //STATUS: authorizationFailed
        throw const FormatException("403");

      case 503:
        //STATUS: serverProblem
        throw const FormatException("503");

      default:
        throw const FormatException("Problem UwU");
    }
  }

  Future<void> deleteToken() async {
    await _storage.deleteStorage('accessToken');
    await _storage.deleteStorage('refreshToken');
  }
}
