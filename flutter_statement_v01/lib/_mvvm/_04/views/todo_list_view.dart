// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
//
// import '../../../common.utils/logger.dart';
// import '../models/todo_item.dart';
// import '../view_models/todo_list_view_model.dart';
//
// // 화면 단에서 const 를 못 쓰는 문법일 뿐
// class TodoListView extends ConsumerWidget {
//   // 상태관리 --> 동기화 (공유 데이터를 여러 화면에서 동일 값을 보장)
//   //
//   TextEditingController _controller = TextEditingController();
//   TodoListView({super.key});
//
//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     logger.d('ConsumerWidget() 메모리 호출 확인');
//     // 여기서 뉴때리고 있는데 이제 안 때려도 됨
//     // TodoListViewModel _listViewModel = TodoListViewModel();
//
//     // todoItem 객체는 상태가 있다. -- 즉, 변수가 변화할 가능성이 있다.
//     // 빌드 메서드가 호출 될 때, final 로 고정한다.
//     // 항상 변화 감지를 위해 ref.watch 를 사용
//     // todos --> List<TodoItem> <-- 계속 감시중
//     final todos = ref.watch(todoListViewModelProvider);
//
//     // 창고에 직접 접근 --> ref.read
//     final todoNotifier = ref.read(todoListViewModelProvider.notifier);
//
//     return Flexible(
//       child: Column(
//         children: [
//           Padding(
//             padding: const EdgeInsets.all(16.0),
//             child: TextField(
//               controller: _controller,
//               decoration: InputDecoration(
//                 hintText: 'Enter todo item...',
//                 suffixIcon: IconButton(
//                   onPressed: () {
//                     todoNotifier.addItem(_controller.text);
//                     // 텍스트가 비어있지 않을 때만 추가
//                     _controller.clear();
//                   },
//                   icon: const Icon(Icons.add),
//                 ),
//               ),
//             ),
//           ),
//           const SizedBox(height: 16.0),
//           Expanded(
//             // ListView.builder를 Expanded로 감싸기
//             child: ListView.builder(
//               itemCount: todos.length,
//               itemBuilder: (context, index) {
//                 // 쉼표 추가
//                 final item = todos[index];
//
//                 return ListTile(
//                   title: Text(item.title), // 현재 인덱스의 항목 표시
//                   trailing: Checkbox(
//                     value: item.isDone,
//                     onChanged: (value) {
//                       // UI 업데이트를 위해 setState 추가
//                       todoNotifier.toggleItem(item);
//                     },
//                   ),
//                 );
//               },
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
