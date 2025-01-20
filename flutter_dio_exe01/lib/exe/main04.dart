// import 'package:flutter/material.dart';
// import 'package:dio/dio.dart';
// import 'package:flutter_dio_exe01/exe/e_main02.dart';
//
// void main() => runApp(MyApp());
//
// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: SafeArea(
//           child: Scaffold(
//         appBar: AppBar(
//           leading: Icon(Icons.arrow_back),
//           title: Text(
//             '2025-01-14 (화)',
//             style: TextStyle(fontSize: 25, fontWeight: FontWeight.w700),
//           ),
//           actions: [
//             Icon(Icons.launch_outlined),
//           ],
//         ),
//         body: HomePage3(),
//       )),
//     );
//   }
// }
//
// // Page Area
// class HomePage3 extends StatefulWidget {
//   const HomePage3({super.key});
//
//   @override
//   State<HomePage3> createState() => _HomePage3State();
// }
//
// class _HomePage3State extends State<HomePage3> {
//   Dio _dio = Dio();
//   // Todo? _todo; // 통신에 실패할 수도 있으니까 -> 옵셔널 추가
//
//   @override
//   void initState() {
//     // 객체 실행 시 한 번 호출되는 메서드
//     _fetchTodos();
//     super.initState();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: _todo == null // 데이터가 아직 안 들어온 상태
//           ? CircularProgressIndicator() // 데이터가 없을 때 표시
//           : Column(
//               children: [
//                 // 데이터가 있으면 화면에 표시
//                 Text('userId : ${_todo!.userId}'),
//                 Text('id : ${_todo!.id}'),
//                 Text('title : ${_todo!.title}'),
//                 Text('completed : ${_todo!.completed}'),
//               ],
//             ),
//     );
//   }
//
//   // 통신을 담당하는 메서드를 만들어 보자.
//   // 데이터 타입은 대부분 Future
//   // Future<void> _fetchTodos()  --> 함수에서 앞에 ' Future<void> ' 생략 가능
//   _fetchTodos() async {
//     try {
//       Response response =
//           await _dio.get('https://jsonplaceholder.typicode.com/todos/1');
//
//       // 멤버 변수에 값을 담는다.
//       // _todo = Todo.fromJson(response.data);
//     } catch (e) {
//       print('실행 시점(-> 런타임 오류) 예외 발생 ㅠㅠ');
//       // print(t1.toString());
//     }
//   }
// } // end of HomePage3
