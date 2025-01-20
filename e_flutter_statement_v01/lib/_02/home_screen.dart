import 'package:flutter/material.dart';

import 'book_cart_page.dart';
import 'book_list_page.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // 로컬 상태 : 하단에 활성화 된 탭 인덱스 번호
  int pageIndex = 0;

  // 공유 상태 : 카트에 담긴 북 정보 (책 리스트 화면, 장바구니 화면에서 공유하는 데이터)
  // 상품 --> 책 (String) 데이터 타입으로 관리하자.
  List<String> mySelectBook = [];

  // 상태를 변경하는 메서드 만들기
  void _toggleSaveStates(String book) {
    // 화면 다시 그리는 요청 함수 : setState
    setState(() {
      if (mySelectBook.contains(book)) {
        mySelectBook.remove(book);
      } else {
        mySelectBook.add(book);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: Text('미니의 서재🌞'),
        backgroundColor: Theme.of(context).colorScheme.tertiaryContainer,
      ),
      body: IndexedStack(
        index: pageIndex,
        children: [
          BookListPage(),
          BookCartPage(),
        ],
      ),
    ));
  }
}
