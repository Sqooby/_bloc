import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'counter_state.dart';

class CounterCubit extends Cubit<CounterState> {
  CounterCubit() : super(CounterState(counterValue: 0));

  void incremenet() => emit(CounterState(counterValue: state.counterValue + 1, wasIcremented: true));

  void decremenet() => emit(CounterState(counterValue: state.counterValue - 1, wasIcremented: false));
}
