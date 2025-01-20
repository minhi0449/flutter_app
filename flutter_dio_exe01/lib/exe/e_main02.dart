import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SafeArea(
          child: Scaffold(
        body: HomePage2(),
      )),
    );
  }
}

class HomePage2 extends StatefulWidget {
  const HomePage2({super.key});

  @override
  State<HomePage2> createState() => _HomePage2State();
}

class _HomePage2State extends State<HomePage2> {
  // 통신을 담당하는 클라이언트 측 객체를 가져오자.
  // 내부에서 사용할 것이기 떄문에 private  -> 접근 지시 제어자 -> _언더스코어
  Dio _dio = Dio();

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
