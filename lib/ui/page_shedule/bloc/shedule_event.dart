part of 'shedule_bloc.dart';

abstract class SheduleEvent {}

class OnGetShedule extends SheduleEvent {}

class OnDateIncrement extends SheduleEvent {}

class OnDateDecrement extends SheduleEvent {}

class OnDateToday extends SheduleEvent {}
