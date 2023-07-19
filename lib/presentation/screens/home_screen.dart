import 'package:_bloc/logic/cubit/internet_cubit.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../constant/enum.dart';
import '../../logic/cubit/counter_cubit.dart';

class MyHomescreen extends StatefulWidget {
  const MyHomescreen({super.key, required this.title, required this.color});

  final String title;
  final Color color;

  @override
  State<MyHomescreen> createState() => _MyHomescreenState();
}

class _MyHomescreenState extends State<MyHomescreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: widget.color,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            BlocBuilder<InternetCubit, InternetState>(
              builder: ((BuildContext context, state) {
                if (state is InternetConnected && state.connectionType == ConnectionType.Wifi) {
                  return Text('wifi');
                } else if (state is InternetConnected && state.connectionType == ConnectionType.Mobile) {
                  return Text('Mobile');
                } else if (state is InternetDisconnected) {
                  return Text("Disconecnted");
                }
                return CircularProgressIndicator();
              }),
            ),
            const Text(
              'You have pushed the button this many times:',
            ),
            BlocConsumer<CounterCubit, CounterState>(
              listener: (context, state) {
                if (state.wasIcremented == true) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Icremented'),
                      duration: Duration(milliseconds: 300),
                    ),
                  );
                } else if (state.wasIcremented == false) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Decremented'),
                      duration: Duration(milliseconds: 300),
                    ),
                  );
                }
              },
              builder: (context, state) {
                return Text(
                  state.counterValue.toString(),
                  style: Theme.of(context).textTheme.headlineMedium,
                );
              },
            ),
            const SizedBox(
              height: 24,
            ),
            Builder(builder: (context) {
              // final counterState = context.watch<CounterCubit>().state;
              // final internetState = context.watch<InternetCubit>().state;

              // if (internetState is InternetConnected && internetState.connectionType == ConnectionType.Mobile) {
              //   return Text('Counter: ${counterState.counterValue} Internet: Mobile');
              // } else if (internetState is InternetConnected && internetState.connectionType == ConnectionType.Wifi) {
              //   return Text('Counter: ${counterState.counterValue} Internet: Wifi');
              // } else {
              //   return Text('Counter: ${counterState.counterValue} Internet: Disco');
              // }
              final counterValue = context.select((CounterCubit cubit) => cubit.state.counterValue);
              return Text('Counter :' + counterValue.toString());
            }),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                FloatingActionButton(
                  heroTag: 'bnt1',
                  onPressed: () {
                    context.read<CounterCubit>().incremenet();
                  },
                  tooltip: 'Increment',
                  child: const Icon(Icons.add),
                ),
                FloatingActionButton(
                  heroTag: 'bnt2',
                  onPressed: () {
                    context.read<CounterCubit>().decremenet();
                  },
                  tooltip: 'Decrement',
                  child: const Icon(Icons.remove),
                ),
              ],
            ),
            const SizedBox(
              height: 25,
            ),
            MaterialButton(
              color: widget.color,
              onPressed: () {
                Navigator.of(context).pushNamed('/second');
              },
              child: const Text("Go to the second screen"),
            ),
            const SizedBox(
              height: 25,
            ),
            MaterialButton(
              color: widget.color,
              onPressed: () {
                Navigator.of(context).pushNamed('/third');
              },
              child: const Text("Go to the Third screen"),
            ),
          ],
        ),
      ),
    );
  }
}
