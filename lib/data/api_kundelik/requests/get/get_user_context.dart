<<<<<<< HEAD
import 'dart:convert';

import 'package:organaiser/data/api_kundelik/requests/get/get.dart';
import 'package:organaiser/data/api_kundelik/model/api_user_context/api_user_context_model.dart';
=======
part of 'get.dart';
>>>>>>> 18c7d66 (version 3.0.1)

Future<ApiUserContextModel> getApiUserContext(String token) async {
  const String path = '/v1/users/me/context';

  final rawData = await getData(path, token, null);
<<<<<<< HEAD
=======
  // print(rawData);
>>>>>>> 18c7d66 (version 3.0.1)
  final Map<String, dynamic> data = json.decode(rawData);

  return ApiUserContextModel.fromJson(data);
}
