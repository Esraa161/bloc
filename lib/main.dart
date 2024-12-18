import 'package:bloc_api/bloc%20api/todosPage.dart';
import 'package:bloc_api/bloc%20api/todos_bloc.dart';
import 'package:bloc_api/counter/counter_bloc.dart';
import 'package:bloc_api/counter/counter_screen.dart';
import 'package:bloc_api/dynamic%20theme/home_screen.dart';
import 'package:bloc_api/dynamic%20theme/theme_bloc.dart';
import 'package:bloc_api/internet%20connection/internetConnectionScreen.dart';
import 'package:bloc_api/internet%20connection/internet_bloc.dart';
import 'package:bloc_api/pagination/posts_bloc.dart';
import 'package:bloc_api/pagination/posts_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc api/todos_api.dart';
import 'bloc observer/helper/my_bloc_observer.dart';

void main() {
  Bloc.observer = MyBlocObserver();
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
            TodosBloc(todosApi: TodosApi())
              ..add(GetAllTodosEvent())),
        BlocProvider(
            create: (context) => CounterBloc()),
        BlocProvider(
            create: (context) => InternetBloc()),
        BlocProvider(
            create: (context) => ThemeBloc()..add(GetCurrentThemeEvent())),
        BlocProvider(
            create: (context) => PostsBloc()..add(GetPostsEvent())),
      ],
      child: BlocBuilder<ThemeBloc, ThemeState>(
        builder: (context, state) {
          if(state is LoadedThemeState){
            return MaterialApp(
              theme: state.themeData,
              debugShowCheckedModeBanner: false,
              title: 'Flutter Demo',
              home: PostsPage(),
            );
          }else{
            return CircularProgressIndicator();
          }

        },
      ),
    );
  }
}
