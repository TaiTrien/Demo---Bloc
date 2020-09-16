import 'package:bloc/bloc.dart';
part 'counter_event.dart';
part 'counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc() : super(CounterInitialState());

  @override
  Stream<CounterState> mapEventToState(CounterEvent event) async* {
    if (event is IncreasingCounter) {
      yield UpdateState(state, counter: event.payload + 1);
    } else if (event is DecreasingCounter) {
      yield UpdateState(state, counter: event.payload - 1);
    }
  }
}
