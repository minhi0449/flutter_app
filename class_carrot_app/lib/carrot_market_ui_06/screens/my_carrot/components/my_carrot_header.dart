import 'package:class_carrot_app/carrot_market_ui_01/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MyCarrotHeader extends StatelessWidget {
  const MyCarrotHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0.5,
      // margin: EdgeInsets.all(00.0), // 명시적으로 0 값을 줄 땐, zero
      margin: EdgeInsets.zero,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(0.0),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Column(
          children: [
            // row()
            _buildProfileRow(),
            const SizedBox(height: 25),
            // 프로필 버튼
            _buildProfleButton(),
            const SizedBox(height: 25),
            // 라운드 텍스트 버튼
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildRoundTextButton('판매내역', FontAwesomeIcons.receipt),
                _buildRoundTextButton('구매내역', FontAwesomeIcons.bagShopping),
                _buildRoundTextButton('관심목록', FontAwesomeIcons.heart),
              ],
            ),
          ],
        ),
      ),
    );
  } // end of build

  // 프로필
  Widget _buildProfileRow() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        children: [
          Stack(
            children: [
              SizedBox(
                width: 65,
                height: 65,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(32.5),
                  child: Image.network(
                    'http://picsum.photos/200/100',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Positioned(
                bottom: 0,
                right: 0,
                child: Container(
                  width: 25,
                  height: 25,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15.0),
                    color: Colors.grey[100],
                  ),
                  child: Icon(
                    CupertinoIcons.camera,
                    size: 15,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(width: 16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('김미니마니무', style: textTheme().displayMedium),
              const SizedBox(height: 10),
              Text('우동 #961011', style: textTheme().displaySmall),
            ],
          ),
        ],
      ),
    );
  } // end of _buildProfileRow

  // 프로필 보기
  Widget _buildProfleButton() {
    return Padding(
      padding: const EdgeInsets.only(left: 16.0, right: 16.0),
      child: Container(
        height: 45,
        decoration: BoxDecoration(
          border: Border.all(
            color: Color(0xFFD4D5DD),
            width: 1.0,
          ),
          borderRadius: BorderRadius.circular(6.0),
        ),
        child: Center(
          child: Text(
            '프로필 보기',
            style: textTheme().titleMedium,
          ),
        ),
      ),
    );
  }

  _buildRoundTextButton(String title, IconData mIcon) {
    return Column(
      children: [
        Container(
          width: 60,
          height: 60,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30.0),
            color: Color.fromRGBO(255, 226, 208, 1),
            border: Border.all(width: 0.5, color: Colors.grey),
          ),
          child: Icon(
            mIcon,
            color: Colors.orange,
          ),
        ),
        Text(title, style: textTheme().titleMedium),
      ],
    );
  } // end of _buildProfleButton
} // end of MyCarrotHeader
