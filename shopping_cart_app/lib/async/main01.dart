import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SafeArea(
          child: Scaffold(
        body: ParentView(),
      )),
    );
  }
}

// 부모 클래스
class ParentView extends StatefulWidget {
  const ParentView({super.key});

  @override
  State<ParentView> createState() => _ParentViewState();
}

class _ParentViewState extends State<ParentView> {
  String displayText = '여기는 부모 위젯 변수야';

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
            flex: 1,
            child: Center(
              child: Text(displayText),
            )),
        Expanded(flex: 1, child: ChildA()),
        Expanded(flex: 1, child: ChildB()),
      ],
    );
  }
}

// 자식 a
class ChildA extends StatelessWidget {
  const ChildA({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(30.0),
      child: InkWell(
        onTap: () {
          print('child a 에 이벤트 발생 📍📍');
        },
        child: Container(
          width: double.infinity, // 부모 위젯 크기 안에서 크기를 무한대로 확장하라
          color: Colors.orangeAccent,
          child: Center(
            child: Text('CHILD A'),
          ),
        ),
      ),
    );
  }
}

// 자식 b
class ChildB extends StatelessWidget {
  const ChildB({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(30.0),
      child: InkWell(
        onTap: () {
          print('child b 에 이벤트 발생 💚💚');
        },
        child: Container(
          width: double.infinity, // 부모 위젯 크기 안에서 크기를 무한대로 확장하라
          color: Colors.green,
          child: Center(
            child: Text('CHILD B'),
          ),
        ),
      ),
    );
  }
}
