import 'package:bloc/bloc.dart';
import 'package:bloc_api/todoModel.dart';
import 'package:bloc_api/todos_api.dart';
import 'package:equatable/equatable.dart';
part 'todos_event.dart';
part 'todos_state.dart';

class TodosBloc extends Bloc<TodosEvent, TodosState> {
  final TodosApi todosApi;
  TodosBloc({required this.todosApi} ) : super(LoadingState()) {
    on<TodosEvent>((event, emit)async {
      // TODO: implement event handler
      if(event is GetAllTodosEvent){
        emit(LoadingState());
        try{
          final todos=await todosApi .getAllTodos();
          emit(LoadedState(todos));
        }catch(e){
          emit(ErrorState(e.toString()));
        }

      }
    });
  }
}
