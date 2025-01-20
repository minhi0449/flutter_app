import 'package:flutter/material.dart';

// Text Theme
TextTheme textTheme() {
  return TextTheme(
    displayLarge: TextStyle(
      fontFamily: 'SUIT',
      fontWeight: FontWeight.w100, // Thin
      color: Color(0xFF000000),
    ),
    displayMedium: TextStyle(
      fontFamily: 'SUIT',
      fontWeight: FontWeight.w200, // ExtraLight
      color: Color(0xFF000000),
    ),
    bodyLarge: TextStyle(
      fontFamily: 'SUIT',
      fontWeight: FontWeight.w300, // Light
      color: Color(0xFF000000),
    ),
    bodyMedium: TextStyle(
      fontFamily: 'SUIT',
      fontWeight: FontWeight.w400, // Regular
      color: Color(0xFF000000),
    ),
    titleMedium: TextStyle(
      fontFamily: 'SUIT',
      fontWeight: FontWeight.w500, // Medium
      color: Color(0xFF000000),
    ),
    titleSmall: TextStyle(
      fontFamily: 'SUIT',
      fontWeight: FontWeight.w600, // SemiBold
      color: Color(0xFF000000),
    ),
    labelLarge: TextStyle(
      fontFamily: 'SUIT',
      fontWeight: FontWeight.w700, // Bold
      color: Color(0xFF000000),
    ),
    labelMedium: TextStyle(
      fontFamily: 'SUIT',
      fontWeight: FontWeight.w800, // ExtraBold
      color: Color(0xFF000000),
    ),
  );
}

// AppBar Theme
AppBarTheme appBarTheme() {
  return AppBarTheme(
    centerTitle: false,
    elevation: 0.0,
    iconTheme: IconThemeData(color: Color(0x000000FF)),
    titleTextStyle: TextStyle(
      fontFamily: 'SULT',
      fontWeight: FontWeight.w800,
      fontSize: 30,
    ),
  );
}

// Bottom Navigation Bar
BottomNavigationBarThemeData bottomNavigationBarThemeData() {
  return BottomNavigationBarThemeData(
    selectedItemColor: Color(0xFF0EAFFE),
    unselectedItemColor: Color(0xFFBDBDBD),
    showUnselectedLabels: true,
  );
}

// 전체 Theme 설정
ThemeData mTheme() {
  return ThemeData(
    colorScheme: ColorScheme.fromSwatch(
      // primarySwatch: Color(0xFF0EAFFE),
      primarySwatch: Colors.grey,
    ),
    scaffoldBackgroundColor: Color(0xFFF4F5F7),
    textTheme: textTheme(),
    appBarTheme: appBarTheme(),
    bottomNavigationBarTheme: bottomNavigationBarThemeData(),
  );
}
