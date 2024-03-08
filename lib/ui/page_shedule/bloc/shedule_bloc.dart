import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:organaiser/domain/model/shedule_model/shedule_model.dart';
import 'package:organaiser/domain/model/user_context_model/user_context.dart';

import 'package:organaiser/domain/repository/kundelik/data_repository.dart';

part 'shedule_state.dart';
part 'shedule_event.dart';

class SheduleBloc extends Bloc<SheduleEvent, SheduleState> {
  SheduleBloc({required this.userContextModel}) : super(InitialState()) {
    on<OnDateIncrement>((event, emit) {
      date = date.add(const Duration(days: 1));
      add(OnGetShedule());
    });
    on<OnDateDecrement>((event, emit) {
      date = date.add(const Duration(days: -1));
      add(OnGetShedule());
    });
    on<OnDateToday>(((event, emit) {
      date = today;
      add(OnGetShedule());
    }));

    on<OnGetShedule>((event, emit) async {
      // if (state is! SuccesState) {
      //   emit(LoadingState());
      // }
      emit(LoadingState());
      try {
        final SheduleModel sheduleModel =
            await GetIt.I<SheduleRepository>().getShedule(
                userContextModel.personId,
                userContextModel.groupId,
                date, // from date
                date, // End date
                userContextModel.schoolId);
        emit(SuccesState(sheduleModel: sheduleModel));
      } catch (e) {
        emit(FailureState());
      }
    });
  }

  final UserContextModel userContextModel;
  final DateTime today = DateTime.utc(
      DateTime.now().year, DateTime.now().month, DateTime.now().day);

  late DateTime date = DateTime.utc(today.year, today.month, today.day);
}
