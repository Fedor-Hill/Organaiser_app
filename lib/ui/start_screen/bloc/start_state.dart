part of 'start_bloc.dart';

abstract class CheckState {}

class InitialState extends CheckState {}

class SuccesState extends CheckState {}

class ConnectionProblemState extends CheckState {}
//Where login or password not correct
class FailureState extends CheckState {}

//Where something gone wrong with service kundelik
class ServerProblemState extends CheckState {}

//Where service kundelik unavailable
class ServerUnavailableState extends CheckState {}
