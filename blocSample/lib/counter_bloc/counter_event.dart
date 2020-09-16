part of 'counter_bloc.dart';

abstract class CounterEvent {
  final dynamic payload;
  CounterEvent({this.payload});
}

class IncreasingCounter extends CounterEvent {
  IncreasingCounter(int counter) : super(payload: counter);
}

class DecreasingCounter extends CounterEvent {
  DecreasingCounter(int counter) : super(payload: counter);
}
