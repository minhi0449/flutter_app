import 'package:class_carrot_app/carrot_market_ui_04/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../models/product.dart';
import 'package:intl/intl.dart';

class ProductDetail extends StatelessWidget {
  final Product product;

  const ProductDetail({required this.product, super.key});

  @override
  Widget build(BuildContext context) {
    // 움직일 공간이 있어야 정렬이 됨 -> Expanded
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            product.title,
            style: textTheme().bodyLarge,
          ),
          const SizedBox(height: 4.0),
          Text(
            '${product.address} · ${product.publishedAt}',
          ),
          const SizedBox(height: 4.0),
          Text(
            '${numberFormat(product.price)}',
            style: textTheme().displayMedium,
          ),
          // 움직일 공간이 있어야 정렬이 됨 -> Expanded
          const Spacer(),
          // 좋아요, 리뷰 개수
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Visibility(
                // 비교 연산자 --> bool (true | false)
                visible: product.commentsCount > 0,
                child: _buildIcons(
                  product.commentsCount,
                  CupertinoIcons.chat_bubble_2,
                ),
              ),
              const SizedBox(width: 8.0),
              Visibility(
                // 비교 연산자 --> bool (true | false)
                visible: product.heartCount > 0,
                child: _buildIcons(
                  product.heartCount,
                  CupertinoIcons.heart,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  // formatting (포맷팅)
  // 포맷 함수 만들어 보기 (35,000)
  String numberFormat(String price) {
    final formatter = NumberFormat('#,###');
    // 형 변환 처리
    return formatter.format(int.parse(price));
  } // end of numberFormat

  Widget _buildIcons(int count, IconData mIcon) {
    return Row(
      children: [
        Icon(mIcon, size: 14.0),
        const SizedBox(width: 4.0),
        Text('$count'), // 하나만 사용할 거면 중괄호 생략 가능
      ],
    );
  }
} // end of ProductDetail
