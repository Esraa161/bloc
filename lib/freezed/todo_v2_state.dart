part of 'todo_v2_bloc.dart';

@freezed
class TodoV2State with _$TodoV2State {
  const factory TodoV2State.loading() = _Loading;
  const factory TodoV2State.loaded(List<Todo>todos)=_Loaded;
  const factory TodoV2State.errpr(String message)= _Error;
}
