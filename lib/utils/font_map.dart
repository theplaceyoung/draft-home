import 'package:flutter/material.dart';

class FontSizeOptions {
  static const double small = 14;
  static const double medium = 18;
  static const double large = 24;
}

class FontStyles {
  final String fontFamilyEn; // 영문 폰트
  final String fontFamilyKo; // 한글 폰트

  FontStyles({required this.fontFamilyEn, required this.fontFamilyKo});

  Map<String, Map<String, TextStyle>> get styles => {
        'heading': {
          'en': TextStyle(
            fontSize: FontSizeOptions.large,
            fontWeight: FontWeight.bold,
            fontFamily: fontFamilyEn,
          ),
          'ko': TextStyle(
            fontSize: FontSizeOptions.large,
            fontWeight: FontWeight.bold,
            fontFamily: fontFamilyKo,
          ),
        },
        'body': {
          'en': TextStyle(
            fontSize: FontSizeOptions.medium,
            fontFamily: fontFamilyEn,
          ),
          'ko': TextStyle(
            fontSize: FontSizeOptions.medium,
            fontFamily: fontFamilyKo,
          ),
        },
      };
}

final Map<String, Map<String, Map<String, TextStyle>>> fontSets = {
  'DraftFont': FontStyles(
    fontFamilyEn: 'DraftFont',
    fontFamilyKo: 'PretendardVariable',
  ).styles,
  'ExoticFont': FontStyles(
    fontFamilyEn: 'ExoticFont',
    fontFamilyKo: 'PretendardVariable',
  ).styles,
};

String getCurrentLanguage() {
  // 현재 앱의 언어를 반환합니다. 실제로는 Localization 설정을 기반으로 가져옵니다.
  // 예: Intl.getCurrentLocale(), context.locale, etc.
  return 'ko'; // 예시로 'ko'를 반환합니다.
}

TextStyle getFontStyle({
  required String fontSet,
  required String styleType, // 'heading' or 'body'
}) {
  final currentLanguage = getCurrentLanguage(); // 현재 언어 가져오기
  return fontSets[fontSet]?[styleType]?[currentLanguage] ??
      const TextStyle(); // 기본값 반환
}
