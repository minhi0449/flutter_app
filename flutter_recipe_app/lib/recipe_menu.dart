import 'package:flutter/material.dart';

class RecipeMenu extends StatelessWidget {
  const RecipeMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          _buildMenuIcon(Icons.food_bank, 'ALL'),
          SizedBox(width: 25),
          _buildMenuIcon(Icons.emoji_food_beverage, 'Coffee'),
          SizedBox(width: 25),
          _buildMenuIcon(Icons.fastfood, 'Burger'),
          SizedBox(width: 25),
          _buildMenuIcon(Icons.local_pizza, 'Pizza'),
        ],
      ),
    );
  }

  // 메서드 만들어 보기
  // Container 위젯을 꾸며 주고 싶다면...
  Widget _buildMenuIcon(IconData mIcon, String text) {
    // Container 위젯에 Color 속성과 Decoration 함께 쓰면
    // 무조건 오류
    return Container(
      width: 60,
      height: 80,
      // color: Colors.red, // 같이 사용하면 무조건 오류
      decoration: BoxDecoration(
          border: Border.all(color: Colors.black12),
          borderRadius: BorderRadius.circular(30)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            mIcon,
            color: Colors.redAccent,
          ),
          SizedBox(
            height: 5,
          ),
          Text(
            text,
            style: TextStyle(color: Colors.black54),
          )
        ],
      ),
    );
  }
}
