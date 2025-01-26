// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:flutter_statement_v01/main.dart';
// import 'package:flutter_statement_v01/riverpod_v01/_02/fruit.dart';
//
// void main() {
//   runApp(ProviderScope(child: MyApp()));
// }
//
// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: BookPage(),
//     );
//   }
// } // end of MyApp
//
// // 직접 ConsumerWidget 을 사용해서 코드를 작성하시오.
// class BookPage extends ConsumerWidget {
//   const BookPage({super.key});
//
//   @override
//   Widget build(BuildContext context, WidgetRef, ref) {
//     String getBook = ref.watch(fruitProvider);
//     return Scaffold(
//       body: Center(
//         child: Center(
//           child: Text('data 확인 :'),
//         ),
//       ),
//     );
//   }
// } // end of BookPage
