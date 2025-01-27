import 'package:flutter/material.dart';

class CommonAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String logoPath; // 특정 페이지에 따라 이미지 경로
  final Color backgroundColor; // AppBar 배경색
  final Color iconColor; // 아이콘 색
  final List<Widget> actions; // 추가 아이콘 버튼 리스트

  const CommonAppBar({
    super.key,
    required this.logoPath,
    this.backgroundColor = Colors.transparent, // 기본값은 투명
    this.iconColor = Colors.black,
    this.actions = const [], // 기본값: 빈 리스트, // 기본 아이콘 색은 검정색
  });

  @override
  Size get preferredSize => Size.fromHeight(60.0); // AppBar 높이

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: backgroundColor, // 전달받은 배경색
      elevation: 1,
      title: Center(
        child: GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, '/');
          },
          child: Tooltip(
            message: 'Go to Home', // 툴팁 추가
            child: Image.asset(
              logoPath, // 이미지 경로
              height: 32,
            ),
          ),
          // child: Image.asset(
          //   logoPath, // 이미지 경로
          //   height: 32,
          // ),
        ),
      ),
      actions: [
        IconButton(
          icon: Icon(Icons.language, color: iconColor), // 아이콘 색상 설정
          tooltip: 'Change Language',
          onPressed: () {
            Locale currentLocale = Localizations.localeOf(context);
            Locale newLocale = currentLocale.languageCode == 'en'
                ? const Locale('ko')
                : const Locale('en');
            if (newLocale != currentLocale) {
              // 언어 변경 로직
              Localizations.override(context: context, locale: newLocale);
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content:
                      Text('Language changed to ${newLocale.languageCode}'),
                ),
              );
            }
          },
        ),
      ],
    );
  }
}
