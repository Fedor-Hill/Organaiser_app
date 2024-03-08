import 'dart:convert';

import 'package:organaiser/data/api_kundelik/requests/get/get.dart';

Future<void> getApiCriteriaMarks(int groupId, int personId, String token) async {
  String path = '/v2/users/me/feed';

  try {
    final rawData = await getData(path, token, null);
    print(rawData);
  } catch (e) {
    print(e.toString());
  }
  
}
