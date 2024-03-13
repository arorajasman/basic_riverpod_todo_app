import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:uuid/uuid.dart';

part 'todo_model.freezed.dart';

Uuid uuid = const Uuid();

@freezed
class Todo with _$Todo {
  const factory Todo({
    required String id,
    required String description,
    // using the @Default() annotation to provide a default false value to
    // the `isCompleted` property
    @Default(false) bool isCompleted,
  }) = _Todo;

  /// Named factory method to add a new todo task
  factory Todo.add({required String desc}) {
    return Todo(id: uuid.v4(), description: desc);
  }
}

/// enum to define the filter of todo / status of todo
enum TodoFilter {
  all,
  active,
  completed,
}
