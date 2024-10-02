part of 'counter_bloc.dart';

@immutable
sealed class CounterEvent {}
class IncreamentEvent extends CounterEvent{}
class DecreamentEvent extends CounterEvent{}
class RestEvent extends CounterEvent{}