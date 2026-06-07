import 'package:draft_home/settings/settings_view.dart';
import 'package:flutter/material.dart';

class CommonAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Color backgroundColor; // AppBar 배경색
  final List<Widget> actions; // 추가 아이콘 버튼 리스트
  final String pageKey; // 페이지 키

  const CommonAppBar({
    super.key,
    required this.pageKey,
    this.backgroundColor = Colors.transparent, // 기본값: 투명
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
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final iconColor = isDark ? Colors.white : Colors.black;
    final isMobile = MediaQuery.of(context).size.width < 700;
    return AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: isDark ? Colors.black : Colors.white,
      foregroundColor: isDark ? Colors.white : Colors.black,
      elevation: 0,
      title: Row(
        children: [
          GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, '/about');
            },
            child: Image.asset(
              _logoPath,
              height: 32,
            ),
          ),
          const SizedBox(width: 8),
          if (!isMobile) ...[
            TextButton(
              onPressed: () {
                Navigator.pushNamed(context, '/');
              },
              child: Text(
                'Home',
                style: TextStyle(
                  color: isDark ? Colors.white : Colors.black,
                ),
              ),
            ),
            const Text('|'),
            TextButton(
              onPressed: () {
                Navigator.pushNamed(context, '/company');
              },
              child: Text(
                'Company',
                style: TextStyle(
                  color: isDark ? Colors.white : Colors.black,
                ),
              ),
            ),
            const Text('|'),
            TextButton(
              onPressed: () {
                Navigator.pushNamed(context, '/ordinary');
              },
              child: Text(
                'Ordinary Life',
                style: TextStyle(
                  color: isDark ? Colors.white : Colors.black,
                ),
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: _buildSearchBar(),
            ),
          ],
        ],
      ),
      actions: [
        if (isMobile)
          IconButton(
            icon: Icon(
              Icons.search,
              color: iconColor,
            ),
            onPressed: () {
              // 추후 검색 다이얼로그
            },
          ),
        Builder(
          builder: (context) => IconButton(
            icon: Icon(Icons.menu, color: iconColor),
            onPressed: () {
              Scaffold.of(context).openEndDrawer();
            },
          ),
        ),
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

  Widget _buildSearchBar() {
    return SizedBox(
      height: 38,
      child: TextField(
        decoration: InputDecoration(
          hintText: ' Search Draft...',
          prefixIcon: Icon(
            Icons.search,
            color: Colors.grey.shade600,
          ),
          contentPadding: EdgeInsets.zero,
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.grey.shade400,
              width: 1,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.grey.shade600,
              width: 1,
            ),
          ),
          border: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.grey.shade400,
              width: 1,
            ),
          ),
        ),
      ),
    );
  }
}
