import 'package:class_carrot_app/carrot_market_ui_06/models/icon_menu.dart';
import 'package:flutter/material.dart';

import '../../../carrot_market_ui_05/screens/components/appbar_preferred_size.dart';
import 'components/card_icon_menu.dart';
import 'components/my_carrot_header.dart';

class MyCarrotPage extends StatelessWidget {
  const MyCarrotPage({super.key});

  @override
  Widget build(BuildContext context) {
    print('HomePage() 메모리 호출 확인()');
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: Text('나의 당근'),
        actions: [
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.settings,
                color: Colors.black,
              )),
        ],
        bottom: appBarBottomLine(),
      ),
      body: ListView(
        children: [
          // 헤더
          MyCarrotHeader(),
          const SizedBox(height: 8.0),
          // 아이콘 메뉴  1 - 카드 레이아웃
          CardIconMenu(iconMenuList: iconMenu1),
          const SizedBox(height: 8.0),
          // 아이콘 메뉴  2 - 카드 레이아웃
          CardIconMenu(iconMenuList: iconMenu2),
          const SizedBox(height: 8.0),
          // 아이콘 메뉴  3 - 카드 레이아웃
          CardIconMenu(iconMenuList: iconMenu3),
        ],
      ),
    );
  }
}
