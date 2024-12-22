part of 'todo_v2_bloc.dart';

@freezed
class TodoV2Event with _$TodoV2Event {
  const factory TodoV2Event.getAllTodos() = _GetAllTodos;
}
