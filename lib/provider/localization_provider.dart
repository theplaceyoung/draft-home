import 'package:flutter/material.dart';

class LocalizationProvider with ChangeNotifier {
  Locale _locale = Locale('en'); // 기본 언어를 영어로 설정

  Locale get locale => _locale;

  // 언어를 변경하는 메서드
  void changeLocale(Locale newLocale) {
    if (_locale != newLocale) {
      _locale = newLocale;
      notifyListeners(); // 언어 변경 후 리스너 알림
    }
  }

  // 언어를 토글하는 메서드
  void toggleLanguage() {
    if (_locale.languageCode == 'en') {
      changeLocale(Locale('ko')); // 영어에서 한국어로 변경
    } else {
      changeLocale(Locale('en')); // 한국어에서 영어로 변경
    }
  }
}
