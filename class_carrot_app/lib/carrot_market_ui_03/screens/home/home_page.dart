import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    print('HomePage() 메모리 호출 확인()');
    return Center(
      child: Text('HomePage'),
    );
  }
}
