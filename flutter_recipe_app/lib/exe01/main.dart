import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_recipe_app/exe01/recipe_list_item.dart';
import 'package:flutter_recipe_app/exe01/recipe_menu.dart';
import 'package:flutter_recipe_app/main.dart';
import 'package:flutter_recipe_app/exe01/recipe_title.dart';

// 새로 연습하는 코드
// 플러터 코드의 시작점
void main() {
  // MyApp 위젯을 루트 위젯으로 만들어 주는 함수이다.
  // 사전 기반 지식 ---> 위젯 트리를 떠올려 주세요.
  runApp(MyApp());
}

// 위젯을 만들 때, 크게 두 가지로 구분 한다.
// StatelessWidget 특징은 뭘까? -> 위젯은 상태 변경이 없는 위젯을 화면에 그릴 때, 선택한다.

// 상속 문법 사용
// 우리들만의 약속 - MyApp -> 머터리얼 앱 (Google 디자인 철학) 객체를 활용하자.
// 쿠퍼티노 앱 (ios 철학)
class MyApp extends StatelessWidget {
  // 생성자 - 선택적 명명 매개변수 (값을 넣어도 되고, 안 넣어도 되고 - 옵션)
  MyApp({super.key});

  // 보통 루트 위젯을 시작할 때, MaterialApp을 많이 활용한다.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, // debug 배너 없애주는 거
      theme: ThemeData(fontFamily: 'PatuaOne'),
      // home : -> 앱이 실행되었을 때, 첫 페이지를 지정할 수 있다.
      home: RecipePage(),
    );
  }
} // end of class

// 우리들의 규칙 2 - 페이지라고 이름 붙이는 클래스는 스캐아폴더(Scaffold)를 활용하자.
class RecipePage extends StatelessWidget {
  const RecipePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar : 시각적 레이아웃 구조를 잡아주는 위젯
      appBar: _buildRecipeAppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            // 타이틀
            RecipeTitle(),
            // 메뉴
            RecipeMenu(),
            // 레시피 아이템 1
            RecipeListItem('coffee', 'Made Coffee'),
            // 레시피 아이템 2
            RecipeListItem('burger', 'Made Burger'),
            // 레시피 아이템 3
            RecipeListItem('pizza', 'Made Pizza'),
          ],
        ),
      ),
    );
  }
}

// 메서드를 만들어 보자.
// 접근 제어 지시자 : private
AppBar _buildRecipeAppBar() {
  return AppBar(
    backgroundColor: Colors.white,
    iconTheme: IconThemeData(color: Colors.black),
    actions: [
      Icon(CupertinoIcons.search, color: Colors.black),
      SizedBox(width: 15),
      Icon(CupertinoIcons.heart, color: Colors.redAccent),
      SizedBox(width: 15),
    ],
  );
}
