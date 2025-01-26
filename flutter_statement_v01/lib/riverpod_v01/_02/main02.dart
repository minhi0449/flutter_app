import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_statement_v01/main.dart';
import 'package:flutter_statement_v01/riverpod_v01/_02/fruit.dart';

import '../../common.utils/logger.dart';

void main() {
  // ProviderScope 사용하기로 함
  // 1. Riverpod을 사용하기 위해서 Provider를 감싼다
  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: FruitPage(),
    );
  }
} // end of MyApp

// 2. 리버팟을 사용하기 위해서 소비자 consumerWidget를 변경해야 한다.
class FruitPage extends ConsumerWidget {
  const FruitPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // 사용하는 측 코드에서 배운 2가지
    // ref.read(...), ref.watch(...)
    // 한 번만 데이터를 가져오려면 무엇을 사용해야 할까?
    // String getFruit = ref.read(fruitProvider); 한 번 읽으면 끝난 거임
    String getFruit = ref.watch(fruitProvider);
    logger.d('getFruit 확인 : ${getFruit}');
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('data 확인 : ${getFruit}'),
            ElevatedButton(
              onPressed: () {
                // 상태 변경 기능은 누가 들고 있을까?
                // 데이터를 가져오는 게 아니라 창고 자체를 들고오는 게 아니라
                // 그 안에 머신을 동작 시켜야 한다
                // read() 메서드는 데이터를 한 번 들고오기도 하지만 창고 자체에 접근 시킬 수 있다.
                //ref.read(fruitProvider);// 창고 제공자 -> 창고 자체를 리턴해 버려
                FruitStore fruitStore = ref.read(fruitProvider
                    .notifier); // 이 녀석이 리턴 시키는 게 창고 -> 창고 자체에 접근 시키는 거
                fruitStore.changeData('딸기');
              },
              child: Text('딸기로 상태 변경하기'),
            ),
          ],
        ),
      ),
    );
  }
}

/**
 * 정리
 * Provider (01 예제) - 1회 알바생
 * - 데이터를 단순히 한 번 제공하는 역할, 상태가 변하지 않는 데이터를 관리를 할 때, 사용하며,
 * 즉, 주로 정적인 데이터를 제공할 때 사용한다.
 * (단순 문자열, 정적 객제 등)
 *
 * StateNotifierProvider(02 예제) - 창고 관리자이다.
 * - 상태를 관리 (state) 변경할 수 있는 창고 관리자 역할이다.
 * 상태 (state)가 변경이 되면 이를 구독(watch)중인 모든 위젯에게 알려준다.
 * ref.read() 창고(FruitStore) 자체 접근할 수 있고,
 * ref.watch 계속 구독하여 상태 변경을 감지할 수 있다.
 *
 *
 *
 *
 */
