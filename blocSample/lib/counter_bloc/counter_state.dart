part of 'counter_bloc.dart';

abstract class CounterState {
  final int counter;
  CounterState({this.counter});
}

class CounterInitialState extends CounterState {
  CounterInitialState() : super(counter: 0);
}

class UpdateState extends CounterState {
  UpdateState(CounterState oldState, {int counter})
      : super(
          counter: counter ?? oldState.counter,
        );
}
