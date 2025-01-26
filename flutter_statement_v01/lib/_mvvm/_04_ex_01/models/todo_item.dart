// Model
// Model (책) : 실제 정보를 담고 있는 책

// 1. 우리가 관리하고 싶은 데이터
class TodoItem {
  String title; // 할 일의 제목 (필수 값)
  bool isDone; // 완료 여부 (true/false)만 가능한 완료 상태

  TodoItem({
    // required 는 null 값을 허용하지 않음
    // 컴파일 시점에서 오류 체크
    // 매개변수가 반드시 제공되어야 함을 강제

    required this.title, // 제목은 반드시 입력해야 함
    this.isDone = false, // 완료 상태는 기본값 false (ㅁ 체크박스 비어있도록 함)
  });
}
