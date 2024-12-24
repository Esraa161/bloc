import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../bloc api/todoModel.dart';
import '../bloc api/todos_api.dart';

part 'todo_v2_event.dart';
part 'todo_v2_state.dart';
part 'todo_v2_bloc.freezed.dart';

class TodoV2Bloc extends Bloc<TodoV2Event, TodoV2State> {
  final TodosApi todosApi;
  TodoV2Bloc({required this.todosApi} ) : super(const TodoV2State.loading()) {
    on<TodoV2Event>((event, emit) async{
 await event.when(getAllTodos: ()async{
  emit(TodoV2State.loading());
  try{
    final todos=await todosApi .getAllTodos();
    emit(TodoV2State.loaded(todos));
  }catch(e){
    emit(TodoV2State.error(e.toString()));
  }
},
    getTodoDetail: (todoId){});
    });
  }
}
