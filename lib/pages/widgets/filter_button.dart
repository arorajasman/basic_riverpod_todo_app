import 'package:basic_riverpod_todo_app/models/todo_model.dart';
import 'package:basic_riverpod_todo_app/pages/providers/todo_filter/todo_filter_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FilterButton extends ConsumerWidget {
  final TodoFilter filter;

  const FilterButton({super.key, required this.filter});

  void _filterButtonOnPressedHandler(WidgetRef ref) {
    // using the read() method from the ref instance and passing the
    // filterTodoProvider.notifier as input and then calling the
    // changeFilter() method and passing the filter as input to update
    // the value of the filter
    ref.read(filterTodoProvider.notifier).changeFilter(filter);
  }

  // Getter to get the name of the button based on the value of filter
  String get _getButtonName {
    return switch (filter) {
      TodoFilter.all => "All",
      TodoFilter.active => "Active",
      TodoFilter.completed => "Completed",
    };
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // using the watch() method from the ref instance and passing the
    // filterTodoProvider as input to get the current value of the todoFilter
    final currentFilter = ref.watch(filterTodoProvider);

    return TextButton(
      onPressed: () => _filterButtonOnPressedHandler(ref),
      child: Text(
        _getButtonName,
        style: TextStyle(
          fontSize: 18.0,
          color: currentFilter == filter ? Colors.blue : Colors.grey,
        ),
      ),
    );
  }
}
