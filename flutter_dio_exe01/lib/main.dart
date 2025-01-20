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
  // 통신을 담당하는 클라이언트 측 객체를 가져오자.
  // 내부에서 사용할 거기 때문에 private -> 접근 지시 제어자
  Dio _dio = Dio();

  @override
  void initState() {
    // 객체 실행 시 한 번 호출 메서드
    _fetchTodos();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }

  // 통신을 담당하는 메서드를 만들어 보자.
  // 데이터 타입은 대부분 Future
  // Future<void> _fetchTodos() { // 함수에서 생략 가능
  _fetchTodos() async {
    // https://jsonplaceholder.typicode.com/todos/1
    // 통신을 담당하는 코드는 기본적으로  예외처리를 꼭 넣자
    try {
      Response response =
          await _dio.get('https://jsonplaceholder.typicode.com/todos/1');
      print('💻 HTTP status code : ${response.statusCode}');
      print('💾 서버측 전달한 데이터 : ${response.data}');
      print(
          '📡 json 통신 후 dart 에서는 어떤 타입으로 변경 되었을까? : ${response.data.runtimeType}');

      // Map 타입 --> 호출 문법
      // Map 타입의 값을 출력하는 방법
      print(
          '-------------------------------------------------------------------------------------------');
      print('💌 data -> title 값 확인 :  ${response.data['title']}');
    } catch (e) {
      print('실행 시점 예외가 발생 했어요');
      print(e.toString());
    }
  }
}
