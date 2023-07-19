import 'package:_bloc/logic/cubit/counter_cubit.dart';
import 'package:_bloc/logic/cubit/internet_cubit.dart';
import 'package:_bloc/presentation/routes/app_routes.dart';
import 'package:_bloc/presentation/screens/second_screen.dart';
import 'package:_bloc/presentation/screens/third_screen.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'presentation/screens/home_screen.dart';

void main() {
  runApp(MyApp(
    appRoutes: AppRoutes(),
    connectivity: Connectivity(),
  ));
}

class MyApp extends StatelessWidget {
  final AppRoutes appRoutes;
  final Connectivity connectivity;
  MyApp({
    super.key,
    required this.appRoutes,
    required this.connectivity,
  });

// This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<InternetCubit>(
          create: (context) => InternetCubit(
            connectivity: connectivity,
          ),
        ),
        BlocProvider<CounterCubit>(
          create: (_) => CounterCubit(),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        onGenerateRoute: appRoutes.onGeneratedRoute,
      ),
    );
  }
}
