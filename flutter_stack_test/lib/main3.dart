import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SafeArea(
        child: Scaffold(
          body: Stack(
            //alignment: Alignment(5.0, 5.0),
            //alignment: Alignment.center,
            // Stack  위젯 안에 Positioned  위젯을 사용할 수 있다.
            // alignment: Alignment.bottomRight,
            children: [
              Positioned(
                top: 200,
                left: 55,
                child: Container(
                  width: 300,
                  height: 300,
                  color: Colors.blueAccent,
                ),
              ), // end of blue

              Positioned(
                top: 200,
                left: 55,
                child: Container(
                  width: 200,
                  height: 200,
                  color: Colors.red,
                ),
              ), // end of red

              Positioned(
                top: 200,
                left: 55,
                child: Container(
                  width: 100,
                  height: 100,
                  color: Colors.orangeAccent,
                ),
              ), //

              Positioned(
                top: 200,
                left: 55,
                child: Container(
                  width: 50,
                  height: 50,
                  color: Colors.green,
                ),
              ), //
            ],
          ),
        ),
      ),
    );
  }
}
