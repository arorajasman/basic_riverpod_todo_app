import 'package:basic_riverpod_todo_app/models/todo_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'todo_item_provider.g.dart';

// creating a basic riverpod provider since we only need the value of the todo
// item using the provider

// the return type of the method below is of type Todo since we are managing the
// data / state of type Todo only

// since our todoItem provider does not depend on any other providers so we
// are passing the empty list as input to the dependencies

// Note:
// we are using the @Riverpod() annotation and passing dependencies as input
// since for the todoItem provider we are overriding it in a ProviderScope()
// which is not at the root level so for this purpose we need to specify the
// dependency explicitly, otherwise Riverpod will throw an error
@Riverpod(dependencies: [])
Todo todoItem(TodoItemRef ref) {
  // the code will not throw the unimplemented error because providers are lazy
  // loading i.e they are initialized when other providers or widgets are watching
  // listening or reading
  throw UnimplementedError();
}
