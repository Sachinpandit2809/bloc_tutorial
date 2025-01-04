import 'package:equatable/equatable.dart';

abstract class TodoEvent extends Equatable {
  TodoEvent();

  List<Object> get props => [];
}

class AddTodoEvent extends TodoEvent {
  final String task;

  AddTodoEvent({required this.task});

  @override
  List<Object> get props => [task];
}

class RemoveTodoEvent extends TodoEvent {
  final Object task;
  RemoveTodoEvent({required this.task});

  @override
  List<Object> get props => [task];
}
