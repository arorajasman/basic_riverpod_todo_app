import 'package:basic_riverpod_todo_app/models/todo_model.dart';
import 'package:basic_riverpod_todo_app/pages/providers/filtered_todos/filtered_todos_provider.dart';
import 'package:basic_riverpod_todo_app/pages/providers/todo_item/todo_item_provider.dart';
import 'package:basic_riverpod_todo_app/pages/widgets/todo_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Widget to show the list of todos
class TodosList extends ConsumerWidget {
  const TodosList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final filteredTodos = ref.watch(filteredTodosProvider);

    return ListView.separated(
      itemCount: filteredTodos.length,
      separatorBuilder: (context, index) {
        return const Divider(color: Colors.grey);
      },
      itemBuilder: (context, index) {
        final Todo todo = filteredTodos[index];
        // the code below is used to wrap the TodoItem widget in ProviderScope
        // so as to avoid the rebuilding of the whose list of TodoItem widgets
        // in the widget tree when only a single item is changed this is done
        // for optimizing the code
        return ProviderScope(
          // the code below is to use the overrides property to override the
          // todo_item provider
          overrides: [
            // using the overrideWithValue() method from the todoItemProvider
            // and passing the todo as input to override the current value
            // in the todoItemProvider
            todoItemProvider.overrideWithValue(todo),
          ],
          // since we are overriding the value of the todo in the overrides using
          // the todoItem provider so we do not need to pass the value to the
          // TodoItem constructor again here
          child: const TodoItem(),
        );
      },
    );
  }
}
