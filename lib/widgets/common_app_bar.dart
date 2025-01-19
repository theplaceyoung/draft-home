import 'package:draft_home/main.dart';
import 'package:flutter/material.dart';

class CommonAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CommonAppBar({super.key});

  @override
  Size get preferredSize => Size.fromHeight(60.0); // AppBar 높이

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 1,
      title: Center(
        // Center 위젯 추가하여 중앙에 배치
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center, // Row 내부 아이템을 중앙에 정렬
          children: [
            // 로고 이미지
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, '/'); // 로고 클릭 시 홈으로 이동
              },
              child: Image.asset(
                'assets/logo_symbol_draft.png',
                height: 35,
              ),
            ),
          ],
        ),
      ),
      actions: [
        IconButton(
          icon: Icon(Icons.language),
          onPressed: () {
            // 언어 전환
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: Text('Select Language'),
                  content: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      ListTile(
                        title: Text('English'),
                        onTap: () {
                          MyApp.setLocale(context, Locale('en'));
                          Navigator.pop(context);
                        },
                      ),
                      ListTile(
                        title: Text('한국어'),
                        onTap: () {
                          MyApp.setLocale(context, Locale('ko'));
                          Navigator.pop(context);
                        },
                      ),
                    ],
                  ),
                );
              },
            );
          },
        ),
      ],
    );
  }
}
