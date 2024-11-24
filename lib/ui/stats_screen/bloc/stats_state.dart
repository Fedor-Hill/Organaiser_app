part of 'stats_bloc.dart';

abstract class StatsState {}

class InitialState extends StatsState {}

class SuccesState extends StatsState {}

class FailureState extends StatsState {
  FailureState({required this.e}); 

  final Object e;
}

class LoadState extends StatsState {}
