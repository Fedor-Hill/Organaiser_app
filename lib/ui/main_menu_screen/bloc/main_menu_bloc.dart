import 'dart:async';
import 'dart:io';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:organaiser/domain/model/mark/mark.dart';
import 'package:organaiser/domain/repository/widget_data.dart';

part 'main_menu_event.dart';
part 'main_menu_state.dart';

class MainMenuBloc extends Bloc<MainMenuEvent, MainMenuState> {
  MainMenuBloc() : super(InitialState()) {
    on<RefreshEvent>((event, emit) async {
      if (state is! SuccesState) {
        emit(LoadingState());
      }
      if (!GetIt.I.isRegistered<RecentMarkData>()) {
        try {
          final RecentMarkData recentMarks = await GetIt.I<WidgetDataRepository>().getRecentMarks();
          GetIt.I.registerSingleton<RecentMarkData>(recentMarks);
          emit(SuccesState());
        } on SocketException {
          emit(ConnectionProblemState());
        } catch(e) {
          print(e.toString());
          emit(FailureState());
        } finally {
          event.completer?.complete();
        }
      } else {
        emit(SuccesState());
      }
    });
  }
}
