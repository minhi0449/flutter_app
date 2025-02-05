import 'package:class_f_story/_core/constants/size.dart';
import 'package:flutter/material.dart';

class CustomDrawer extends StatelessWidget {
  // ScaffoldState 스캐아폴드 상태관리 해주는 녀석
  final GlobalKey<ScaffoldState> scaffoldKey;

  const CustomDrawer(this.scaffoldKey, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: getDrawerWidth(context), // 해상도에 맞춰서 width 값 60% 출력
      height: double.infinity,
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextButton(
              onPressed: () {
                // 기능1 -> Drawer 를 닫고
                // 기능2 -> 글쓰기 페이지로 이동
                // scaffoldKey.currentState 이녀석은 null 이 될 수 있기 때문에 null 이 될 수 없다고 설정해줘야 함
                scaffoldKey.currentState!.openEndDrawer();
              },
              child: const Text(
                // 글쓰기 라는 버튼 클릭 시 -> 자동으로 닫히게 하고 싶음
                '글쓰기',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black54,
                ),
              ),
            ),
            const Divider(),
            TextButton(
              onPressed: () {},
              child: const Text(
                '로그아웃',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black54,
                ),
              ),
            ),
            const Divider(),
          ],
        ),
      ),
    );
  }
}
