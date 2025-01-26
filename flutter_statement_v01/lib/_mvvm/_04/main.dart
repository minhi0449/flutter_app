// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
//
// import 'views/todo_list_view.dart';
//
// void main() {
//   runApp(
//     // ProviderScope 으로 변경
//     ProviderScope(
//       child: TodoApp(),
//     ),
//   );
// }
//
// class TodoApp extends StatelessWidget {
//   const TodoApp({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: SafeArea(
//         child: Scaffold(
//           appBar: AppBar(
//             title: const Text('TodoList'),
//           ),
//           body: TodoListView(),
//         ),
//       ),
//     );
//   }
// }
