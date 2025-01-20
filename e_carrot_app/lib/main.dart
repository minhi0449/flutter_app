import 'package:e_carrot_app/screens/main_screens.dart';
import 'package:e_carrot_app/theme.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'carrot_market_ui',
      debugShowCheckedModeBanner: false,
      theme: mTheme(),
      home: MainScreens(),
    );
  }
}
