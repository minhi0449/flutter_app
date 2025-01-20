// 상대 경로 설정
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../models/product.dart';
import '../components/appbar_preferred_size.dart';
import 'components/product_item.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    print('HomePage() 메모리 호출 확인()');
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        backgroundColor: Colors.white,
        forceMaterialTransparency: true, // scroll 시 bg -> color 변경 x
        title: Row(
          children: [
            Text('좌동'),
            const SizedBox(width: 4.0),
            Icon(
              Icons.keyboard_arrow_down,
              size: 25,
            )
          ],
        ),
        bottom: appBarBottomLine(),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.search),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.list),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(CupertinoIcons.bell),
          ),
        ],
      ),
      // body: ListView.separated(itemBuilder: itemBuilder, separatorBuilder: separatorBuilder, itemCount: itemCount),

      body: ListView.separated(
          itemBuilder: (context, index) =>
              ProductItem(product: productList[index]),
          separatorBuilder: (context, index) => Divider(
                height: 0,
                indent: 16.0,
                endIndent: 16.0,
                color: Colors.grey,
              ),
          itemCount: productList.length),
    );
  }
}
