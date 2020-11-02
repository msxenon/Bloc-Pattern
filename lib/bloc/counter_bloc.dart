import 'package:bloc_pattern/bloc/counter_events.dart';
import 'package:bloc_pattern/bloc/counter_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterBloc extends Bloc<CounterEvents, CounterState> {
  int _counter = 0;
  CounterBloc(CounterState initialState) : super(initialState);


 Stream<CounterState> mapEventToState(CounterEvents event) async* {
  switch (event) {
     case CounterEvents.INCREASE:
       yield CounterState(counter: _counter++);
       break;
    case CounterEvents.DECREASE:
      yield CounterState(counter: _counter--);
      break;
    case CounterEvents.RESET:
      _counter = 0;
      yield CounterState(counter: _counter);
       break;
  }
}
}