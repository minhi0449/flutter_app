import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'common/utils/logger.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // 디버그
    print('hello flutter print');
    logger.d('hello flutter logger ');

    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Text('Main'),
        ),
      ),
    );
  }
}
