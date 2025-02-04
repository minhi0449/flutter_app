import 'package:class_f_story/_core/utils/exception_handler.dart';
import 'package:class_f_story/_core/utils/my_http.dart';
import 'package:class_f_story/data/model/session_user.dart';
import 'package:class_f_story/data/repositoy/user_repository.dart';
import 'package:class_f_story/main.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// 뷰 모델에 날걔를 달아주기로 한 것 -> 어떤 상태를 관리로 했는지
// object 통으로 세션 유저라고 적기

// 뷰 모델 --> 화면에 있는 데이터를 가지고 와서 사용한다.
// 로그인 요청을 할 때, 어떤 변수를 필요할까?
// userRepository.find 를 여기로 들고 온다고

// 뷰 모델에 속성 --> 세션 유저가 된다.
// 뷰 모델의 해위 --> 로그인 행위, 로그아웃 행위, 자동 로그인 행위

class SessionGVM extends Notifier<SessionUser> {
  // 뷰 모델에서 컨텍스트를 사용하는 방안
  final mContext = navigatorkey.currentContext!;
  // 여기서 객체 생성
  UserRepository userRepository = UserRepository();

  // 상태를 초기화 해주어야 한다. (선언형 UI 이기 때문에)
  @override
  SessionUser build() {
    // 추상화 변수 state (외부에서 접근하는 변수명)
    // state ==> SessionUser() 객체가 된다.
    return SessionUser(
      id: null,
      username: null,
      accessToken: null,
      isLogin: false,
    );
  }

  // 로그인 행위
  // 화면에서 뷰 모델에게 로그인 요청 위임
  Future<void> login(String username, String password) async {
    // 로그인 기능을 만들기 위해서는 서버 측으로 던질 데이터를 구축해야 한다.
    try {
      // 요청 HTTP 메세지 body -> 라는 의미로
      final body = {
        'username': username,
        'password': password,
      };
      // api 요청 해야 함 -> userRepository 호출
      final (responseBody, accessToken) =
          await userRepository.findByUsernameAndPassword(body);
      // 서버 측에서 약속 -> 어떻게 던져 주는 지 잘 분석해야 함.
      // 성공 시 true , 실패 시 false
      // 서버 측에서 통신은 성공했으나 , 내부 오류 판단
      if (responseBody['success'] == false) {
        // => if(!responseBody['success']){ 같은 말
        // 사용자에게 로그인 실패 (비번x, 사용명x)
        ExceptionHander.handerException(
          responseBody['errorMessage'],
          StackTrace.current,
        );
        return; // 실행의 제어건 반납
        // 리턴을 적지 않으면 코드가 계속 실행됨
      }
      // 1. JWT 토큰을 안전한 금고에 보관 처리 ->  I/O : 입출력(Input/Output)
      // I/O 는 시간이 많이 걸리기 떄문에 비동기 처리
      await secureStorge.write(key: 'accessToken', value: accessToken);

      // 2. 뷰 모델 상태 갱신
      // 깊은 복사 처리
      // 로그인 성공하면 값을 다시 넣는다고
      Map<String, dynamic> resData = responseBody['response'];
      state = SessionUser(
        id: resData['id'], // key 값으로 접근
        username: resData['username'],
        accessToken: accessToken,
        isLogin: true,
      );

      // 3. 로그인 이후 인증권한 필요한 API 접근 시에
      // 매번 금고에 접근해서 dio 속성 값 변경해서 호출 하는 것은 불편하다.
      // dio 객체를 전역 변수로 설계를 했음

      // 3. Dio 헤더에 JWT 토큰 설정 (객체 상태 값 추가)
      dio.options.headers['Authorization'] = accessToken;

      // 비즈니스 로직마다 다르긴한데
      // 화면 이동 처리 pushNamed -> pushNamed -> pushNamed
      // Navigator stack 메모리에 계속 쌓인다.
      // Navigator.pushNamed(mContext, '/post/list');
      // 이전에 쌓여있던 stack(화면) 다 파괴하면서 이동 처리
      Navigator.popAndPushNamed(mContext, '/post/list');
      // 모든 예외처리를 잡는 곳 -> catch (e)
      // 모든 예외처리가 설정된다.
      // } on DioException catch (e) {}
    } catch (e, stackTrace) {
      // IP 주소가 잘못, 서버가 종료 되어 있을 때, 서버 연결 시간 초과
      ExceptionHander.handerException('서버 연결 실패', stackTrace);
      // 우리가 파악해야 하는 거 -> DTO 도 만들지 않고, 예외처리는
    }
  }

  // 회원 등록 행위
  // 1 단계 - UserRepository 에 회원등록 API 요청 확인
  // 판별의 기준 -> REST api 확인해보렴 미니
  // 위치 기반으로 (String username, String email, String password)
  Future<void> join(String username, String email, String password) async {
    try {
      // MAP 구조로 만들어서 던져 주자
      final body = {
        'username': username,
        'email': email,
        'password': password,
      };
      Map<String, dynamic> resBody = await userRepository.save(body);
      // 통신은 성공이지만 내부 판별 오류 시 방어적 코드 작성
      if (!resBody['success']) {
        ExceptionHander.handerException(
          resBody['errorMessage'],
          StackTrace.current,
        );
        return; // 회원가입 실패 했는데 -> 계속 코드 실행하면 안 되니까
        // 실행의 제어권 반납
      }
      // 성공하면 회원가입 완료 -> 화면 이동 코드
      //ExceptionHander.handerException(resBody['회원가입 성공'], StackTrace.current);

      // 바로 화면 이동 처리
      Navigator.pushNamed(mContext, '/login');
    } catch (e, stackTrace) {
      ExceptionHander.handerException('서버 연결 실패', stackTrace);
    }
  }

  // 로그아웃 행위
}

// 창고 관리자 선언 (창고 - 뷰모델), 창고 어떤 관리해라 지정!!
final sessionProvider = NotifierProvider<SessionGVM, SessionUser>(
  () => SessionGVM(),
);
