import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Localization {
  late final Locale _locale;

  Localization(this._locale);

  static Future<Localization> load(Locale locale) async {
    final localization = Localization(locale);
    await localization._initMessages();
    return localization;
  }

  Future<void> _initMessages() async {
    // 직접 메시지 파일에서 로케일에 맞는 메시지 로드
    // 예: assets 디렉토리에 lang 디렉토리가 있을 경우, 해당 파일에서 메시지 로드
    // 예: assets/lang/{locale.languageCode}_{locale.countryCode}.json
    // final jsonFileName = 'lib/l10n/${_locale.languageCode}.json';
    try {
      // final String jsonString = await rootBundle.loadString(jsonFileName);
      // final Map<String, dynamic> jsonMap = jsonDecode(jsonString);
      Intl.defaultLocale = _locale.toString();
    } catch (e) {
      // print('Error loading localization file: $e');
    }
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
