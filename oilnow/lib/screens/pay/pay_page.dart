import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:oilnow/screens/pay/components/my_wallet.dart';
import 'package:oilnow/theme.dart';

import '../../common/utils/logger.dart';

class PayPage extends StatelessWidget {
  const PayPage({super.key});

  @override
  Widget build(BuildContext context) {
    logger.d('PayPage() 메모리 호출 확인');
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Color(0xFFF4F5F7),
        forceMaterialTransparency: true,
        title: Row(
          children: [
            Text(
              '홈',
              style: textTheme().labelMedium,
            ),
            const SizedBox(width: 8.0),
            Text(
              '소셜페이',
              style: textTheme().labelMedium?.copyWith(
                    color: Color(0xFFBDBDBD),
                  ),
            ),
          ],
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              CupertinoIcons.qrcode_viewfinder,
              color: Colors.black,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(
              CupertinoIcons.bell,
              color: Colors.black,
            ),
          ),
        ],
      ),
      body: MyWallet(),
    );
  }
}
