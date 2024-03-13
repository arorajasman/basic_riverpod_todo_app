import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'todo_search_provider.g.dart';

// creating a notifier provider for searching the todos
@riverpod
class TodoSearch extends _$TodoSearch {
  // The return type of the build method is of type String i.e. the type of the
  // state managed by this provider.
  @override
  String build() {
    // we are returning an empty string as initial value of the TodoSearchProvider
    return '';
  }

  // The method below is used to set the value of state i.e. the searchTerm
  // when the user enters a new search term
  void setSearchTerm(String newSearchTerm) {
    state = newSearchTerm;
  }
}
