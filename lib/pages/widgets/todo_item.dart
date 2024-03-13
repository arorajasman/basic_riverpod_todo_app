import 'package:basic_riverpod_todo_app/models/todo_model.dart';
import 'package:basic_riverpod_todo_app/pages/providers/todo_item/todo_item_provider.dart';
import 'package:basic_riverpod_todo_app/pages/providers/todo_list/todo_list_provider.dart';
import 'package:basic_riverpod_todo_app/pages/widgets/confirm_edit_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TodoItem extends ConsumerWidget {
  const TodoItem({super.key});

  void _checkBoxOnPressed(WidgetRef ref, bool checked, String id) {
    // using the read() method from the ref instance and then passing the
    // todoListProvider.notifier as input and then calling the toggleTodo()
    // method and passing the todo.id as input to update the value of isChecked
    // based on the id of the todo
    ref.read(todoListProvider.notifier).toggleTodo(id);
  }

  void _deleteTodoHandler(
    BuildContext context,
    WidgetRef ref,
    String id,
  ) async {
    final removeTodoOrNot = await showDialog(
      context: context,
      // to prevent dialog from closing if the user clicks outside the dialog
      barrierDismissible: false,
      builder: (context) => _buildDeleteTodoConfirmDialogUI(context),
    );
    if (removeTodoOrNot) {
      ref.read(todoListProvider.notifier).removeTodo(id);
    }
  }

  AlertDialog _buildDeleteTodoConfirmDialogUI(BuildContext context) {
    return AlertDialog(
      title: const Text("Are you sure?"),
      content: const Text("Do you really want to delete the task"),
      actions: [
        TextButton(
          // returns false when use clicks on "No" button
          onPressed: () => Navigator.pop(context, false),
          child: const Text("No"),
        ),
        TextButton(
          // returns true when use clicks on "Yes" button
          onPressed: () => Navigator.pop(context, true),
          child: const Text("Yes"),
        ),
      ],
    );
  }

  void _showEditDialogForTodoUI(BuildContext context, Todo todo) {
    showDialog(
      context: context,
      builder: (context) => ConfirmEditDialog(todo: todo),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    print("building todoItem widget");

    // using the watch() method from the ref instance to get the value of the todo
    // from the todoItemProvider
    final todo = ref.watch(todoItemProvider);

    return ListTile(
      onTap: () => _showEditDialogForTodoUI(context, todo),
      leading: Checkbox(
        value: todo.isCompleted,
        onChanged: (value) => _checkBoxOnPressed(ref, value!, todo.id),
      ),
      title: Text(
        todo.description,
        style: TextStyle(
          decoration: todo.isCompleted
              ? TextDecoration.lineThrough
              : TextDecoration.none,
        ),
      ),
      trailing: IconButton(
        onPressed: () => _deleteTodoHandler(context, ref, todo.id),
        icon: const Icon(Icons.delete),
      ),
    );
  }
}
