part of 'login_bloc.dart';

abstract class LoginState {}

class InitialState extends LoginState {}

class SuccesState extends LoginState {
  SuccesState({required this.userContextModel});

  final UserContextModel userContextModel;
}

class FailureState extends LoginState {}

//If kundelik don`t working
class ServerProblemState extends LoginState {}
