part of 'main_menu_bloc.dart';

abstract class MainMenuState {}

class InitialState extends MainMenuState {}

class LoadingState extends MainMenuState {}

class ConnectionProblemState extends MainMenuState {}


class SuccesState extends MainMenuState {}

class FailureState extends MainMenuState {}
