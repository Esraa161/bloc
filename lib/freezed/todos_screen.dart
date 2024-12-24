import 'package:bloc_api/bloc%20api/todos_api.dart';
import 'package:bloc_api/freezed/todo_v2_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TodosScreen extends StatelessWidget {
  const TodosScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Todos"),
          backgroundColor: Colors.cyan,
        ),
        body: BlocBuilder<TodoV2Bloc, TodoV2State>(builder: (context, state) {
          return state.when(
              loading: () {
                return Container(
                  alignment: Alignment.center,
                  child: CircularProgressIndicator(),
                );
              },
              loaded: (todos) {
                return RefreshIndicator(
                  color: Colors.cyan,
                  onRefresh: () async {
                    TodoV2Bloc(todosApi: TodosApi())
                      ..add(TodoV2Event.getAllTodos());
                  },
                  child: ListView.builder(
                      itemCount: todos.length,
                      itemBuilder: (context, index) {
                        return Container(
                          padding: EdgeInsets.all(10),
                          margin: EdgeInsets.all(5),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.all(Radius.circular(5)),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey,
                                offset: const Offset(
                                  3.0,
                                  1.0,
                                ),
                                blurRadius: 5.0,
                                spreadRadius: 0.0,
                              ), //BoxShadow
                            ],
                          ),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Text("ID:"),
                                  Text(todos[index]!.id!.toString()),
                                ],
                              ),
                              FittedBox(
                                fit: BoxFit.fill,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Text(todos[index]!.title!.toString()),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        );
                      }),
                );
              },
              error: (message) {
                return Text(message);
              });
        }));
  }
}
