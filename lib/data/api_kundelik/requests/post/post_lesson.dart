import 'package:organaiser/data/api_kundelik/model/api_lessons_list_id/api_lessons_list_id_model.dart';
import 'package:organaiser/data/api_kundelik/requests/post/post.dart';

Future<List<ApiLessonsListIdModel>> postApiListLessonId(List<int> bodyData, String token) async {
  String uri = "/v1/lessons/many"; 
  final json = await getData(uri, token, bodyData);

  return (json as List).map((e) => ApiLessonsListIdModel.fromJson(e)).toList(); 
}
