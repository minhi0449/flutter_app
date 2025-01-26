import 'package:flutter/material.dart';
import 'package:flutter_statement_v01/main.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // TextEditingController 를 사용하여 텍스트 필드의 입력값을 제어
  final username = TextEditingController();
  final password = TextEditingController();
  final scroll = ScrollController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: ListView(
          controller: scroll,
          shrinkWrap: true, // 자식 컨텐츠 높이만큼 ListView 높이를 잡아준다.
          children: [
            Container(
              color: Colors.yellow,
              height: 500,
            ),
            TextFormField(
              onTap: () async {
                print('username textfield');
                // 스크롤 최하단으로 이동
                await Future.delayed(Duration(seconds: 2)); // 1초 동안
                scroll.jumpTo(scroll.position.maxScrollExtent);
              },
              decoration: InputDecoration(
                labelText: 'Username',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16),
            TextFormField(
              onTap: () async {
                print('username textfield');
                // 스크롤 최하단으로 이동
                await Future.delayed(Duration(milliseconds: 2000)); // 2초 동안
                scroll.jumpTo(scroll.position.maxScrollExtent);
              },
              decoration: InputDecoration(
                labelText: 'Password',
                border: OutlineInputBorder(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
