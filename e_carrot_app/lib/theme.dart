import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

TextTheme textTheme() {
  return TextTheme(
    // displayLarge : 가장 큰 제목 스타일
    displayLarge: GoogleFonts.openSans(fontSize: 18.0, color: Colors.black),
    // displayMedium : 중간 크기의 제목 스타일
    displayMedium:
        GoogleFonts.openSans(fontSize: 16.0, fontWeight: FontWeight.bold),

    // bodyLarge : 본문 텍스트 스타일
    bodyLarge: GoogleFonts.openSans(fontSize: 16.0, color: Colors.black),
    // bodyMedium : 부제목 , 작은 본문 텍스트 스타일
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
      color: Colors.black, // AppBar 제목 텍스트 색상
    ),
  );
}

// 바텀네비게이션바 _테마 설정
BottomNavigationBarThemeData bottomNavigationBarThemeData() {
  return BottomNavigationBarThemeData(
    selectedItemColor: Colors.orange, // 선택된 아이템 색상
    unselectedItemColor: Colors.black, // 선택되지 않은 아이템 색상
    showUnselectedLabels: true, // 선택 되지 않은 아이템의 라벨 표시 여부 -> true
  );
}

// 전체 ThemeData 설정
ThemeData mTheme() {
  return ThemeData(
    // 머터리얼 3 버전부터 변경됨.
    // (시드머니, 시드값을 설정하면? -> 구글에서 어울리는 색 추천? 암튼 지 맘대로 설정해준다고 함)
    // seedColor : 자동셋팅
    // colorScheme: ColorScheme.fromSeed(seedColor: Colors.orange),

    colorScheme: ColorScheme.fromSwatch(
      primarySwatch: Colors.orange,
    ),
    scaffoldBackgroundColor: Colors.white,
    // 위에 설정 해준 텍스트, 앱바, 바텀네비게이션바 테마 선언해주기
    textTheme: textTheme(),
    appBarTheme: appBarTheme(),
    bottomNavigationBarTheme: bottomNavigationBarThemeData(),
  );
}
