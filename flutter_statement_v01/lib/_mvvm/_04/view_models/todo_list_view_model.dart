// // viewModel
// import 'package:flutter_riverpod/flutter_riverpod.dart';
//
// import '../models/todo_item.dart';
//
// // 1. 뷰 모델을 사용하고 있다.
// // 2. 뷰 모델에 날개를 달아주자 (어떤날개? -> riverpod 상태관리 기능 추가)(꼭 기억하기)
// // 3. 우리의 규칙 뷰 모델 -> 창고의 역할도 한다.
// // 4. getter, setter 사용치 말자
// // 최종으로 관리하고 싶은 형태는 Notifier<List<TodoItem>>
// class TodoListViewModel extends Notifier<List<TodoItem>> {
//   // List<TodoItem> _item = []; // 초기값 준 거
//   // super.state 넘겨줘야 했으나 귀찮으니
//   @override
//   List<TodoItem> build() {
//     return [];
//   }
//
//   // getter
//   // List<TodoItem> get items => _item;
//
//   // 비즈니스 로직
//   void addItem(String title) {
//     // 매개변수로 들어오는 title 넣어주면 되고
//     // state.add(TodoItem(title: title));
//     // state.add <-- 원래 사용하고 있는 객체 접근해서 추가 했더니
//     // 위젯 변경이 되지 않음, 하지만 새로운 객체를 만들어서 할당을 하니
//     // 위젯 변경이 일어났다.
//     state = [...state, TodoItem(title: title)];
//   }
//
//   // 0. 가변 객체를 변경해서 사용하는 코드
//
//   // 여기서 부터 조금 어려움 -> 아니? 쉬움 히히
//   // 상태관리를 다룰 때, 불변 객체와 가변 객체 -> 불변 객체를 새로 만들어서
//   // 선언형 UI (배민, 쿠팡)
//   // 의도치 않은 렌더링이 발생할 때, 가변객체 안에 넣어서 새로고침하면 정보가 변경될 수도 있고
//   // 변경이 되지 않을 때도 있음
//   // 그래서 우리는 불변객체를 사용하기로 했음
//   // 불변객체를 새롭게 잡아 넣는다는 말임
//   // state = []
//   // 상태관리를 다룰 떄, 불변 객체 , 가변 객체란?
//   // 1단계 코드 - 불변 객체 할당
//   // void toggleItem(TodoItem todo) {
//   //   state = [
//   //     for (final item in state)
//   //       if (item == todo)
//   //         TodoItem(
//   //           title: item.title,
//   //           isDone: !item.isDone,
//   //         )
//   //       else
//   //         item
//   //   ];
//   // }
//
//   // 불변성 원칙 위배(버그 위험 증가)
//   // 기존 리스트의 참조를 유지한 채, 리스트 안의 특정 객체의 속성을 직접 수정하는 것
//   // flutter 상태 관리에서는 가변 객체 대신 불변객체를 사용한다.
// }
//
// // 2단계 코드
// void toggleItem(TodoItem todo) {
//   state = state
//       .map((item) => item == todo ? item.copyWith(isDone: !item.isDone) : item)
//       .toList();
// }
//
// // 3. 창고 관리자를 만들고 관리할 창고를 설정해주자
// // <> 어떤 창고 관리하는지 명시하는 거임
// final todoListViewModelProvider =
//     NotifierProvider<TodoListViewModel, List<TodoItem>>(
//   () {
//     return TodoListViewModel();
//   },
// );
