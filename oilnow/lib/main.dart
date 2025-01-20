import 'package:flutter/material.dart';
import 'package:oilnow/common/utils/logger.dart';
import 'package:oilnow/screens/main_screen.dart';
import 'package:oilnow/theme.dart';

void main() {
  runApp(OilNowUI());
}

class OilNowUI extends StatelessWidget {
  const OilNowUI({super.key});

  @override
  Widget build(BuildContext context) {
    // debug
    logger.d('flutter logger');
    return MaterialApp(
      title: 'travel_ui',
      debugShowCheckedModeBanner: false,
      theme: mTheme(),
      home: MainScreen(),
    );
  }
}
