import 'package:flutter/material.dart';
// 외부 라이브러리 가져옴
import 'package:flutter_svg/flutter_svg.dart';

// 계속 변경되는 이미지가 아니기 때문에 --> StatelessWidget
class Logo extends StatelessWidget {
  const Logo(this.title, {super.key});

  // 로고라는 걸 재정의하는데
  final String title;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SvgPicture.asset(
          width: 70,
          height: 70,
          'assets/logo.svg',
        ),
        Text(
          title,
          style: TextStyle(
            fontSize: 40,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
