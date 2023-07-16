import 'package:_bloc/presentation/screens/home_screen.dart';
import 'package:_bloc/presentation/screens/second_screen.dart';
import 'package:_bloc/presentation/screens/third_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../logic/cubit/counter_cubit.dart';

class AppRoutes {
  final CounterCubit counterCubit = CounterCubit();

  Route? onGeneratedRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case '/':
        return MaterialPageRoute(
          builder: (_) => BlocProvider.value(
            value: counterCubit,
            child: const MyHomescreen(
              title: "HomeScreen",
              color: Colors.blue,
            ),
          ),
        );
      case '/second':
        return MaterialPageRoute(
          builder: (_) => BlocProvider.value(
            value: counterCubit,
            child: const Secondscreen(
              title: "SecondScreen",
              color: Colors.blue,
            ),
          ),
        );
      case '/third':
        return MaterialPageRoute(
          builder: (_) => BlocProvider.value(
            value: counterCubit,
            child: const Thirdscreen(
              title: "ThirdScreen",
              color: Colors.blue,
            ),
          ),
        );
      default:
        return null;
    }
  }

  void dispose() {
    counterCubit.close();
  }
}
