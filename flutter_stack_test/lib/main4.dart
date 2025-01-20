import 'package:flutter/material.dart';
import 'package:flutter_stack_test/main.dart';

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
          body: Positioned(
            top: 200,
            left: 55,
            child: Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  width: 300,
                  height: 300,
                  color: Colors.blueAccent,
                ),
                Container(
                  width: 200,
                  height: 200,
                  color: Colors.redAccent,
                ),
                Container(
                  width: 100,
                  height: 100,
                  color: Colors.orangeAccent,
                ),
                Container(
                  width: 50,
                  height: 50,
                  color: Colors.green,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
