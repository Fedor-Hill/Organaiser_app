part of 'login_bloc.dart';

abstract class LoginState {}

class InitialState extends LoginState {}

class SuccesState extends LoginState {}

class FailureState extends LoginState {}

//If kundelik don`t working
class ServerProblemState extends LoginState {}
