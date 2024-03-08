part of 'person_bloc.dart';

abstract class PersonEvent {}

class OnGetPersonsEvent extends PersonEvent {
  OnGetPersonsEvent({required this.userContextModel});

  final UserContextModel userContextModel;
}
