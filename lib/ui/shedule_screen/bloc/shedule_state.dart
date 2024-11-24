part of 'shedule_bloc.dart';

abstract class SheduleState {}

class InitialState extends SheduleState {}

class ConnectionProblemState extends SheduleState {}

class LoadingState extends SheduleState {}

class SuccesState extends SheduleState {
  SuccesState({required this.shedule});

  final Shedule shedule;
}

class FailureState extends SheduleState {}
