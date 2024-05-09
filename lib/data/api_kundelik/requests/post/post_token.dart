import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:organaiser/data/storage/storage_service.dart';

class Token {
<<<<<<< HEAD
  static const String uri =
      'https://api.kundelik.kz/v1/authorizations/bycredentials';
  static const String clinetIdentifier = "387d44e3-e0c9-4265-a9e4-a4caaad5111c";
  static const String clientSecret = "8a7d709c-fdbb-4047-b0ea-8947afe89d67";

  final StorageService storage = StorageService();

  Future<String> checkToken() async {
    String? accessToken = await storage.readStorage("accessToken");
    if (accessToken == null) {
      String? accessToken = await storage.readStorage("accessToken");
      if (accessToken == null) {
        return "null"; 
=======
  static const String _uri =
      'https://api.kundelik.kz/v1/authorizations/bycredentials';
  static const String _clinetIdentifier =
      "387d44e3-e0c9-4265-a9e4-a4caaad5111c";
  static const String _clientSecret = "8a7d709c-fdbb-4047-b0ea-8947afe89d67";

  final StorageService _storage = StorageService();

  Future<String> checkToken() async {
    String? accessToken = await _storage.readStorage("accessToken");
    if (accessToken == null) {
      String? accessToken = await _storage.readStorage("accessToken");
      if (accessToken == null) {
        return "null";
>>>>>>> 18c7d66 (version 3.0.1)
      } else {
        return accessToken;
      }
    } else {
      return accessToken;
    }
  }

  Future<String> createToken(String login, String password) async {
    Map<String, String> bodyData = <String, String>{
      "grant_type": "password",
<<<<<<< HEAD
      "client_id": clinetIdentifier,
      "client_secret": clientSecret,
=======
      "client_id": _clinetIdentifier,
      "client_secret": _clientSecret,
>>>>>>> 18c7d66 (version 3.0.1)
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

<<<<<<< HEAD
    final response = await http.post(Uri.parse(uri),
        headers: headersData, body: const JsonEncoder().convert(bodyData));

    if (response.statusCode == 200) {
      final rawData = jsonDecode(response.body);
      Map<String, dynamic> data = rawData;

      String accessToken = data['accessToken'];
      String refreshToken = data['refreshToken'];

      await storage.writeStorage("accessToken", accessToken);
      await storage.writeStorage("refreshToken", refreshToken);
      return accessToken;
    } else {
      throw const FormatException("loginInvalid");
=======
    final response = await http.post(Uri.parse(_uri),
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
>>>>>>> 18c7d66 (version 3.0.1)
    }
  }

  Future<void> deleteToken() async {
<<<<<<< HEAD
    await storage.deleteStorage('accessToken');
    await storage.deleteStorage('refreshToken');
=======
    await _storage.deleteStorage('accessToken');
    await _storage.deleteStorage('refreshToken');
>>>>>>> 18c7d66 (version 3.0.1)
  }
}
