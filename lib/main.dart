import 'package:_bloc/logic/cubit/counter_cubit.dart';
import 'package:_bloc/presentation/routes/app_routes.dart';
import 'package:_bloc/presentation/screens/second_screen.dart';
import 'package:_bloc/presentation/screens/third_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'presentation/screens/home_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final AppRoutes _appRoutes = AppRoutes();

// This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      onGenerateRoute: _appRoutes.onGeneratedRoute,
    );
  }

  @override
  void dispose() {
    _appRoutes.dispose();

    // TODO: implement dispose
    super.dispose();
  }
}
