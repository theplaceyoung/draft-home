import 'package:flutter/material.dart';

class CommonAppBar extends StatelessWidget implements PreferredSizeWidget {
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
            'assets/logo_symbol_draft.png',
            height: 35,
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
        IconButton(
          icon: Icon(Icons.menu), // 햄버거 버튼
          onPressed: () {
            Scaffold.of(context).openDrawer(); // CommonDrawer 열기
          },
        ),
      ],
    );
  }
}
