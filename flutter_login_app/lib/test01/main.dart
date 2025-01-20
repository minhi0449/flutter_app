import 'package:flutter/material.dart';

// 텍스트 필드와 form 위젯 만들어 보기
//  테스트 코드 작업
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SafeArea(
        child: Scaffold(
          body: FormPage(),
        ),
      ),
    );
  }
}

///////////////////////////////////////////////////////////
// 변경 가능한 변수를 --> 상태가 있는 위젯이다.
class FormPage extends StatefulWidget {
  const FormPage({super.key});

  // 강한 소유의 관계
  @override
  State<FormPage> createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {
  String _username = '';
  String _password = '';

  // 타입추론
  // 폼 상태를 추적하기 위해 관리하는 고유 키를 하나 선언한다.
  // 즉, 폼의 상태에 접근 할 수 있다. (이 키를 가지고)
  final _formKey1 = GlobalKey<FormState>();

  // 화면을 그리는 메서드
  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formKey1,
        child: Column(
          children: [
            TextFormField(
              keyboardType: TextInputType.text,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'username 을 입력하시오.';
                }
                print('텍스트 필드 사용자 이름');
                return null;
              },
              onSaved: (value) {
                print('사용자 이름 필드 onSaved 호출됨');
                _username = value!;
              },
            ),
            SizedBox(height: 24.0),
            TextFormField(
                // password 받을 때, 사용하는 속성
                // 패스워드 받을 때, 사용하는 속성
                obscureText: true,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    // 유효성을 통과 못 했으면 텍스트 필드 아래에 친절하게 알려줘
                    return '패스워드를 입력하시오.';
                  }
                  return null;
                  // print('텍스트 필드 사용자 비밀번호');
                },
                onSaved: (value) {
                  print('사용자 비밀번호 필드 onSaved 호출됨');
                  _password = value!; // 절대 null 이 될 수 없음
                }),
            SizedBox(height: 24.0),
            ElevatedButton(
              // 키를 눌렀을 때,
              onPressed: () {
                // 유효성 검사 호출
                if (_formKey1.currentState!.validate()) {
                  // true 일 경우 들어 옴
                  print('true을 반환');
                  // 저장 메서드 호출
                  _formKey1.currentState!.save();
                  // 통신 하는 코드를 --> 서버 측으로 데이터를 보냄
                  // 멤버 변수를 활용해서
                } else {
                  // false 일 경우 들어 옴
                  print('false을 반환');
                }
              },
              child: Text('Login'),
            ),
          ],
        ));
  }
}
///////////////////////////////////////////////////////////
