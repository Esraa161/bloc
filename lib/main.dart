import 'package:bloc_api/todosPage.dart';
import 'package:bloc_api/todos_api.dart';
import 'package:bloc_api/todos_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
  create: (context) => TodosBloc(todosApi: TodosApi())..add(GetAllTodosEvent()),
  child: MaterialApp(
      title: 'Flutter Demo',

      home:TodosPage(),
    ),
);
  }
}
