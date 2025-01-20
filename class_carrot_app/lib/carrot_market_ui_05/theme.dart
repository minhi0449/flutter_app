import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// 텍스트 테마
TextTheme textTheme() {
  return TextTheme(
    // displayLarge : 가장 큰 제목 스타일
    displayLarge: GoogleFonts.openSans(fontSize: 18.0, color: Colors.black),
    // displayMedium : 중간 크기의 제목 스타일
    displayMedium: GoogleFonts.openSans(
        fontSize: 16.0, color: Colors.black, fontWeight: FontWeight.bold),
    // bodyLarge : 본문 텍스트 스타일 (기사, 설명)
    bodyLarge: GoogleFonts.openSans(fontSize: 16.0, color: Colors.black),
    // bodyMedium : 부제목, 작은 본문 텍스트 스타일
    bodyMedium: GoogleFonts.openSans(fontSize: 14.0, color: Colors.grey),
    // 중간 크기의 제목 스타일
    titleMedium: GoogleFonts.openSans(fontSize: 15.0, color: Colors.black),
  );
}

// AppBar 테마 설정
AppBarTheme appBarTheme() {
  return AppBarTheme(
    centerTitle: false,
    color: Colors.white,
    elevation: 0.0,
    iconTheme: IconThemeData(color: Colors.black),
    titleTextStyle: GoogleFonts.openSans(
        fontSize: 16,
        fontWeight: FontWeight.bold,
        color: Colors.black // 앱바 제목 텍스트 색상
        ),
  );
}

// 바텀네비게이션바 _테마 설졍
BottomNavigationBarThemeData bottomNavigationBarTheme() {
  return BottomNavigationBarThemeData(
    selectedItemColor: Colors.orange, // 선택된 아이템 색상
    unselectedItemColor: Colors.black, // 선택되지 않은 아이템 색상
    showUnselectedLabels: true, // 선택 안 된 라벨 표시 여부 설정
  );
}

// 전체 ThemeData 설정
ThemeData mTheme() {
  return ThemeData(
    // 머터리얼 3 버전 부터 변경 됨. (시드머니, 시드값을 설정하면? 구글에서 어울리는 색 맘대로 설정함)
    // 자동 셋팅
    //colorScheme: ColorScheme.fromSeed(seedColor: Colors.orange),
    colorScheme: ColorScheme.fromSwatch(
      primarySwatch: Colors.orange,
    ),
    scaffoldBackgroundColor: Colors.white,
    textTheme: textTheme(),
    appBarTheme: appBarTheme(),
    bottomNavigationBarTheme: bottomNavigationBarTheme(),
  );
}
