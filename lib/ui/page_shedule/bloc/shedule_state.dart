part of 'shedule_bloc.dart';

abstract class SheduleState {}

class InitialState extends SheduleState {}

class LoadingState extends SheduleState {}

class SuccesState extends SheduleState {
  SuccesState({required this.sheduleModel});

  final SheduleModel sheduleModel;
}

class FailureState extends SheduleState {}
