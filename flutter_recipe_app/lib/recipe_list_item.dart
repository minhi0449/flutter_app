import 'package:flutter/material.dart';

class RecipeListItem extends StatelessWidget {
  // 멤버 변수
  final String imageName;
  final String title;
  // 하드 코딩
  const RecipeListItem(this.imageName, this.title, {super.key});

  @override
  Widget build(BuildContext context) {
    // 최상위 위젯 : Column
    return Padding(
      // padding: const EdgeInsets.only(top:20.0, bottom: 20.0),
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 이미지
          AspectRatio(
            aspectRatio: 2 / 1,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20), // 이미지 라운드 처리
              child: Image.asset(
                'assets/images/${imageName}.jpeg',
                fit: BoxFit.cover,
              ),
            ),
          ),

          // 텍스트 1
          Text(title, style: TextStyle(fontSize: 20)),

          // 텍스트 2
          Text("Have you erver..................")
        ],
      ),
    );
  }
}
