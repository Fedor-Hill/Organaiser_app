part of 'mm_bloc.dart';

abstract class MainMenuState {}

class InitialState extends MainMenuState {}

class LoadingState extends MainMenuState {}

class SuccesState extends MainMenuState {
  SuccesState({required this.recentMarkModelList, required this.weekMood, required this.midValue});
  final List<RecentMarkModel> recentMarkModelList;
  final double midValue;
  final int weekMood;
}

class FailureState extends MainMenuState {}
