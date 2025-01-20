import 'package:flutter/material.dart';

class ShoppingcartBody extends StatelessWidget {
  const ShoppingcartBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30.0),
          topRight: Radius.circular(30.0),
        ),
      ),
      // 임시 ListView 사용
      child: Column(
        children: [
          _buildBodyNameAndPrice(),
          _buildBodyRatingAndReviewCount(),
          _buildBodyColorOptions(),
          // _buildColorOption(),
          _buildBodyButton(),
        ],
      ),
    );
  } // end of build

  // 1. 이름과 가격
  Widget _buildBodyNameAndPrice() {
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Urban Soft AL 10.0',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 22,
              ),
            ),
            Text(
              '\$699',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 22,
              ),
            ),
          ],
        ),
      ),
    );
  }

  // 2. 별점 리뷰 카운트
  Widget _buildBodyRatingAndReviewCount() {
    return Container(
      child: Row(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Icon(
                    Icons.star,
                    color: Colors.amber,
                    size: 30,
                  ),
                  Icon(
                    Icons.star,
                    color: Colors.amber,
                    size: 30,
                  ),
                  Icon(
                    Icons.star,
                    color: Colors.amber,
                    size: 30,
                  ),
                  Icon(
                    Icons.star,
                    color: Colors.amber,
                    size: 30,
                  ),
                  Icon(
                    Icons.star,
                    color: Colors.amber,
                    size: 30,
                  ),
                ],
              ),
              Text(
                'review',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 20,
                  color: Colors.grey,
                ),
              ),
              Text(
                ' (26)',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w700,
                  color: Colors.blueAccent,
                ),
              )
            ],
          ),
        ],
      ),
    );
  }

  // 3. 색상 옵션 선택
  Widget _buildBodyColorOptions() {
    return Placeholder();
  }

  // 4. 색상 옵션 위젯을 만드는 함수
  Widget _buildColorOption() {
    return Padding(
      padding: EdgeInsets.only(right: 10),
      child: Stack(
        children: [
          // Position 활용
        ],
      ),
    );
  }

  // 5.  버튼 만들기
  Widget _buildBodyButton() {
    return Placeholder();
  }
} // end of body
