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
      home: SafeArea(
        child: Scaffold(
          body: GridView.builder(
            // 스크롤 방향을 지정한다.
            // scrollDirection: Axis.horizontal,
            scrollDirection: Axis.vertical,
            // 그리드의 열 개수를 고정하는 속성입니다.
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 16.0,
                mainAxisSpacing: 16.0),
            itemCount: 20,
            itemBuilder: (context, index) {
              // 무슨 제어권을 반환하다 라고 하나요?
              // return 키워드를 작성했을 때, 실행의 제어권을 반납하다라고 함
              // 실타래 같은 thread ~~
              return Container(
                color: Colors.blue,
                child: Center(
                    child: ListView(
                  children: [
                    // 이미지
                    PocketImage('p1', '팬텀'),
                    // ① 텍스트
                    // PocketTitle(),
                    // ① 설명
                    // PocketDes(),
                  ],
                )),
              );
            },
          ),
        ),
      ),
    );
  }
} // end of MyApp

// 포켓몬 이미지
class PocketImage extends StatelessWidget {
  // 멤버 변수
  final String imageName;
  final String title;
  // 생성자 -> 하드 코딩
  const PocketImage(this.imageName, this.title, {super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(10), // 이미지 라운드 처리
          child: Image.asset(
            'assets/images/${imageName}.jpeg',
            fit: BoxFit.cover,
          ),
        ),
      ],
    );
  }
}
