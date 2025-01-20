import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shopping_cart_app/constants.dart';

//
class ShoppingcartHeader extends StatefulWidget {
  const ShoppingcartHeader({super.key});

  @override
  State<ShoppingcartHeader> createState() => _ShoppingcartHeaderState();
}

class _ShoppingcartHeaderState extends State<ShoppingcartHeader> {
  // 1. 상태
  int selectedId = 0;

  // 어떠한 데이터를 한 번에 관리하고 싶다 ? --> 배열
  List<String> selectPic = [
    'assets/p1.jpeg',
    'assets/p2.jpeg',
    'assets/p3.jpeg',
    'assets/p4.jpeg',
  ];

  // 상태는 행위를 통해서 변경해야 한다.
  void changeSelectId(int sId) {
    // 이렇게 하는 게 좀 더 객체 지향 스럽다.
    setState(() {
      selectedId = sId;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // 이미지를 항상 5 : 3 비율로 유지하기 위해 설정
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: AspectRatio(
            aspectRatio: 5 / 3,
            child: Image.asset(
              selectPic[selectedId],
              fit: BoxFit.cover,
            ),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _buildHeaderSelectorButton(0, Icons.directions_bike),
            _buildHeaderSelectorButton(1, Icons.motorcycle),
            _buildHeaderSelectorButton(2, CupertinoIcons.car_detailed),
            _buildHeaderSelectorButton(3, CupertinoIcons.airplane),
          ],
        ),
        SizedBox(height: 16),
      ],
    );
  }

  Widget _buildHeaderSelectorButton(int sId, IconData mIcon) {
    return Container(
      width: 70,
      height: 70,
      decoration: BoxDecoration(
        color: (selectedId == sId) ? kAccentColor : kSecondaryColor,
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: IconButton(
        onPressed: () {
          changeSelectId(sId);
          // 아이콘 클릭 시 컬러/이미지 변경 하려면 IconButton부터
          // setState(() {
          //   selectedId = sId;
          // });
        },
        icon: Icon(
          mIcon,
          color: Colors.black,
        ),
      ),
    );
  }
} // end of header 위젯
