import 'package:flutter/material.dart';

class LanguageSwitcher extends StatelessWidget {
  const LanguageSwitcher({super.key});
  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.language), // 다국어 버튼 아이콘
      tooltip: 'change language',
      onPressed: () {
        Locale currentLocale = Localizations.localeOf(context);
        Locale newLocale = currentLocale.languageCode == 'en'
            ? const Locale('ko')
            : const Locale('en');

        if (newLocale != currentLocale) {
          // 바로 언어 변경
          Localizations.override(context: context, locale: newLocale);
        }
      },
    );
  }
  // @override
  // Widget build(BuildContext context) {
  //   return PopupMenuButton<Locale>(
  //     onSelected: (Locale locale) {
  //       // 다국어 변경 로직
  //       Locale currentLocale = Localizations.localeOf(context);
  //       if (locale != currentLocale) {
  //         // 언어 전환 로직
  //         Localizations.override(context: context, locale: locale);
  //       }
  //     },
  //     itemBuilder: (BuildContext context) => <PopupMenuEntry<Locale>>[
  //       const PopupMenuItem<Locale>(
  //         value: Locale('en'),
  //         child: Text('English'),
  //       ),
  //       const PopupMenuItem<Locale>(
  //         value: Locale('ko'),
  //         child: Text('Korean'),
  //       ),
  //     ],
  //   );
  // }
}
