// view model

// 1. 뷰 모델을 사용하고 있다.
// 2. 뷰 모델에 날개를 달아 주자.
// 3. 우리의 규칙 --> 뷰 모델은 --> 창고 역할도 한다.
// 4. getter, setter 사용 금지
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_statement_v01/_mvvm/_02/models/todo_item.dart';

// extends Notifier : 변화를 알려주는 특별한 능력을 가짐
// List<TodoItem> : 여러 할 일들을 한꺼번에 관리
// build() : 처음 시작할 때, 빈 목록으로 시작
class TodoListViewModel extends Notifier<List<TodoItem>> {
  // 오버라이드 (비유 설명 : 기본 규칙이 있지만 규칙을 "덮어쓰기" 하는 것과 같음)
  // @override -> "나는 부모의 메소드를 새로 쓸 거에요" 선언
  // 사용하는 경우 : 부모의 기능이 불충분할 때, 다른 동작이 필요할 때, 특별한 기능 추가가 필요할 때,
  // build : 메소드 이름, 반환타입, 매개변수 똑같이 작성
  @override
  List<TodoItem> build() {
    // 1단계 : 앱이 처음 시작 될 때 실행 → build()
    print('TodoListViewModel() - 투두_리스트_뷰_모델 : build() ');
    return [];
  }
}
