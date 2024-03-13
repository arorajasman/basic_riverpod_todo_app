import 'package:basic_riverpod_todo_app/models/todo_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'todo_list_provider.g.dart';

@riverpod
class TodoList extends _$TodoList {
  // The return type of the build() method below is of type List<Todo> which is
  // the type of the state managed by this TodoListProvider
  @override
  List<Todo> build() {
    // The initial value returned by this provider is an empty list
    return [];
  }

  // the method below is used to add a new todo task in the current todo list
  // which is represented by the state variable
  void addTask(String desc) {
    // here we are using the spread operator to get access to the existing todos
    // and adding a new todo task using the add() named constructor and passing
    // the description of todo provided in the desc variable
    state = [...state, Todo.add(desc: desc)];
  }

  // The method below is used to edit the todo task and takes the id of the todo
  // and the description of the todo as input
  void editTodo(String id, String desc) {
    state = [
      for (final todo in state)
        if (todo.id == id) todo.copyWith(description: desc) else todo
    ];
  }

  // the method below is used to toggle the value of isCompleted for a todo task
  // based on the id provided by the user
  void toggleTodo(String id) {
    state = [
      for (final todo in state)
        if (todo.id == id)
          todo.copyWith(isCompleted: !todo.isCompleted)
        else
          todo
    ];
  }

  // the method below is used to delete the todo task based on the id of the task
  // provided as input
  void removeTodo(String id) {
    state = [
      for (final todo in state)
        if (todo.id != id) todo
    ];
  }
}
