import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:organaiser/domain/model/user/user.dart';
import 'package:organaiser/domain/repository/user.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(InitialState()) {
    on<ButtonPressedEvent>(((event, emit) async {
      try {
        final UserModel userModel = await GetIt.I<UserRepository>()
            .signInUser(event.login, event.password);
        GetIt.I.registerSingleton<AuthorizedUser>(
            AuthorizedUser(userModel: userModel));
        emit(SuccesState());
      } on FormatException catch (e) {
        switch (e.message.toString()) {
          case "403":
            emit(FailureState());
          case "503":
            emit(ServerProblemState());
          default:
            emit(ServerProblemState());
        }
      }
    }));
  }
}
