import 'package:draft_home/settings/settings_view.dart';
import 'package:flutter/material.dart';

class CommonAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Color backgroundColor; // AppBar 배경색
  final Color iconColor; // 아이콘 색상
  final List<Widget> actions; // 추가 아이콘 버튼 리스트
  final String pageKey; // 페이지 키

  const CommonAppBar({
    super.key,
    required this.pageKey,
    this.backgroundColor = Colors.transparent, // 기본값: 투명
    this.iconColor = Colors.black,
    this.actions = const [], // 기본값: 빈 리스트
  });

  // 페이지별 로고 매핑
  String get _logoPath {
    const Map<String, String> logoMap = {
      'home': 'assets/dusty/logo_symbol_draft_grey.png',
      'draft': 'assets/draft/logo_symbol_draft.png',
      'dusty': 'assets/dusty/logo_symbol_draft_grey.png',
      'ordinary': 'assets/dusty/logo_symbol_draft_grey.png',
      'exotic': 'assets/exotic/evotic.png',
      'boutique': 'assets/boutique/exotic-yellow.png',
    };
    return logoMap[pageKey] ?? 'assets/dusty/logo_symbol_draft_grey.png';
  }

  @override
  Size get preferredSize => const Size.fromHeight(60.0); // AppBar 높이

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: backgroundColor,
      elevation: 1,
      leading: IconButton(
        icon: Icon(Icons.menu, color: iconColor),
        onPressed: () {
          Scaffold.of(context).openDrawer(); // 기존 showDialog 대신 사용
        },
      ),
      title: Center(
        child: GestureDetector(
          onTap: () => Navigator.pushNamed(context, '/'),
          child: Tooltip(
            message: 'Go to Home',
            child: Image.asset(
              _logoPath, // 자동 매핑된 로고 사용
              height: 32,
            ),
          ),
        ),
      ),
      actions: [
        IconButton(
          icon: Icon(Icons.language, color: iconColor),
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
        IconButton(
          icon: const Icon(Icons.settings),
          tooltip: 'Settings',
          onPressed: () {
            Navigator.restorablePushNamed(context, SettingsView.routeName);
          },
        ),
      ],
    );
  }
}
