import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: MyStatefulWidget(),
  ));
}

/////////////////////////////////////////////////////////////////////
// point!
// 사실 상태는 변수에 할당된 값이다 . 상태가 있다는 말은
// 값들이 변화할 수 있다는 가능성을 이야기 한다.
class MyStatefulWidget extends StatefulWidget {
  MyStatefulWidget({super.key});

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  // 변수 --> 한 번 초기화 하면 변경 할 수 없음
  // 변수 -- 고정 --> 상수
  final msg = '저는 stateful 위젯 입니다';

  // 변수에 할당된 값이 상수가 아니기 때문에 언제든지 변경이 가능하다.
  // 즉, 여기를 상태변수라고 부른다.
  int count = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        //child: Text('${msg} onTap Count : ${count}'),
        // child: Text('${widget.msg} onTap Count : ${widget.count}'),
        child: InkWell(
          onTap: () {
            setState(() {
              count += 1;
            });
          },
          child: Text('${msg} onTap Count : ${count}'),
        ),
      ),
    );
  }
}
/////////////////////////////////////////////////////////////////////
