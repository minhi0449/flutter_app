import 'package:flutter/material.dart';

PreferredSize appBarBottomLine() {
  var height = 0.5;

  return PreferredSize(
    preferredSize: Size.fromHeight(0.5),
    child: Divider(
      thickness: 0.5,
      height: 0.5,
      color: Color(0xFFF4F5F7),
    ),
  );
}
