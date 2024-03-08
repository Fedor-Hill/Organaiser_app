part of 'person_bloc.dart';

abstract class PersonState {}

class InitialState extends PersonState {}

class SuccesState extends PersonState {
  SuccesState({required this.list});

  final List<PersonModel> list;
}

class FailureState extends PersonState {}

