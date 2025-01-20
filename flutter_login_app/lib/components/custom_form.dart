import 'package:flutter/material.dart';
import 'package:flutter_login_app/components/custom_text_form_field.dart';
import 'package:flutter_login_app/size.dart';

class CustomForm extends StatelessWidget {
  // 내부에서만 사용
  // 1. 글로벌 키 선언 - 폼 상태 관리하기 위한 Key 이다.
  final _formKey = GlobalKey<FormState>();
  // 2. 사용자가 입력을 한 데이터를 저장하는 멤버 변수 선언
  String _email = '';
  String _password = '';

  CustomForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          CustomTextFormField(
            'Email',
            (value) {
              _email = value ?? ''; // null 병합 연산자 사용
            },
          ),
          SizedBox(height: mediumGap),
          CustomTextFormField(
            'Password',
            (value) {
              _password = value ?? ''; // null 값을 넣을 건데 일단 공백''으로
            },
          ),
          SizedBox(height: largeGap),
          TextButton(
            onPressed: () {
              // 유효성 검사
              // currentState : 현재 상태
              if (_formKey.currentState!.validate()) {
                // 유효성 검사가 다 통과 한다면 아래 로직 호출
                // save() 메서드 호출 해야 되고,
                // 통신 요청
                // 로깅 확인
                print('Email : ${_email}');
                print('Password : ${_password}');

                // 여기서 화면이동을 하는 객체로 뭐를 하냐면?
                // 미리 정해진 라우터 이름을 호출할 수 있다.
                Navigator.pushNamed(context, '/home');
                // 화면 엑티비티
                // Stack 으로 밑에 깔린다. 스택깔린다.
                // 스택에서 깔릴 때, -> push
              }
            },
            child: Text('Login'),
          ),
        ],
      ),
    );
  }
}
