import 'package:basic_riverpod_todo_app/pages/widgets/filter_todo_widget.dart';
import 'package:basic_riverpod_todo_app/pages/widgets/new_todo_widget.dart';
import 'package:basic_riverpod_todo_app/pages/widgets/search_todo_widget.dart';
import 'package:basic_riverpod_todo_app/pages/widgets/todo_header.dart';
import 'package:basic_riverpod_todo_app/pages/widgets/todos_list.dart';
import 'package:flutter/material.dart';

class TodosPage extends StatelessWidget {
  const TodosPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.all(20.0),
          child: Column(
            children: [
              TodoHeader(),
              NewTodoWidget(),
              SizedBox(height: 20.0),
              SearchTodoWidget(),
              SizedBox(height: 10.0),
              FilterTodoWidget(),
              SizedBox(height: 10.0),
              Expanded(child: TodosList()),
            ],
          ),
        ),
      ),
    );
  }
}
