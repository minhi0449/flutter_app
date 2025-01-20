import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'pay/pay_page.dart';
import 'send/send_page.dart';
import 'direct/direct_page.dart';
import 'my/my_page.dart';
import 'travel/travel_page.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;

  void changeStackPages(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: IndexedStack(
          index: _selectedIndex,
          children: [
            PayPage(),
            SendPage(),
            DirectPage(),
            TravelPage(),
            MyPage(),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.white,
          type: BottomNavigationBarType.fixed,
          currentIndex: _selectedIndex,
          onTap: (index) {
            changeStackPages(index);
          },
          items: [
            BottomNavigationBarItem(
              label: '페이',
              icon: Icon(Icons.payment_rounded),
            ),
            BottomNavigationBarItem(
              label: '송금',
              icon: Icon(Icons.monetization_on),
            ),
            BottomNavigationBarItem(
              label: '직구',
              icon: Icon(CupertinoIcons.heart_circle_fill),
            ),
            BottomNavigationBarItem(
              label: '여행',
              icon: Icon(CupertinoIcons.placemark),
            ),
            BottomNavigationBarItem(
              label: '마이',
              icon: Icon(Icons.person),
            ),
          ],
        ),
      ),
    );
  } // end of Widget build
} // end of MainScreen
