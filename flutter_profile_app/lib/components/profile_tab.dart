import 'package:flutter/material.dart';

//////////////////////////////////////////////////////////////
// 상태가 있는 위젯을 만들어 보자.
// 1. StatefulWidget 위젯을 상속 받았다.
// 두 개의 클래스가 한 묶음이다.

class ProfileTab extends StatefulWidget {
  const ProfileTab({super.key});

  @override
  State<ProfileTab> createState() => _ProfileTabState();
} // end of ProfileTab

class _ProfileTabState extends State<ProfileTab>
    with SingleTickerProviderStateMixin {
  // 멤버 변수
  // TabController는 TabBar 와 TabBarView 를 동기화하는 컨트롤러 이다
  TabController? _tabController;

  // 단! 한 번 호출이 되는 메서드이다.
  @override
  void initState() {
    // 내부에서 값을 초기화 해야 한다면?  initState에 오세여
    super.initState();
    print('프로필 탭 내부 클래스 init 호출 했슴미도 - ! ');
    // length 는 탭의 개수를 의미한다.
    // vsync 는 자연스러운 애니메이션 전환을 위해서 TickerProvider 를
    // 지원한다.
    _tabController = TabController(length: 2, vsync: this);
  }

  // build 메소드는 기본적으로 그림을 그릴 때, 호출이 된다.
  @override
  Widget build(BuildContext context) {
    // 지역 변수
    print('build method 1');

    return Column(
      children: [
        _buildTabBar(),
        Expanded(
          child: _buildTabBarView(),
        )
      ],
    );
  }

  TabBarView _buildTabBarView() {
    return TabBarView(
      controller: _tabController,
      children: [
        GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisSpacing: 10, // 열(컴럼) 사이의 간격을 10으로 설정
            mainAxisSpacing: 10, // 행(로우)  사이의 간격을 10으로 설정
            crossAxisCount: 3,
          ),
          itemBuilder: (context, index) {
            // 이미지를 불러와야 한다.
            return Image.network('https://picsum.photos/id/${index}/200/200');
          },
          itemCount: 40,
        ),
        // 꾸며주세요
        Container(),
      ],
    );
  }

  TabBar _buildTabBar() {
    return TabBar(
        // 중간 매개체로 연결
        controller: _tabController,
        tabs: [
          Tab(
            icon: Icon(Icons.dark_mode),
          ),
          Tab(
            icon: Icon(Icons.integration_instructions_rounded),
          ),
        ]);
  }
} // end _ProfileTabState
//////////////////////////////////////////////////////////////
