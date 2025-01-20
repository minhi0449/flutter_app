import 'package:class_carrot_app/carrot_market_ui_05/screens/home/components/product_detail.dart';
import 'package:flutter/material.dart';
import '../../../models/product.dart';

class ProductItem extends StatelessWidget {
  final Product product; // 여기에 런타임 시점에 객체 끼워둘 거 잖아

  const ProductItem({required this.product, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 135.0,
      padding: EdgeInsets.all(16.0),
      child: Row(
        children: [
          // 이미지
          ClipRRect(
            borderRadius: BorderRadius.circular(10.0),
            child: Image.network(
              product.urlToImage,
              width: 115,
              height: 115,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(width: 16.0),
          // 상품 설명 위젯
          ProductDetail(product: product),
        ],
      ),
    );
  }
}
