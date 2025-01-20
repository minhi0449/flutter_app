import 'package:flutter/material.dart';

import 'inherited_parent.dart';

class BookCartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    InheritedParent inheritedParent =
        // ! 널이 절대 아님을 우리는 알고 있다.!
        context.dependOnInheritedWidgetOfExactType<InheritedParent>()!;

    return ListView(
      // 객체 리스트 만드는 방법 mySelectBooks.map
      children: inheritedParent.state
          .map((book) => ListTile(title: Text(book)))
          .toList(),
    );
  }
}
