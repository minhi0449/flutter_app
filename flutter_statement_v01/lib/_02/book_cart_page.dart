import 'package:flutter/material.dart';

class BookCartPage extends StatelessWidget {
  // 이벤트 리스너 받을 거 없고
  // 사용자가 카트에 저장한 데이터만 화면에 뿌려 주자.
  // 얕은 복사 개념으로
  final List<String> mySelectBooks;
  const BookCartPage({required this.mySelectBooks, super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      // 객체 리스트 만드는 방법 mySelectBooks.map
      children:
          mySelectBooks.map((book) => ListTile(title: Text(book))).toList(),
    );
  }
}
