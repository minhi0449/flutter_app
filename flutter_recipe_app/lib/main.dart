import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_recipe_app/recipe_list_item.dart';
import 'package:flutter_recipe_app/recipe_menu.dart';
import 'recipe_title.dart';

// 플러터 코드의 시작점
void main() {
  // MyApp 위젯을 루트 위젯으로 만들어 주는 함수 이다.
  // 사전 기반 지식 ---. 위젯 트리를 떠올려 주세요.
  runApp(MyApp());
}

// 위젯을 만들 때, 크게 두 가지로 구분한다.
// StatelessWidget 특징은 뭘까? : 정적인 위젯 만들 때 / 나눈 이유는 메모리 효율을 위해서
// StatefulWidget
// StatelessWidget 위젯은 상태 변경이 없는 위젯을 화면에 그릴 때, 선택한다.

// 상속문법 사용
// 우리들만의 약속 -  MyApp -> 머터리얼 앱(Google 디자인 철학) 객체를 활용하자.
// 쿠퍼티노 앱 (ios 철학)
class MyApp extends StatelessWidget {
  // 생성자 - 선택적 명명 매개변수 (값을 넣어도 되고 , 안 넣어도 되고 - 옵션)
  MyApp({super.key});

  // 빌드 메서드는
  // 라이프 사이클 : 생명 주기 - 메모리에 올라갔다 내려가는 것을
  // 템플릿 메서드 패턴
  // 서블릿 클래스

  // 보통 루트 위젯을 시작할 때, MaterialApp을 많이 활용한다.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: 'PatuaOne'),
      // 앱이 실행되었을 때, 첫페이지를 지정할 수 있다.
      home: RecipePage(),
    );
  }
} // end of class

// 우리들만의 규칙 2 - 페이지라고 이름 붙이는 클래스는 스캐아폴더를 활용하자.
class RecipePage extends StatelessWidget {
  const RecipePage({super.key});

  @override
  Widget build(BuildContext context) {
    // 시각적 레이아웃 구조를 잡아주는 위젯
    // app 영역
    // body 영역
    // bottom 영역
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: _buildRecipeAppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: ListView(
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
  } // end of build method

  // 메서드를 만들어 보자.
  // 접근 제어 지시자 : private
  AppBar _buildRecipeAppBar() {
    return AppBar(
      backgroundColor: Colors.white,
      bottom: PreferredSize(
          preferredSize: Size.fromHeight(1.0), // 구분선의 높이 설정
          child: Container(
            color: Colors.grey, // 구분선의 색상
            height: 1.0, // 구분선의 두께
          )),
      iconTheme: IconThemeData(color: Colors.black),
      // elevation: 1.0, // 그림자 속성
      actions: [
        Icon(CupertinoIcons.search, color: Colors.black),
        SizedBox(width: 15),
        Icon(CupertinoIcons.heart, color: Colors.redAccent),
        SizedBox(width: 15)
      ],
    );
  }
}
