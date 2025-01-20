import 'package:flutter/material.dart';
import 'package:flutter_stack_test/main.dart';

// 반투명
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Stack(
            children: [
              // 배경을 꾸며 보자.
              Container(
                width: 300,
                height: 300,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/images/p7.jpeg'),
                        fit: BoxFit.cover),
                    borderRadius: BorderRadius.circular(15)),
              ),
              // 반투명 레이어 (직접 만드는 것임)
              Container(
                width: 300,
                height: 300,
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.5),
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
              Text(
                'Flutter',
                style: TextStyle(fontSize: 24),
              )
            ],
          ),
        ),
      ),
    );
  }
}
