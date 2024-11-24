part of 'stats_bloc.dart';

abstract class StatsEvent {}

class FirstStartEvent extends StatsEvent {}

class ChangeDataEvent extends StatsEvent {
  ChangeDataEvent({required this.eduGroupId}); 

  final int eduGroupId;
}
