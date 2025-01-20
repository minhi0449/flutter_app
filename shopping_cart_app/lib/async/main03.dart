import 'package:flutter/material.dart';

// 3단계 - 자식에게 온 데이터를 전달 받아 화면에 그려보기
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
  void handleChildEvent(String message) {
    // 인수값을 통해서 이 녀석을 대입해줘도 되겠네?
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
        // 매개변수가 있는 녀석만 들어올 수 있다
        Expanded(flex: 1, child: ChildA(onCallbackReceived: handleChildEvent)),
        Expanded(flex: 1, child: ChildB(onCallbackReceived: handleChildEvent)),
      ],
    );
  }
}

// 자식 a
class ChildA extends StatelessWidget {
  const ChildA({required this.onCallbackReceived, super.key});

  final Function(String message) onCallbackReceived; // 익명함수라는 데이터타입

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(30.0),
      child: InkWell(
        onTap: () {
          print('child a 에 이벤트 발생 📍📍');
          // Function 이라는 데이터 타입
          // onCallbackReceived(); --> 호출의 의미
          // 함수의 모양이 바뀌어서
          onCallbackReceived('A가 연산한 데이터를 전달 했음');
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

  final Function(String message) onCallbackReceived;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(30.0),
      child: InkWell(
        onTap: () {
          print('child b 에 이벤트 발생 💚💚');
          onCallbackReceived('자식 b가 연산한 데이터 전달'); // 이거 누르면 부모에게 진동벨이 전달
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
