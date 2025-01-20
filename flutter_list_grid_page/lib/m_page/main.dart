// PageView 위젯
//  스와이프 이벤트에 반응하여 항목을 보여주는 위젯
// 스와이프 했을 때, 70% 비율인지 그거 정하는 코드
import 'package:flutter/material.dart';
import 'package:flutter_list_grid_page/m_grid/main.dart';

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
          appBar: AppBar(
            title: Text('pageView'),
          ),
          body: PageView(
            controller: PageController(
              initialPage: 2,
              viewportFraction: 0.9, // 사용자가 처음에 스와이프가 있는지 잘 모를때, 살짝 보여주는 용도
            ),
            children: [
              Container(
                margin: EdgeInsets.all(0.0),
                color: Colors.redAccent,
              ),
              Container(
                margin: EdgeInsets.all(0.0),
                color: Colors.blueAccent,
              ),
              Container(
                margin: EdgeInsets.all(0.0),
                color: Colors.green,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
