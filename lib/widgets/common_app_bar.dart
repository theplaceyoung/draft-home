import 'package:flutter/material.dart';

class CommonAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Size get preferredSize => Size.fromHeight(60.0); // AppBar 높이

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false, // Scaffold의 기본 햄버거 버튼 비활성화
      backgroundColor: Colors.blueAccent,
      elevation: 0,
      title: Row(
        children: [
          // 햄버거 버튼 (로고 왼쪽)
          IconButton(
            icon: Icon(Icons.menu),
            onPressed: () {
              Scaffold.of(context).openDrawer(); // 왼쪽 드로어 열기
            },
          ),
          SizedBox(width: 10), // 햄버거 버튼과 로고 간격
          // 로고 이미지
          GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, '/'); // 로고 클릭 시 홈으로 이동
            },
            child: Image.asset(
              'assets/logo_draft_transparentBG.png', // 로고 이미지 경로
              height: 45, // 로고 크기 설정
            ),
          ),
        ],
      ),
    );
  }
}
