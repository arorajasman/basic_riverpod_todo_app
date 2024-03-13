import 'package:basic_riverpod_todo_app/models/todo_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'todo_filter_provider.g.dart';

// The code below is used to create a notifier provider for filter in todo

@riverpod
class FilterTodo extends _$FilterTodo {
  // the return type of the build() method below is of type TodoFilter that means
  // that the state handled by the TodoFilter provider is of type TodoFilter enum
  @override
  TodoFilter build() {
    // here we are returning the initial value of the filter i.e. TodoFilter.all
    return TodoFilter.all;
  }

  // the method below is used to update the value of current state of type TodoFilter
  // to the value provided by the user
  void changeFilter(TodoFilter newFilter) {
    state = newFilter;
  }
}
