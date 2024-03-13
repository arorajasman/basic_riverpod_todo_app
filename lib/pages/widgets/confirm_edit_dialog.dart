import 'package:basic_riverpod_todo_app/models/todo_model.dart';
import 'package:basic_riverpod_todo_app/pages/providers/todo_list/todo_list_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ConfirmEditDialog extends ConsumerStatefulWidget {
  final Todo todo;

  const ConfirmEditDialog({super.key, required this.todo});

  @override
  ConsumerState<ConfirmEditDialog> createState() => _ConfirmEditDialogState();
}

class _ConfirmEditDialogState extends ConsumerState<ConfirmEditDialog> {
  late Todo _currentTodo;
  late TextEditingController _todoTextEditingController;
  bool _isError = false;

  void _editButtonOnPressedHandler() {
    _isError = _todoTextEditingController.text.isEmpty ? true : false;
    if (_isError) {
      setState(() {});
    } else {
      // using the read() method from the ref instance and then passing the
      // todoListProvider.notifier and then calling the editTodo() method and
      // then passing the id of todo and description of todo to edit the todo task
      ref.read(todoListProvider.notifier).editTodo(
            _currentTodo.id,
            _todoTextEditingController.text,
          );
      Navigator.pop(context);
    }
  }

  @override
  void initState() {
    super.initState();
    _currentTodo = widget.todo;
    _todoTextEditingController =
        TextEditingController(text: _currentTodo.description);
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text("Edit Todo"),
      content: TextField(
        controller: _todoTextEditingController,
        autofocus: true,
        decoration: InputDecoration(
          errorText: _isError ? "value cannot be empty" : null,
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: Text("Cancel".toUpperCase()),
        ),
        TextButton(
          onPressed: _editButtonOnPressedHandler,
          child: Text("Edit".toUpperCase()),
        ),
      ],
    );
  }

  @override
  void dispose() {
    _todoTextEditingController.dispose();
    super.dispose();
  }
}
