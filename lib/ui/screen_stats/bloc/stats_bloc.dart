import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:organaiser/domain/model/user_context_model/user_context.dart';
import 'package:organaiser/domain/repository/kundelik/data_repository.dart';

part 'stats_state.dart';
part 'stats_event.dart';

class StatsBloc extends Bloc<StatsEvent, StatsState> {
  StatsBloc({required this.userContextModel}) : super(InitialState()) {
    on<BtnPressed>(
      (event, emit) async {
        try {
          await GetIt.I<CriteriaJournalMarksRepository>().getFinalMarks(
              userContextModel.groupId, userContextModel.personId);
          emit(SuccesState());
        } catch (e) {
          emit(FailureState());
        }
      },
    );

  }

  final UserContextModel userContextModel; 
}
