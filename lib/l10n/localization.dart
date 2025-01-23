import 'package:flutter/material.dart';

class Localization {
  late final Locale locale;

  Localization(this.locale);

  static Localization of(BuildContext context) =>
      Localizations.of<Localization>(context, Localization)!;

  static final Map<String, Map<String, String>> _localizedValues = {
    // 'en': {
    //   'draft': 'DRAFT Company',
    //   'exoticOrdinary': 'Exotic Ordinary',
    //   'theExoticBoutique': 'The Exotic Boutique',
    //   'dustyDraft': 'Dusty Draft',
    //   'about': 'Ordinary Life',
    // },
    'en': {
      'DRAFT Company': 'draft',
      'Exotic Ordinary': 'exoticOrdinary',
      'The Exotic Boutique': 'theExoticBoutique',
      'Dusty Draft': 'dustyDraft',
      'Ordinary Life': 'about us',
    },
    'ko': {
      'DRAFT Company': '드래프트 컴퍼니',
      'Exotic Ordinary': '이그조틱 오디너리',
      'The Exotic Boutique': '디 이그조틱 부띠끄',
      'Dusty Draft': '더스티 드래프트',
      'Ordinary Life': '오디너리 라이프'
    },
    // 'ko': {
    //   'draft': '드래프트 컴퍼니',
    //   'exoticOrdinary': '이그조틱 오디너리',
    //   'theExoticBoutique': '디 이그조틱 부띠끄',
    //   'dustyDraft': '더스티 드래프트',
    //   'about us': '오디너리 라이프'
    // },
  };

  String get draft => _localizedValues[locale.languageCode]!['draft']!;
  String get exoticOrdinary =>
      _localizedValues[locale.languageCode]!['exoticOrdinary']!;
  String get theExoticBoutique =>
      _localizedValues[locale.languageCode]!['theExoticBoutique']!;
  String get dustyDraft =>
      _localizedValues[locale.languageCode]!['dustyDraft']!;
  String get contact => _localizedValues[locale.languageCode]!['contact']!;

  static const LocalizationsDelegate<Localization> delegate =
      _LocalizationDelegate();
}

class _LocalizationDelegate extends LocalizationsDelegate<Localization> {
  const _LocalizationDelegate();

  @override
  bool isSupported(Locale locale) {
    return ['en', 'ko'].contains(locale.languageCode);
  }

  @override
  Future<Localization> load(Locale locale) async {
    return Localization(locale);
  }

  @override
  bool shouldReload(_LocalizationDelegate old) => false;
}
