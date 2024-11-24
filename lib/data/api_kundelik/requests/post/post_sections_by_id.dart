part of 'post.dart';

Future<List<ApiSectionModel>> postApiSectionsId(List<int> bodyData, String token) async {
  String uri = "/v2/criteriajournalsections/many";
  final json = await getData(uri, token, bodyData);

  return (json as List).map((e) => ApiSectionModel.fromJson(e)).toList();
}
