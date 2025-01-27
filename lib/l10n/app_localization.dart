import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppLocalization {
  final Locale locale;

  // supportedLocales를 추가하여 다국어 지원 목록을 반환합니다.
  static const List<Locale> supportedLocales = [
    Locale('en', 'US'), // 영어 (미국)
    Locale('ko', 'KR'), // 한국어 (한국)
    // 추가적인 언어를 여기에 정의할 수 있습니다.
  ];

  AppLocalization(this.locale);

  static late Map<String, String> _localizedStrings;

  // 로컬화된 텍스트를 로드하는 함수
  Future<bool> load() async {
    // JSON 파일 읽기
    String jsonString = await rootBundle
        .loadString('assets/l10n/app_${locale.languageCode}.arb');
    Map<String, dynamic> jsonMap = json.decode(jsonString);

    // 문자열만 필터링하여 저장
    _localizedStrings = jsonMap.map((key, value) {
      return MapEntry(key, value.toString());
    });

    return true;
  }

  // 특정 메시지 getter (예: homePageButton1)
  String _getLocalizedValue(String key) {
    return _localizedStrings[key] ?? '[$key]';
  }

  // 페이지별로 메시지를 가져오는 공통 메서드
  String get homePageButton1 => _getLocalizedValue('homePageButton1');
  String get homePageButton2 => _getLocalizedValue('homePageButton2');
  String get homePageButton3 => _getLocalizedValue('homePageButton3');
  String get homePageButton4 => _getLocalizedValue('homePageButton4');
  String get homePageButton5 => _getLocalizedValue('homePageButton5');

  String get draftPageMessage => _getLocalizedValue('draftPageMessage');
  String get draftSolutions => _getLocalizedValue('draftSolutions');
  String get webVersion => _getLocalizedValue('webVersion');
  String get touchPadVersion => _getLocalizedValue('touchPadVersion');

  String get dustyPageMessage1 => _getLocalizedValue('dustyPageMessage1');
  String get dustyPageMessage2 => _getLocalizedValue('dustyPageMessage2');
  String get dustyPageMessage3 => _getLocalizedValue('dustyPageMessage3');
  String get dustyPageMessage4 => _getLocalizedValue('dustyPageMessage4');
  String get dustyButtonMessage1 => _getLocalizedValue('dustyButtonMessage1');
  String get dustyButtonMessage2 => _getLocalizedValue('dustyButtonMessage2');
  String get dustyButtonMessage3 => _getLocalizedValue('dustyButtonMessage3');

  String get ordinaryPageMessage1 => _getLocalizedValue('ordinaryPageMessage1');
  String get ordinaryPageMessage2 => _getLocalizedValue('ordinaryPageMessage2');
  String get ordinaryPageMessage3 => _getLocalizedValue('ordinaryPageMessage3');
  String get ordinaryPageMessage4 => _getLocalizedValue('ordinaryPageMessage4');

  String get exoticPageMessage1 => _getLocalizedValue('exoticPageMessage1');
  String get exoticPageMessage2 => _getLocalizedValue('exoticPageMessage2');
  String get exoticPageMessage3 => _getLocalizedValue('exoticPageMessage3');
  String get exoticPageMessage4 => _getLocalizedValue('exoticPageMessage4');
  String get exoticPageMessage5 => _getLocalizedValue('exoticPageMessage5');
  String get exoticPageMessage6 => _getLocalizedValue('exoticPageMessage6');

  String get boutiquePageMessage1 => _getLocalizedValue('boutiquePageMessage1');
  String get boutiquePageMessage2 => _getLocalizedValue('boutiquePageMessage2');

  // 현재 Locale에 맞는 AppLocalization 가져오기
  static AppLocalization? of(BuildContext context) {
    return Localizations.of<AppLocalization>(context, AppLocalization);
  }

  static const LocalizationsDelegate<AppLocalization> delegate =
      _AppLocalizationDelegate();
}

// LocalizationsDelegate 구현
class _AppLocalizationDelegate extends LocalizationsDelegate<AppLocalization> {
  const _AppLocalizationDelegate();

  @override
  bool isSupported(Locale locale) {
    return AppLocalization.supportedLocales.contains(locale); // 지원 언어
  }

  @override
  Future<AppLocalization> load(Locale locale) async {
    AppLocalization localization = AppLocalization(locale);
    await localization.load();
    return localization;
  }

  @override
  bool shouldReload(covariant LocalizationsDelegate<AppLocalization> old) =>
      false;

  @override
  List<Locale> get supportedLocales => AppLocalization.supportedLocales;
}
