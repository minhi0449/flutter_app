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
            alignment: Alignment.bottomRight,
            children: [
              Container(
                width: 200,
                height: 200,
                color: Colors.red,
              ),
              Container(
                width: 300,
                height: 300,
                color: Colors.blueAccent,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
