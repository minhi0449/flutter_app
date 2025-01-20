import 'package:flutter/material.dart';

import '../common.utils/logger.dart';
import 'inherited_parent.dart';

class BookListPage extends StatelessWidget {
  BookListPage({
    super.key,
  }); // 이벤트 전달 받을 수 있게끔 했음

  // 임시 데이터 -  교보문고에서 볼 수 있는 책 목록 리스트
  final List<String> books = ['호모사피엔스', 'Dart입문', '홍길동전', '코드리팩토링', ' 전치사도감'];

  @override
  Widget build(BuildContext context) {
    // BuildContext 를 사용하여 우리가
    // 정의한 InheritedParent 위젯에 접근할 수 있다.

    InheritedParent? inheritedParent =
        context.dependOnInheritedWidgetOfExactType();

    // 공유 상태 데이터 -> 즉, 카트에 넣어둔, String  값을 가지고 와야 한다.
    List<String> selectedBook = inheritedParent?.state ?? []; // ⭐ 빈 배열 넣는 거 중요
    // logger.d('데이터 확인 : ${selectedBook.toString()}');
    return inheritedParent == null
        ? Center(child: Text('데이터가 없네요'))
        : ListView(
            children: books.map(
              // book <-- 은 books 의 0 인덱스는 '호모사피엔스';
              (book) {
                // 함수의 바디에는 식을 작성할 수 있다.
                // 사용자가 장바구니에 넣었는지? 안 넣었는지? 어떻게 확인할 수 있을까?
                // 부모가 관리하는 장바구니 데잍너에 book 이란 데이터가
                // 있는가 없는가 체크하고자 한다면?
                // contains 자료구조이고 , 지금은 빈 배열인 상태
                final isSelectedBook = selectedBook.contains(book);
                return ListTile(
                  leading: Container(
                    width: 35,
                    height: 35,
                    decoration: BoxDecoration(
                      color: Theme.of(context).secondaryHeaderColor,
                      borderRadius: BorderRadius.circular(8.0),
                      border: Border.all(color: Colors.black),
                    ),
                  ),
                  title: Text(
                    book,
                    style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                  ),
                  trailing: IconButton(
                    // 클릭 시 여기서 콜백 일어남
                    onPressed: () {
                      // 부모에게 콜백을 호출하는데 데이터도 함께 전달시킨다.
                      inheritedParent.onPressed(book);
                      // onToggleSaved(book);
                    },
                    icon: Icon(
                      // isSelectedBook --> map 안에 지역 변수
                      isSelectedBook ? Icons.remove_circle : Icons.add_circle,
                      color: isSelectedBook ? Colors.redAccent : Colors.green,
                    ),
                  ),
                );
              },
            ).toList(),
          );
  }
}
