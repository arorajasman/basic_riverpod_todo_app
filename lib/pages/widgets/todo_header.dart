import 'package:basic_riverpod_todo_app/pages/providers/active_todo_count/active_todo_count_provider.dart';
import 'package:basic_riverpod_todo_app/pages/providers/theme/theme_provider.dart';
import 'package:basic_riverpod_todo_app/pages/providers/todo_list/todo_list_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TodoHeader extends ConsumerWidget {
  const TodoHeader({super.key});

  void _themeButtonOnPressedHandler(WidgetRef ref) {
    ref.read(themeProvider.notifier).togglTheme();
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // using the ref.watch() to get the data from the activeTodoCounterProvider
    // for the number of active todos and the todoListProvider to get the list of
    // todos
    final activeTodosCount = ref.watch(activeTodoCountProvider);
    final todos = ref.watch(todoListProvider);

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            const Text(
              "TODO",
              style: TextStyle(
                fontSize: 36.0,
              ),
            ),
            const SizedBox(width: 10.0),
            Text(
              "($activeTodosCount/${todos.length} item${activeTodosCount != 1 ? "s" : ""} left)",
              style: TextStyle(
                fontSize: 18.0,
                color: Colors.blue[900],
              ),
            ),
          ],
        ),
        _buildThemeButtonUI(ref)
      ],
    );
  }

  IconButton _buildThemeButtonUI(WidgetRef ref) {
    return IconButton(
      onPressed: () => _themeButtonOnPressedHandler(ref),
      icon: const Icon(Icons.light_mode),
    );
  }
}
