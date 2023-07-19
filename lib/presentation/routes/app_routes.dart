import 'package:_bloc/presentation/screens/home_screen.dart';
import 'package:_bloc/presentation/screens/second_screen.dart';
import 'package:_bloc/presentation/screens/third_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../logic/cubit/counter_cubit.dart';

class AppRoutes {
  // final CounterCubit counterCubit = CounterCubit();

  Route? onGeneratedRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case '/':
        return MaterialPageRoute(
          builder: (context) => MyHomescreen(
            title: "HomeScreen",
            color: Colors.blue,
          ),
        );
      case '/second':
        return MaterialPageRoute(
          builder: (context) => Secondscreen(
            title: "HomeScreen",
            color: Colors.blue,
          ),
        );
      case '/third':
        return MaterialPageRoute(
          builder: (context) => Thirdscreen(
            title: "HomeScreen",
            color: Colors.blue,
          ),
        );
      default:
        return null;
    }
  }
}
