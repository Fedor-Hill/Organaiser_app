part of 'login_bloc.dart';

abstract class LoginEvent {}

class ButtonPressedEvent extends LoginEvent {
  ButtonPressedEvent({
    required this.login,
    required this.password,
  });

  final String login, password;
}
