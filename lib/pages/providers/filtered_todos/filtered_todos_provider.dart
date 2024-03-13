import 'package:basic_riverpod_todo_app/models/todo_model.dart';
import 'package:basic_riverpod_todo_app/pages/providers/todo_filter/todo_filter_provider.dart';
import 'package:basic_riverpod_todo_app/pages/providers/todo_list/todo_list_provider.dart';
import 'package:basic_riverpod_todo_app/pages/providers/todo_search/todo_search_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'filtered_todos_provider.g.dart';

// Note:
// The best template to use the provider when we depend on the state of the other
// provider is the plain provider

// provider to get the list of filtered todos
@riverpod
List<Todo> filteredTodos(FilteredTodosRef ref) {
  // getting the list of todos
  final todos = ref.watch(todoListProvider);
  final filter = ref.watch(filterTodoProvider);
  final search = ref.watch(todoSearchProvider);

  List<Todo> tempTodos = [];

  //  filtering todos based on filter type
  tempTodos = switch (filter) {
    TodoFilter.active => todos.where((todo) => !todo.isCompleted).toList(),
    TodoFilter.completed => todos.where((todo) => todo.isCompleted).toList(),
    TodoFilter.all => todos,
  };

  // getting todos based on the search text
  if (search.isNotEmpty) {
    tempTodos = tempTodos
        .where((todo) =>
            todo.description.toLowerCase().contains(search.toLowerCase()))
        .toList();
  }

  return tempTodos;
}
