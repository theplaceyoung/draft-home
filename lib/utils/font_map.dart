import 'package:flutter/material.dart';

class FontSizeOptions {
  static const double small = 14;
  static const double medium = 18;
  static const double large = 24;
}

class FontStyles {
  final String fontFamilyEnMain; // 영문 메인 폰트 (heading)
  final String fontFamilyEnSub; // 영문 부폰트 (body 등)
  final String fontFamilyKo; // 한글 폰트

  FontStyles(
      {required this.fontFamilyEnMain,
      required this.fontFamilyEnSub,
      required this.fontFamilyKo});

  Map<String, Map<String, TextStyle>> get styles => {
        'heading': {
          'en': TextStyle(
            fontSize: FontSizeOptions.large,
            fontWeight: FontWeight.bold,
            fontFamily: fontFamilyEnMain,
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
            fontFamily: fontFamilyEnSub,
          ),
          'ko': TextStyle(
            fontSize: FontSizeOptions.medium,
            fontFamily: fontFamilyKo,
          ),
        },
        // bodyText1, bodyText2, headline6 스타일 추가
        'bodyLarge': {
          'en': TextStyle(
            fontSize: FontSizeOptions.large,
            fontFamily: fontFamilyEnSub,
            color: Colors.black, // 기본 텍스트 색상
          ),
          'ko': TextStyle(
            fontSize: FontSizeOptions.large,
            fontFamily: fontFamilyKo,
            color: Colors.black, // 기본 텍스트 색상
          ),
        },
        'bodyMedium': {
          'en': TextStyle(
            fontSize: FontSizeOptions.medium,
            fontFamily: fontFamilyEnSub,
            color: Colors.grey, // 보조 텍스트 색상
          ),
          'ko': TextStyle(
            fontSize: FontSizeOptions.medium,
            fontFamily: fontFamilyKo,
            color: Colors.grey, // 보조 텍스트 색상
          ),
        },
        'headlineSmall': {
          'en': TextStyle(
            fontSize: FontSizeOptions.small,
            fontWeight: FontWeight.bold,
            fontFamily: fontFamilyEnSub,
          ),
          'ko': TextStyle(
            fontSize: FontSizeOptions.small,
            fontWeight: FontWeight.bold,
            fontFamily: fontFamilyKo,
          ),
        },
      };
}

final Map<String, Map<String, Map<String, TextStyle>>> fontSets = {
  'DraftFont': FontStyles(
    fontFamilyEnMain: 'DraftFontMain',
    fontFamilyEnSub: 'DraftFontSub',
    fontFamilyKo: 'PretendardVariable',
  ).styles,
  'DustyFont': FontStyles(
    fontFamilyEnMain: 'DustyFontMain',
    fontFamilyEnSub: 'DustyFontSub',
    fontFamilyKo: 'PretendardVariable',
  ).styles,
  'OrdinaryFont': FontStyles(
    fontFamilyEnMain: 'OrdinaryFontMain',
    fontFamilyEnSub: 'OrdinaryFontSub',
    fontFamilyKo: 'PretendardVariable',
  ).styles,
  'ExoticFont': FontStyles(
    fontFamilyEnMain: 'ExoticFontMain',
    fontFamilyEnSub: 'ExoticFontSub',
    fontFamilyKo: 'PretendardVariable',
  ).styles,
  'BoutiqueFont': FontStyles(
    fontFamilyEnMain: 'BoutiqueFontMain',
    fontFamilyEnSub: 'BoutiqueFontSub',
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
  required String styleType,
}) {
  final currentLanguage = getCurrentLanguage();
  return fontSets[fontSet]?[styleType]?[currentLanguage] ??
      const TextStyle(fontSize: 16, fontFamily: 'Arial');
}
