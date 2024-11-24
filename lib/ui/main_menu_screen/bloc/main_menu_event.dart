part of 'main_menu_bloc.dart';

abstract class MainMenuEvent {}

class RefreshEvent extends MainMenuEvent {
  RefreshEvent({ required this.completer});
  final Completer? completer;
}
