import 'package:basic_riverpod_todo_app/models/todo_model.dart';
import 'package:basic_riverpod_todo_app/pages/widgets/filter_button.dart';
import 'package:flutter/material.dart';

class FilterTodoWidget extends StatelessWidget {
  const FilterTodoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        FilterButton(filter: TodoFilter.all),
        FilterButton(filter: TodoFilter.active),
        FilterButton(filter: TodoFilter.completed),
      ],
    );
  }
}
