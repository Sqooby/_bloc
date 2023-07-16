import 'package:_bloc/logic/cubit/counter_cubit.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('CounterCubit', () {
    CounterCubit? counterCubit;

    setUp(() {
      counterCubit = CounterCubit();
    });

    tearDown(() {
      counterCubit?.close();
    });

    test("Checking if CounterCubit State is equal to CounterCubit value ==0", () {
      expect(counterCubit?.state, CounterState(counterValue: 0, wasIcremented: true));
    });

    blocTest(
      "Cubit shoud emit a CounterState(Countervalue:1, WasIcremented:true)",
      build: () => CounterCubit(),
      act: (cubit) => cubit.incremenet(),
      expect: () => [CounterState(counterValue: 1, wasIcremented: true)],
    );
    blocTest(
      "Cubit shoud emit a CounterState(Countervalue:-1, WasIcremented:false)",
      build: () => CounterCubit(),
      act: (cubit) => cubit.decremenet(),
      expect: () => [CounterState(counterValue: -1, wasIcremented: false)],
    );
  });
}
