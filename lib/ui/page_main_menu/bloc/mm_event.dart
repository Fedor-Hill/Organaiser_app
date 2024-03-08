part of 'mm_bloc.dart';

abstract class MainMenuEvent {}

class OnRefreshEvent extends MainMenuEvent {
  OnRefreshEvent({required this.userContextModel, required this.completer});
  final UserContextModel userContextModel;
  final Completer? completer;
}
