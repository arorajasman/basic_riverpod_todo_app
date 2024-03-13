import 'package:basic_riverpod_todo_app/pages/providers/todo_list/todo_list_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class NewTodoWidget extends ConsumerStatefulWidget {
  const NewTodoWidget({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _NewTodoWidgetState();
}

class _NewTodoWidgetState extends ConsumerState<NewTodoWidget> {
  final TextEditingController _todoTextEditingController =
      TextEditingController();

  void _todoTextFieldOnSubmitHandler(String desc) {
    if (desc.trim().isNotEmpty) {
      // using the read() method from the ref instance we are passing the
      // todoListProvider.notifier to the read() method and then calling the
      // addTask() method to add a new todo task
      ref.read(todoListProvider.notifier).addTask(desc);
      _todoTextEditingController.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: _todoTextEditingController,
      decoration: const InputDecoration(labelText: "What to do?"),
      onSubmitted: _todoTextFieldOnSubmitHandler,
    );
  }

  @override
  void dispose() {
    _todoTextEditingController.dispose();
    super.dispose();
  }
}
