import 'package:flutter/material.dart';

class CommonAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String logoPath; // 특정 페이지에 따라 이미지 경로

  const CommonAppBar({
    super.key,
    required this.logoPath,
  });

  @override
  Size get preferredSize => Size.fromHeight(60.0); // AppBar 높이

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent, //transparent,
      elevation: 1,
      title: Center(
        child: GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, '/');
          },
          child: Image.asset(
            logoPath, // 이미지 경로
            height: 32,
          ),
        ),
      ),
      actions: [
        IconButton(
          icon: Icon(Icons.language), // 다국어 버튼
          tooltip: 'Change Language',
          onPressed: () {
            Locale currentLocale = Localizations.localeOf(context);
            Locale newLocale = currentLocale.languageCode == 'en'
                ? const Locale('ko')
                : const Locale('en');

            if (newLocale != currentLocale) {
              // 언어 변경 로직
              Localizations.override(context: context, locale: newLocale);
            }
          },
        ),
      ],
    );
  }
}
