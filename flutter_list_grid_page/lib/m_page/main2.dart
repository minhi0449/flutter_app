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
      home: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: Text(
              'pageView.builder',
              style: TextStyle(
                  fontFamily: 'assets/fonts/PatuaOne-Regular.ttf',
                  fontSize: 25,
                  fontWeight: FontWeight.bold),
            ),
          ),
          body: PageView.builder(itemBuilder: (context, index) {
            return Container(
              child: Text('첫 번째 페이지'),
            );
          }),
        ),
      ),
    );
  }
}
