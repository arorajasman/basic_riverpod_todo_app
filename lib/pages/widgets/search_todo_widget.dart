import 'package:basic_riverpod_todo_app/pages/providers/todo_search/todo_search_provider.dart';
import 'package:basic_riverpod_todo_app/utils/debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SearchTodoWidget extends ConsumerStatefulWidget {
  const SearchTodoWidget({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _SearchTodoWidgetState();
}

class _SearchTodoWidgetState extends ConsumerState<SearchTodoWidget> {
  final Debounce _debounce = Debounce(milliseconds: 1000);

  void _onSearchFieldTextChangeHandler(String searchTerm) {
    _debounce.run(() {
      // calling the read() method from the ref instance and passing the
      // todoSearchProvider.notifier as input and then calling the
      // setSearchTerm() method and passing the searchTerm as input to set the
      // value of the search term
      ref.read(todoSearchProvider.notifier).setSearchTerm(searchTerm);
    });
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: const InputDecoration(
        labelText: "Search todos...",
        border: InputBorder.none,
        filled: true,
        prefixIcon: Icon(Icons.search),
      ),
      onChanged: _onSearchFieldTextChangeHandler,
    );
  }

  @override
  void dispose() {
    _debounce.close();
    super.dispose();
  }
}
