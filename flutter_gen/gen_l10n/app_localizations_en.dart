import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get appTitle => 'Multilingual App';

  @override
  String get homeTitle => 'Hello, Draft World!';

  @override
  String get homePage => 'Home';

  @override
  String get exoticOrdinaryPage => 'Exotic Ordinary';

  @override
  String get exoticBoutiquePage => 'The Exotic Boutique';

  @override
  String get dustyDraftPage => 'Dusty Draft';

  @override
  String get contactPage => 'Contact';
}
