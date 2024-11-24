part of 'get.dart';

Future<ApiUserContextModel> getApiUserContext(String token) async {
  const String path = '/v1/users/me/context';

  final rawData = await getData(path, token, null);
  final Map<String, dynamic> data = json.decode(rawData);

  return ApiUserContextModel.fromJson(data);
}
