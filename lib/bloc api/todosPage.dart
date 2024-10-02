import 'package:bloc_api/bloc%20api/todos_api.dart';
import 'package:bloc_api/bloc%20api/todos_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
class TodosPage extends StatefulWidget {
  const TodosPage({super.key});

  @override
  State<TodosPage> createState() => _TodosPageState();
}

class _TodosPageState extends State<TodosPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<TodosBloc, TodosState>(
        builder: (context,state){
          if(state is LoadedState){
            return RefreshIndicator(
              color: Colors.cyan,
              onRefresh: ()async{
                TodosBloc(todosApi: TodosApi())..add(GetAllTodosEvent());
              },


              child: ListView.builder(
                itemCount: state.todos.length,
                  itemBuilder:(context,index){
                    return Container(
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text("ID:"),
                              Text(state.todos[index]!.id!.toString()),
                            ],
                          ),
                          FittedBox(
                            fit: BoxFit.fill,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Text(state.todos[index]!.title!.toString()),
                              ],
                            ),
                          ),
                          Divider()

                        ],
                      ),
                    );
                  }
              ),
            );
          }else if(state is ErrorState){
           return Container(
             alignment: Alignment.center,
             child: Text(state.message!),
           );
          }else{
            return Container(
              alignment: Alignment.center,
              child: CircularProgressIndicator(),
            );
          }


        },
      )
    );
  }
}
