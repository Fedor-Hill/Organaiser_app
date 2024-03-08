// Model
import 'package:organaiser/domain/model/person_model/person_model.dart';
import 'package:organaiser/domain/model/recent_mark_model/recent_mark_model.dart';
import 'package:organaiser/domain/model/user_context_model/user_context.dart';
import 'package:organaiser/domain/model/shedule_model/shedule_model.dart';


abstract class UserContextRepository {
  Future<UserContextModel> getUserContext();
}

abstract class RecentMarkRepository {
  Future<List<RecentMarkModel>> getRecentMark(int personId, int groupId);
}

abstract class SheduleRepository {
  Future<SheduleModel> getShedule(int personId, int groupId, DateTime fromDate, DateTime endDate, int schoolId);
}

abstract class PersonsRepository {
  Future<List<PersonModel>> getPersons(int groupId); 
}

abstract class CriteriaJournalMarksRepository {
  Future<void> getFinalMarks(int groupId, int personId); 
}
