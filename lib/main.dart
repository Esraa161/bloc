import 'package:bloc_api/bloc%20api/todosPage.dart';
import 'package:bloc_api/bloc%20api/todos_bloc.dart';
import 'package:bloc_api/counter/counter_bloc.dart';
import 'package:bloc_api/counter/counter_screen.dart';
import 'package:bloc_api/internet%20connection/internetConnectionScreen.dart';
import 'package:bloc_api/internet%20connection/internet_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc api/todos_api.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
        create: (context) =>
      TodosBloc(todosApi: TodosApi())..add(GetAllTodosEvent())),
        BlocProvider(
            create: (context) =>CounterBloc()),
        BlocProvider(
            create: (context) =>InternetBloc()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        home: InternetConnectionScreen(),
      ),
    );
  }
}
