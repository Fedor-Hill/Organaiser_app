import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

//Model
import 'package:organaiser/domain/model/user_context_model/user_context.dart';
import 'package:organaiser/domain/repository/kundelik/user_repository.dart';

part 'login_event.dart';
part 'login_state.dart';

//Is there a login to the application?
//If yes, they return to home screen, else they return to login screen
class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(InitialState()) {
    on<ButtonPressedEvent>(((event, emit) async {
      try {
        final UserContextModel userContextModel =
            await GetIt.I<UserRepository>().setUser(event.login, event.password);

        emit(SuccesState(userContextModel: userContextModel));

      } on FormatException catch (e) {
        if (e.message.compareTo("loginInvalid") == 0) {
          emit(FailureState());
        } else {
          emit(ServerProblemState());
        }
      }
    }));
  }
}
