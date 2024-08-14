import 'package:equatable/equatable.dart';
import 'package:flutter_weather/todos_app/models/todo_model.dart';

abstract class TodoState extends Equatable {
  const TodoState();

  @override
  List<Object?> get props => [];
}

class TodoInitial extends TodoState {}

class TodoLoaded extends TodoState {
  final List<Todo> todos;

  const TodoLoaded([this.todos = const []]);

  @override
  List<Object?> get props => [todos];
}
