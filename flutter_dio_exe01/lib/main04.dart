import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SafeArea(
          child: Scaffold(
        body: HomePage(),
      )),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Dio _dio = Dio();
  // 모델링한 객체 추가
  Todo? _todo; // 통신에 실패할 수도 있으니까 ? -> 옵셔널 추가

  @override
  void initState() {
    // 객체 실행 시 한 번 호출 메서드
    _fetchTodos();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: _todo == null
          ? CircularProgressIndicator()
          : Column(
              children: [
                // null 이 아닐 때, 실행
                Text('userId : ${_todo!.userId}'),
                Text('id : ${_todo!.id}'),
                Text('title : ${_todo!.title}'),
                Text('completed : ${_todo!.completed}'),
              ],
            ),
    );
  }

  // 통신을 담당하는 메서드를 만들어 보자.
  // 데이터 타입은 대부분 Future
  // Future<void> _fetchTodos() { // 함수에서 생략 가능
  _fetchTodos() async {
    try {
      Response response =
          await _dio.get('https://jsonplaceholder.typicode.com/todos/1');

      // 멤버 변수 값을 담는다.
      _todo = Todo.fromJson(response.data);
      setState(() {});
      // build 만 하면
      // 암튼 화면 다시 그려야 함

      print(
          '-------------------------------------------------------------------------------------------');
      // Map 으로 들어온 데이터를 Todo 객체를 생성해서 상태값을 담아보시오.
      print('');
      Todo t1 = Todo(
          userId: response.data['userId'],
          id: response.data['id'],
          title: response.data['title'],
          completed: response.data['completed']);
      print(t1.toString());
    } catch (e) {
      print('실행 시점 예외가 발생 했어요');
      print(e.toString());
    }
  }
}

// dart 는 기본적으로 null 값을 허용 x
// dart
class Todo {
  int? userId;
  int? id;
  String? title;
  bool? completed;

  Todo(
      {required this.userId,
      required this.id,
      required this.title,
      required this.completed});

  // dart 생성자 --> 명명된 생성자 (생성자에 이름이 있다)
  Todo.fromJson(Map<String, dynamic> json)
      : userId = json['userId'],
        id = json['id'],
        title = json['title'],
        completed = json['completed'];

  @override
  String toString() {
    return 'Todo{userId: $userId, id: $id, title: $title, completed: $completed}';
  }
}
