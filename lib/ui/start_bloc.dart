import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

//Model
import 'package:organaiser/domain/model/user_context_model/user_context.dart';
import 'package:organaiser/domain/repository/kundelik/user_repository.dart';

part 'start_state.dart';
part 'start_event.dart';

//Is there a login to the application?
//If yes, they return to home screen, else they return to login screen
class CheckingBloc extends Bloc<CheckEvent, CheckState> {
  CheckingBloc() : super(InitialState()) {
    on<OnAppStartEvent>((event, emit) async {
      try {
        final UserContextModel userContextModel =
            await GetIt.I<UserRepository>().getUser();
        emit(SuccesState(userContextModel: userContextModel));
      } on FormatException catch (e) {
        //the message find in get.dart 
        if (e.message.compareTo("invalidToken") == 0) {
          emit(FailureState());
        } else if (e.message.compareTo("ServerUnavailable") == 0) {
          emit(ServerUnavailableState());
        } else {
          emit(ServerProblemState());
        }
      } catch (e) {
        emit(ServerProblemState());
      }
    });
  }
}
