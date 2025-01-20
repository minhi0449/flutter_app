import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

// 이벤트가 일어나면 다시 화면을 그려야 한다.
class MyApp extends StatefulWidget {
  // 추상화된 개념
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // 현재 시간 상태를 저장하는 변수
  String timeOfDay = '낮🌞';

  @override
  Widget build(BuildContext context) {
    print('전체 build() 메서드 호출');
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SafeArea(
        child: Scaffold(
          body: Container(
            color: Colors.blueAccent,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // 텍스트
                Expanded(
                  flex: 1,
                  child: InkWell(
                    onTap: () {
                      print('이벤트 리스너 등록');
                      timeOfDay = (timeOfDay == '낮👔' ? '밤🌙' : '낮🍀');
                      print('✅ 현재 상태 값  : ${timeOfDay}');
                      // 화면을 새롭게 갱신하라 명령해 주어야 한다.
                      setState(() {
                        print('화면 다시 그려줘 -> build() 재 호출한다.');
                      });
                    },
                    child: Container(
                      alignment: Alignment.center,
                      color: (timeOfDay == '낮') ? Colors.green : Colors.red,
                      child: Text(
                        timeOfDay,
                        style: TextStyle(fontSize: 25),
                      ),
                    ),
                  ),
                ),
                // 이미지
                Expanded(
                  flex: 1,
                  child: FlutterLogo(
                    size: 300,
                    style: FlutterLogoStyle.markOnly,
                    textColor: Colors.redAccent,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
