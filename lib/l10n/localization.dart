import 'dart:convert';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

class Localization {
  late final Locale _locale;

  Localization(this._locale);

  static Future<Localization> load(Locale locale) async {
    final localization = Localization(locale);
    try {
      await localization._initMessages();
    } catch (e) {
      // 로딩 실패 시 기본값 설정
      await localization._setDefaultMessages();
    }
    return localization;
  }

  Future<void> _initMessages() async {
    final jsonFileName = 'lib/l10n/${_locale.languageCode}.json';
    try {
      final String jsonString = await rootBundle.loadString(jsonFileName);
      final Map<String, dynamic> jsonMap = jsonDecode(jsonString);
      Intl.defaultLocale = _locale.toString();
    } catch (e) {
      throw Exception('Failed to load localization messages');
    }
  }

  Future<void> _setDefaultMessages() async {
    // 기본 메시지 설정
    Intl.defaultLocale = 'en_US'; // 예시로 영어 기본 설정
  }

  static Localization of(BuildContext context) {
    return Localizations.of<Localization>(context, Localization)!;
  }

  String get appTitle => Intl.message(
        'Draft',
        name: 'appTitle',
        desc: 'The title of the app',
        locale: _locale.toString(),
      );

  String get homePage => Intl.message(
        '홈',
        name: 'homePage',
        desc: 'Home page title',
        locale: _locale.toString(),
      );
}
