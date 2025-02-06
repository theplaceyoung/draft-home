import 'package:draft_home/settings/settings_view.dart';
import 'package:draft_home/themes/light_theme.dart';
import 'package:draft_home/themes/color_set.dart';
import 'package:draft_home/utils/card_button_with_text_over_image.dart';
import 'package:draft_home/utils/floating_action.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'package:draft_home/l10n/app_localization.dart';
import 'package:draft_home/provider/localization_provider.dart';
import 'package:draft_home/settings/settings_controller.dart';
import 'package:draft_home/settings/settings_service.dart';
import 'package:draft_home/utils/font_map.dart';
import 'package:draft_home/utils/url_utils.dart';
import 'package:draft_home/widgets/common_drawer.dart';
import 'package:draft_home/widgets/app_bar.dart';
import 'package:draft_home/widgets/footer.dart';
import 'package:draft_home/pages/draft_page.dart';
import 'package:draft_home/pages/dusty_draft.dart';
import 'package:draft_home/pages/ordinary_page.dart';
import 'package:draft_home/pages/exotic_ordinary.dart';
import 'package:draft_home/pages/the_exotic_boutique.dart';

const String homePageKey = 'home';
const String draftPageKey = 'draft';
const String dustyPageKey = 'dusty';
const String ordinaryPageKey = 'ordinary';
const String exoticPageKey = 'exotic';
const String boutiquePageKey = 'boutique';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => _initSettingsController()),
        ChangeNotifierProvider(create: (_) => LocalizationProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

SettingsController _initSettingsController() {
  final settingsController = SettingsController(SettingsService());
  settingsController.loadSettings();
  return settingsController;
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final settingsController = Provider.of<SettingsController>(context);
    final localizationProvider = Provider.of<LocalizationProvider>(context);
    final pageKey = ModalRoute.of(context)?.settings.name ?? homePageKey;

    return MaterialApp(
      themeMode: settingsController.themeMode,
      theme: getLightModeThemeWithColors(pageKey),
      locale: localizationProvider.locale,
      localizationsDelegates: const [
        AppLocalization.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: AppLocalization.supportedLocales,
      home: const MyHomePage(),
      initialRoute: '/',
      routes: _getRoutes(),
    );
  }

  Map<String, WidgetBuilder> _getRoutes() {
    return {
      // '/': (context) => const MyHomePage(),
      '/draft': (context) => DraftPage(),
      '/dusty': (context) => DustyDraftPage(),
      '/ordinary': (context) => const OrdinaryPage(),
      '/exotic': (context) => ExoticOrdinaryPage(),
      '/boutique': (context) => TheExoticBoutiquePage(),
      '/settings': (context) {
        final settingsController = Provider.of<SettingsController>(context);
        return SettingsView(controller: settingsController);
      },
    };
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final pageKey = _getPageKey(context);
    final localizationProvider = Provider.of<LocalizationProvider>(context);

    return Scaffold(
      drawer: CommonDrawer(pageKey: pageKey),
      appBar: CommonAppBar(
        backgroundColor: Colors.white,
        iconColor: Colors.black,
        actions: [
          _buildLanguageSwitchButton(localizationProvider, context),
        ],
        pageKey: pageKey,
      ),
      body: _buildBody(context),
      bottomNavigationBar: buildFooter(context),
      floatingActionButton: _buildFloatingActionButton(pageKey, context),
    );
  }

  String _getPageKey(BuildContext context) {
    final currentRoute = ModalRoute.of(context)?.settings.name ?? '/';
    return currentRoute.substring(1); // '/draft' -> 'draft'
  }

  IconButton _buildLanguageSwitchButton(
    LocalizationProvider provider,
    BuildContext context,
  ) {
    return IconButton(
      icon: const Icon(Icons.language),
      onPressed: () {
        provider.toggleLanguage();
        debugPrint("현재 언어: ${provider.locale.languageCode}");
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
              content: Text(provider.locale.languageCode == 'en'
                  ? 'Language changed to English!'
                  : '언어가 변경되었습니다!')),
        );
      },
    );
  }

  Widget _buildBody(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          CardButtonWithTextOverImage(
            title: AppLocalization.of(context)?.homePageButton1 ??
                'Fallback message',
            tacticPath: 'assets/draft/crumpled_paper_1405.jpg',
            onPressed: () => Navigator.pushNamed(context, '/draft'),
            textStyle: getFontStyle(fontSet: 'DraftFont', styleType: 'heading')
                .copyWith(
              color: lightModeDraftColorSet['textPrimaryColor'],
              shadows: [
                Shadow(
                  blurRadius: 5.0,
                  color: Colors.black
                      .withOpacity(0.3), // Black shadow with opacity
                  offset: Offset(3.0, 3.0), // Shadow offset
                ),
              ],
            ),
            pageKey: 'draft',
          ),
          CardButtonWithTextOverImage(
            title: AppLocalization.of(context)?.homePageButton2 ??
                'Fallback message',
            tacticPath:
                'assets/dusty/brown-background-water-reflection-texture.jpg',
            onPressed: () => Navigator.pushNamed(context, '/dusty'),
            textStyle: getFontStyle(fontSet: 'DustyFont', styleType: 'heading')
                .copyWith(
              color: lightModeDustyColorSet['textPrimaryColor'],
              shadows: [
                Shadow(
                  blurRadius: 5.0,
                  color: Colors.black
                      .withOpacity(0.3), // Black shadow with opacity
                  offset: Offset(3.0, 3.0), // Shadow offset
                ),
              ],
            ),
            pageKey: 'dusty',
          ),
          CardButtonWithTextOverImage(
            title: AppLocalization.of(context)?.homePageButton3 ??
                'Fallback message',
            tacticPath: 'assets/ordinary/background_1.png',
            onPressed: () => Navigator.pushNamed(context, '/ordinary'),
            textStyle:
                getFontStyle(fontSet: 'OrdinaryFont', styleType: 'heading')
                    .copyWith(
              color: lightModeOrdinaryColorSet['textPrimaryColor'],
              shadows: [
                Shadow(
                  blurRadius: 5.0,
                  color: Colors.black
                      .withOpacity(0.3), // Black shadow with opacity
                  offset: Offset(3.0, 3.0), // Shadow offset
                ),
              ],
            ),
            pageKey: 'ordinary',
          ),
          CardButtonWithTextOverImage(
            title: AppLocalization.of(context)?.homePageButton4 ??
                'Fallback message',
            tacticPath: 'assets/AdobeStock_228406900.jpeg',
            onPressed: () => Navigator.pushNamed(context, '/exotic'),
            textStyle: getFontStyle(fontSet: 'ExoticFont', styleType: 'heading')
                .copyWith(
              color: lightModeExoticColorSet['textPrimaryColor'],
              shadows: [
                Shadow(
                  blurRadius: 5.0,
                  color: Colors.black
                      .withOpacity(0.3), // Black shadow with opacity
                  offset: Offset(3.0, 3.0), // Shadow offset
                ),
              ],
            ),
            pageKey: 'exotic',
          ),
          CardButtonWithTextOverImage(
            title: AppLocalization.of(context)?.homePageButton5 ??
                'Fallback message',
            tacticPath: 'assets/boutique/door_image.jpg',
            onPressed: () => Navigator.pushNamed(context, '/boutique'),
            textStyle:
                getFontStyle(fontSet: 'BoutiqueFont', styleType: 'heading')
                    .copyWith(
              color: lightModeBoutiqueColorSet['textPrimaryColor'],
              shadows: [
                Shadow(
                  blurRadius: 5.0,
                  color: Colors.black
                      .withOpacity(0.3), // Black shadow with opacity
                  offset: Offset(3.0, 3.0), // Shadow offset
                ),
              ],
            ),
            pageKey: 'boutique',
          ),
        ],
      ),
    );
  }

  FloatingAction _buildFloatingActionButton(
      String pageKey, BuildContext context) {
    return FloatingAction(
      imagePath: 'assets/dusty/dusty-agent-white.png',
      onPressed: () => launchURL('https://dustyagent.chat', context),
      pageKey: pageKey,
      themeMode: ThemeMode.light,
    );
  }
}
