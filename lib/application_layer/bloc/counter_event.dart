part of 'counter_bloc.dart';

@immutable
abstract class CounterEvent {}

class CounterAddEvent extends CounterEvent {}

class CounterSubEvent extends CounterEvent {}
