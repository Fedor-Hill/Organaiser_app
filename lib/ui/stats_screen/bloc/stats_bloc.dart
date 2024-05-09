import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:organaiser/domain/model/edu_group.dart';
import 'package:organaiser/domain/model/mark/final_mark.dart';
import 'package:organaiser/domain/repository/widget_data.dart';


part 'stats_state.dart';
part 'stats_event.dart';

class StatsBloc extends Bloc<StatsEvent, StatsState> {
  StatsBloc() : super(InitialState()) {

    on<FirstStartEvent>((event, emit) async {
      if (!GetIt.I.isRegistered<FinalMarkData>()) {
        try {
          FinalMarkData subjectFinalMarkData = await GetIt.I<WidgetDataRepository>().
            getFinalMarks(null);
          GetIt.I.registerSingleton<FinalMarkData>(subjectFinalMarkData);

          EduGroupData eduGroupData = await GetIt.I<WidgetDataRepository>().
            getUserEduGroupAll();
          GetIt.I.registerSingleton<EduGroupData>(eduGroupData);

          emit(SuccesState());
        } catch(e) {
          emit(FailureState(e: e));
        }
      } else {
        emit(SuccesState());
      }
      
    });

    on<ChangeDataEvent>((event, emit) async {
      emit(LoadState());
      try {
        FinalMarkData subjectFinalMarkData = await GetIt.I<WidgetDataRepository>().
            getFinalMarks(event.eduGroupId);

        GetIt.I<FinalMarkData>().set(subjectFinalMarkData);

        emit(SuccesState());
      } catch(e) {
        emit(FailureState(e: e));
      }
    });
  }

  
}
