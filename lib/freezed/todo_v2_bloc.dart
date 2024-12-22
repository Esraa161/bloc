import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../bloc api/todoModel.dart';

part 'todo_v2_event.dart';
part 'todo_v2_state.dart';
part 'todo_v2_bloc.freezed.dart';

class TodoV2Bloc extends Bloc<TodoV2Event, TodoV2State> {
  TodoV2Bloc() : super(const TodoV2State.loading()) {
    on<TodoV2Event>((event, emit) {
      // TODO: implement event handler
    });
  }
}
