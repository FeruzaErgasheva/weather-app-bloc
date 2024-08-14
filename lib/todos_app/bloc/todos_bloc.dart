import 'package:bloc/bloc.dart';
import 'package:flutter_weather/todos_app/bloc/todos_event.dart';
import 'package:flutter_weather/todos_app/bloc/todos_state.dart';
import 'package:flutter_weather/todos_app/models/todo_model.dart';

class TodoBloc extends Bloc<TodoEvent, TodoState> {
  TodoBloc() : super(TodoInitial()) {
    on<AddTodo>(_onAddTodo);
    on<UpdateTodo>(_onUpdateTodo);
    on<DeleteTodo>(_onDeleteTodo);
  }

  void _onAddTodo(AddTodo event, Emitter<TodoState> emit) {
    final state = this.state;
    if (state is TodoLoaded) {
      final updatedTodos = List<Todo>.from(state.todos)..add(event.todo);
      emit(TodoLoaded(updatedTodos));
    }
  }

  void _onUpdateTodo(UpdateTodo event, Emitter<TodoState> emit) {
    final state = this.state;
    if (state is TodoLoaded) {
      final updatedTodos = state.todos.map((todo) {
        return todo.id == event.todo.id ? event.todo : todo;
      }).toList();
      emit(TodoLoaded(updatedTodos));
    }
  }

  void _onDeleteTodo(DeleteTodo event, Emitter<TodoState> emit) {
    final state = this.state;
    if (state is TodoLoaded) {
      final updatedTodos = state.todos.where((todo) => todo.id != event.id).toList();
      emit(TodoLoaded(updatedTodos));
    }
  }
}
