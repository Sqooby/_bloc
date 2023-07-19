import 'dart:async';

import 'package:_bloc/constant/enum.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import 'internet_cubit.dart';

part 'counter_state.dart';

class CounterCubit extends Cubit<CounterState> {
  CounterCubit() : super(CounterState(counterValue: 0, wasIcremented: true));

  void incremenet() => emit(CounterState(counterValue: state.counterValue + 1, wasIcremented: true));

  void decremenet() => emit(CounterState(counterValue: state.counterValue - 1, wasIcremented: false));
}
