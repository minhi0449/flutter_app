import 'package:flutter/material.dart';
import 'package:flutter_statement_v01/_mvvm/_02/views/todo_list_view.dart';

void main() {
  // 1단계
  runApp(TodoApp());
}

class TodoApp extends StatelessWidget {
  const TodoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: const Text('투두 리스트 복습 2025.01.23 (목)'),
          ),
          body: TodoListView(),
        ),
      ),
    );
  }
}
