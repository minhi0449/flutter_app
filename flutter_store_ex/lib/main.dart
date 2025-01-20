import 'package:flutter/material.dart';

// 코드의 시작점
void main() {
  runApp(MyApp());
} // end of main

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // Flutter 를 개발할 때, 맨 밑바닥부터 개발하는 것은 힘들다.
  // 기본적으로 개발을 할 수 있도록 매우 유용한 클래스를 제공한다.
  // MaterialApp 머터리얼앱
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // div 박스와 같은 녀석 = home
      home: StorePage(),
    );
  }
} // end of MyApp

class StorePage extends StatelessWidget {
  const StorePage({super.key});

  @override
  Widget build(BuildContext context) {
    // Scaffold : 시각적 레이아웃 구조를 잡아주는 위젯
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(25.0),
              child: Row(
                children: [
                  Text(
                    'Woman',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Spacer(),
                  Text(
                    'Kids',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Spacer(),
                  Text(
                    'Shoes',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Spacer(),
                  Text(
                    'Bag',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ), //end of Row
            Image.asset(
              "assets/bag.jpeg",
              fit: BoxFit.cover,
            ),
            Image.asset(
              "assets/cloth.jpeg",
              fit: BoxFit.cover,
            ),
          ],
        ),
      ),
    );
  }
}
