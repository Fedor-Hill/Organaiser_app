import 'package:organaiser/data/api_kundelik/requests/post/post.dart';

Future<void> postApiCriteriaMarks(List<int> arraySection, String token) async {
  String uri = "/v2/criteriajournalsections/many"; 
  final json = await getData(uri, token, arraySection);
  print(json);

}
