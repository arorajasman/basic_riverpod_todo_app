import 'package:basic_riverpod_todo_app/pages/providers/todo_list/todo_list_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'active_todo_count_provider.g.dart';

// creating a plain provider that dependes on the state of the todoListProviderProvider
// to get the number of active todos
@riverpod
int activeTodoCount(ActiveTodoCountRef ref) {
  final todos = ref.watch(todoListProvider);
  return todos.where((todo) => !todo.isCompleted).toList().length;
}
