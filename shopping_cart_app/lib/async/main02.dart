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

  // 메서드를 선언해 보자
  void handleChildEvent() {
    // build() 라는 메서드 호출
    setState(() {
      // 상태를 담고 있는 display
      displayText = '야 어딘지는 모르겠지만 자식 위젯에서 이벤트 발생';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // 뭔가 이벤트가 일어났다는 걸 알기 위해 매개체가 있어야 한다.
        // 익명함수를 전달한다
        // 학교 보내고 일 있으면 진동벨 눌러라고 한다.
        // 태어난 시점이 어디죠?
        Expanded(flex: 1, child: Center(child: Text(displayText))),
        Expanded(flex: 1, child: ChildA(onCallbackReceived: handleChildEvent)),
        Expanded(flex: 1, child: ChildB(onCallbackReceived: handleChildEvent)),
      ],
    );
  }
}

// 자식 a
class ChildA extends StatelessWidget {
  const ChildA({required this.onCallbackReceived, super.key});

  final Function onCallbackReceived; // 익명함수라는 데이터타입
  // 생성자를 주입 받게 하려면 ? => this. 하면 됨
  // 반드시 final 에는 초기화 해줘야하는

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(30.0),
      child: InkWell(
        onTap: () {
          print('child a 에 이벤트 발생 📍📍');
          // Function 이라는 데이터 타입
          // onCallbackReceived(); --> 호출의 의미
          onCallbackReceived();
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
  const ChildB({required this.onCallbackReceived, super.key});

  final Function onCallbackReceived;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(30.0),
      child: InkWell(
        onTap: () {
          print('child b 에 이벤트 발생 💚💚');
          onCallbackReceived(); // 이거 누르면 부모에게 진동벨이 전달
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
