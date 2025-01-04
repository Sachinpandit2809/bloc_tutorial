import 'package:bloc/bloc.dart';
import 'package:bloc_tutorial/bloc/todo/todo_event.dart';
import 'package:bloc_tutorial/bloc/todo/todo_state.dart';
import 'package:equatable/equatable.dart';

class TodoBloc extends Bloc<TodoEvent, TodoState> {
  final List<String> todosList = [];
  TodoBloc() : super(const TodoState()) {
    on<AddTodoEvent>(_onAddTodoEvent);
    on<RemoveTodoEvent>(_onRemoveTodoEvent);

  }
  _onAddTodoEvent(AddTodoEvent event, Emitter<TodoState> emit) {
    todosList.add(event.task);
    emit(state.copyWith(todoList: List.from(todosList) ));
  }
  _onRemoveTodoEvent(RemoveTodoEvent event, Emitter<TodoState> emit) {
    todosList.remove(event.task);
    emit(state.copyWith(todoList: List.from(todosList) ));
  }
}
