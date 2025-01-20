import 'package:flutter/material.dart';

import '../common.utils/logger.dart';
import 'book_cart_page.dart';
import 'book_list_page.dart';

// 상태가 있는 위젯
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // 로컬 상태 : 하단에 활성화 된 탭 인덱스 번호
  int pageIndex = 0;

  // 공유 상태 : 카트에 담긴 북 정보(책 리스트 화면, 장바구니 화면에서 공유하는 데이터)
  // 상품 --> 책 (String) 데이터 타입으로 관리하자.
  List<String> mySelectBook = [];

  // 상태를 변경하는 메서드 만들기
  void _toggleSaveStates(String book) {
    // 다시 화면을 그려라 요청 함수
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
    logger.d('HomeScreen build 메서드 호출됨');
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('텐코의 서재'),
          backgroundColor: Theme.of(context).colorScheme.tertiaryContainer,
        ),
        // 인덱스위젯 콜백 해주는 위젯 : IndexedStack
        body: IndexedStack(
          // 반드시 추가해야 되는 속성
          index: pageIndex,
          children: [
            BookListPage(
              // _toggle? 차이점은?
              // 최첨단 진동벨 -> 메시지도 같이 보낼 수 있음
              onToggleSaved: _toggleSaveStates,
              selectedBook: mySelectBook, // 부모한테 전달해줌
            ),
            BookCartPage(mySelectBooks: mySelectBook),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          // 필수 속성
          currentIndex: pageIndex,
          onTap: (index) {
            // 행위 .. 생략
            setState(() {
              pageIndex = index; // 호출 되어야
            });
          },
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.list),
              label: 'book-list',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart),
              label: 'cart',
            ),
          ],
        ),
      ),
    );
  }
}
