import 'package:flutter/material.dart';
import 'package:flutter_login_app/pages/home_page.dart';
import 'package:flutter_login_app/pages/login_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(
            backgroundColor: Colors.black,
            foregroundColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30.0),
            ),
            minimumSize: Size(400, 60),
          ),
        ),
      ),
      // 첫 번째 보여줄 화면
      initialRoute: '/login',
      // App 에서 사용할 화면(경로)을 미리 설정할 수 있다.
      // 사용자가 어디로 가야하는지 안내하는 Map
      // map 리터럴은 중괄호로 표현, 배열은 []
      routes: {
        // 키 : 값 으로 들어 오기 때문에 콜론으로 들어오는 것
        '/login': (context) => LoginPage(), // 내가 어떤 화면의 메타 정보를 지
        '/home': (context) => HomePage(),
      },
    );
  }
}

// // 로그인 페이지
// class LoginPage extends StatelessWidget {
//   const LoginPage({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return ListView(
//       children: [
//         Logo('Login'),
//         SizedBox(height: largeGap),
//         CustomForm(),
//       ],
//     );
//   }
// }
