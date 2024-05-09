import 'dart:io';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:organaiser/domain/model/shedule.dart';
import 'package:organaiser/domain/repository/widget_data.dart';

part 'shedule_state.dart';
part 'shedule_event.dart';

class SheduleBloc extends Bloc<SheduleEvent, SheduleState> {
  SheduleBloc() : super(InitialState()) {
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
        final Shedule sheduleModel =
            await GetIt.I<WidgetDataRepository>().getShedule(
          date, // from date
          date // End date
        );
        emit(SuccesState(shedule: sheduleModel));
      } on SocketException {
        emit(ConnectionProblemState());
      } catch (e) {
        emit(FailureState());
      }
    });
  }

  final DateTime today = DateTime.utc(
      DateTime.now().year, DateTime.now().month, DateTime.now().day);

  late DateTime date = DateTime.utc(today.year, today.month, today.day);
}
