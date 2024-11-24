import 'package:organaiser/domain/model/edu_group.dart';
import 'package:organaiser/domain/model/mark/final_mark.dart';
import 'package:organaiser/domain/model/mark/mark.dart';
import 'package:organaiser/domain/model/shedule.dart';

abstract class WidgetDataRepository {

  Future<RecentMarkData> getRecentMarks();

  Future<Shedule> getShedule(DateTime fromDate, DateTime endDate);

  Future<FinalMarkData> getFinalMarks(int? eduGroupId);

  Future<EduGroupData> getUserEduGroupAll();

}
