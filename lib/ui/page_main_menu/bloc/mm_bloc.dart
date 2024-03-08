import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:organaiser/domain/model/recent_mark_model/recent_mark_model.dart';
import 'package:organaiser/domain/model/user_context_model/user_context.dart';
import 'package:organaiser/domain/repository/kundelik/data_repository.dart';

part 'mm_event.dart';
part 'mm_state.dart';

class MainMenuBloc extends Bloc<MainMenuEvent, MainMenuState> {
  MainMenuBloc() : super(InitialState()) {
    on<OnRefreshEvent>((event, emit) async {
      if (state is! SuccesState) {
        emit(LoadingState());
      }
      try {
        final List<RecentMarkModel> recentMarkModelList =
            await GetIt.I<RecentMarkRepository>().getRecentMark(
                event.userContextModel.personId,
                event.userContextModel.groupId);
        DateTime week = DateTime.now();
        final List<int> weekValue = []; 
        double midValue = 0;
        int weekMood; 

        //All mark in present week 
        for (var model in recentMarkModelList) {
          if (week.difference(model.markDate).inDays <= 7) {
            weekValue.add( int.parse(model.value));
            midValue += int.parse(model.value);
          }
        }
        midValue = midValue / weekValue.length;

        if (midValue >= 8) {
          // Super good 
          weekMood = 2;
        } else if (midValue >= 6) {
          //good 
          weekMood = 1;
        } else {
          //bad
          weekMood = 0;
        }

        emit(SuccesState(recentMarkModelList: recentMarkModelList, midValue: midValue, weekMood: weekMood));
      } on Exception {
        emit(FailureState());
      } finally {
        event.completer?.complete();
      }
    });
  }
}
