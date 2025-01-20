// GridView 위젯
// 항목을 나열하는 위젯이지만 , 리스트 뷰와 달리 한 줄에 여러 개를 함께 나열할 수 있음
// 그리드 형태

// 그리드 두 방향을 설정하지 않으면 가로를 가리킴

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
      home: Scaffold(
        body: GridView.builder(
          // 스크롤 방향을 지정한다.
          // scrollDirection: Axis.horizontal,
          scrollDirection: Axis.vertical,
          // 그리드의 열 개수를 고정하는 속성입니다.
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3, crossAxisSpacing: 16.0, mainAxisSpacing: 16.0),
          itemCount: 20,
          itemBuilder: (context, index) {
            // 무슨 제어권을 반환하다 라고 하나요?
            // return 키워드를 작성했을 때, 실행의 제어권을 반납하다라고 함
            // 실타래 같은 thread ~~
            return Container(
              color: Colors.blue,
              child: Center(
                child: Text(
                  '${index}',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
