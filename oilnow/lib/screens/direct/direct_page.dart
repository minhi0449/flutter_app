import 'package:flutter/material.dart';

import '../../common/utils/logger.dart';

class DirectPage extends StatelessWidget {
  const DirectPage({super.key});

  @override
  Widget build(BuildContext context) {
    logger.d('DirectPage() 메모리 호출 확인');

    return const Placeholder();
  }
}
