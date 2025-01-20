import 'package:class_carrot_app/carrot_market_ui_01/theme.dart';
import 'package:class_carrot_app/carrot_market_ui_06/models/icon_menu.dart';
import 'package:flutter/material.dart';

class CardIconMenu extends StatelessWidget {
  final List<IconMenu> iconMenuList;

  const CardIconMenu({required this.iconMenuList, super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      // 카드  reset
      margin: EdgeInsets.zero,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(0.0),
      ),
      child: Column(
        children: List.generate(
          iconMenuList.length,
          (index) => Container(
            child: Row(
              children: [
                Icon(
                  iconMenuList[index].iconData,
                  size: 15,
                ),
                Text(
                  iconMenuList[index].title,
                  style: TextTheme().bodyMedium,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
