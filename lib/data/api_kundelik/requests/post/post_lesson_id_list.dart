part of 'post.dart';

Future<List<ApiLesson>> postApiListLessonId(List<int> bodyData, String token) async {
  String uri = "/v1/lessons/many";
  final json = await getData(uri, token, bodyData);

  return (json as List).map((e) => ApiLesson.fromJson(e)).toList();
}
