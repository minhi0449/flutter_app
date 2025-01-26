// Model
// 1. 우리가 관리 하고 싶은 데이터 (창고 안에 넣은 상품)
import 'package:flutter_statement_v01/riverpod_v01/_01/todo.dart';

class TodoItem {
  String title;
  bool isDone;

  TodoItem({required this.title, this.isDone = false});

  // 2단계 코드 시작
  TodoItem copyWith({String? title, bool? isDone}) {
    // 이 메서드가 호출 되면
    // title: title ?? this.title -> null 값이면 원래 있던 값을 넣어라
    // 깊은 복사 시 값을 미리 만들어 줌
    return TodoItem(
      title: title ?? this.title,
      isDone: isDone ?? this.isDone,
    );
  }
} // end of TodoItem
