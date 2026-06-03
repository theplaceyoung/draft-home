import 'package:flutter/material.dart';

class LocalizationProvider extends ChangeNotifier {
  Locale _locale = const Locale('en'); // 기본 영어
  Locale get locale => _locale;

  void toggleLanguage() {
    _locale =
        _locale.languageCode == 'en' ? const Locale('ko') : const Locale('en');
    notifyListeners();
  }

  void changeLocale(Locale newLocale) {
    _locale = newLocale;
    notifyListeners();
  }
}
