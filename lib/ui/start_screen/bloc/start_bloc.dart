import 'dart:io';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:organaiser/domain/model/user/user.dart';
import 'package:organaiser/domain/repository/user.dart';

part 'start_state.dart';
part 'start_event.dart';

class StartBloc extends Bloc<CheckEvent, CheckState> {
  StartBloc() : super(InitialState()) {
    on<AppStartEvent>((event, emit) async {
      if (!GetIt.I.isRegistered<AuthorizedUser>()) {
        try {
          UserModel userModel = await GetIt.I<UserRepository>().setUser();
          GetIt.I.registerSingleton<AuthorizedUser>(AuthorizedUser(userModel: userModel));
          emit(SuccesState());
        } on FormatException catch (e) {
          switch (e.message.toString()) {
            case "503":
              emit(ServerUnavailableState());
            default:
              emit(FailureState());
          }
        } on SocketException {
          emit(ConnectionProblemState());
        }
      } else {
        emit(SuccesState());
      }
    });
  }
}
