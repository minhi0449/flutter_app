// viewModel

import 'package:flutter_statement_v01/_mvvm/_02/models/todo_item.dart';

class TodoListViewModel {
  List<TodoItem> _item = []; // 초기값 준 거
  // get
  List<TodoItem> get items => _item;

  // 비즈니스 로직
  void addItem(String title) {
    // 매개변수로 들어오는 title 넣어주면 되고
    _item.add(TodoItem(title: title));
  }

  void toggleItem(TodoItem todo) {
    todo.isDone = !todo.isDone;
  }
}
