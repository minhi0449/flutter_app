import 'package:flutter/material.dart';

import '../../common/utils/logger.dart';

class MyPage extends StatelessWidget {
  const MyPage({super.key});

  @override
  Widget build(BuildContext context) {
    logger.d('MyPage() 메모리 호출 확인');
    return const Placeholder();
  }
}
