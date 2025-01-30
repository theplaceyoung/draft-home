import 'package:draft_home/l10n/app_localization.dart';
import 'package:draft_home/provider/localization_provider.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:draft_home/pages/ordinary_page.dart';
import 'package:draft_home/pages/draft_page.dart';
import 'package:draft_home/pages/dusty_draft.dart';
import 'package:draft_home/pages/exotic_ordinary.dart';
import 'package:draft_home/pages/the_exotic_boutique.dart';
import 'package:draft_home/utils/color_map.dart';
import 'package:draft_home/utils/floating_action.dart';
import 'package:draft_home/utils/font_map.dart';
import 'package:draft_home/utils/url_utils.dart';
import 'package:draft_home/widgets/app_bar.dart';
import 'package:draft_home/widgets/common_drawer.dart';
import 'package:draft_home/widgets/footer.dart';
import 'package:draft_home/utils/card_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => LocalizationProvider(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<LocalizationProvider>(context);

    return MaterialApp(
      locale: provider.locale, // 여기서 locale을 설정
      localizationsDelegates: const [
        AppLocalization.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: AppLocalization.supportedLocales,
      localeResolutionCallback: (locale, supportedLocales) {
        for (var supportedLocale in supportedLocales) {
          if (supportedLocale.languageCode == locale?.languageCode) {
            return supportedLocale;
          }
        }
        return supportedLocales.first;
      },
      home: MyHomePage(),
      initialRoute: '/',
      routes: {
        '/draft': (context) => const DraftPage(),
        '/dusty': (context) => const DustyDraftPage(),
        '/ordinary': (context) => const OrdinaryPage(),
        '/exotic': (context) => const ExoticOrdinaryPage(),
        '/boutique': (context) => const TheExoticBoutiquePage(),
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Color get appBarBackgroundColor => Colors.black;
  Color get appBarIconColor => Colors.white;

  double getResponsiveFontSize(double screenWidth) {
    return screenWidth > 600 ? 24.0 : 18.0;
  }

  @override
  Widget build(BuildContext context) {
    final String currentRoute = ModalRoute.of(context)?.settings.name ?? '/';
    final provider = Provider.of<LocalizationProvider>(context);

    String logoPath = 'assets/dusty/logo_symbol_draft_grey.png';
    switch (currentRoute) {
      case '/draft':
        logoPath = 'assets/draft/logo_draft.png';
        break;
      case '/dusty':
        logoPath = 'assets/dusty/logo_dusty_draft.png';
        break;
      case '/ordinary':
        logoPath = 'assets/ordinary/logo_contact.png';
        break;
      case '/exotic':
        logoPath = 'assets/exotic/logo_exotic_ordinary.png';
        break;
      case '/boutique':
        logoPath = 'assets/boutique/logo_boutique.png';
        break;
      default:
        logoPath = 'assets/draft/logo_symbol_draft.png';
    }

    return Scaffold(
      drawer: CommonDrawer(pageKey: 'exotic'),
      appBar: CommonAppBar(
        logoPath: logoPath,
        backgroundColor: appBarBackgroundColor,
        iconColor: appBarIconColor,
        actions: [
          IconButton(
            icon: Icon(Icons.language),
            onPressed: () {
              provider.toggleLanguage();
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('언어가 변경되었습니다!')),
              );
            },
          ),
        ],
      ), // AppBar 아이콘 색),
      body: SingleChildScrollView(
        child: Column(
          children: [
            CardButton(
              title: AppLocalization.of(context)?.homePageButton1 ??
                  'Fallback message',
              tacticPath: 'assets/draft/crumpled_paper_1405.jpg',
              onPressed: () => Navigator.pushNamed(context, '/draft'),
              textStyle:
                  getFontStyle(fontSet: 'DraftFont', styleType: 'heading')
                      .copyWith(color: draftColorSet['accent']),
              pageKey: 'draft',
            ),
            CardButton(
              title: AppLocalization.of(context)?.homePageButton2 ??
                  'Fallback message',
              tacticPath:
                  'assets/dusty/brown-background-water-reflection-texture.jpg',
              onPressed: () => Navigator.pushNamed(context, '/dusty'),
              textStyle:
                  getFontStyle(fontSet: 'DustyFont', styleType: 'heading')
                      .copyWith(color: dustyColorSet['accent']),
              pageKey: 'dusty',
            ),
            CardButton(
              title: AppLocalization.of(context)?.homePageButton3 ??
                  'Fallback message',
              tacticPath: 'assets/ordinary/background_1.png',
              onPressed: () => Navigator.pushNamed(context, '/ordinary'),
              textStyle:
                  getFontStyle(fontSet: 'OrdinaryFont', styleType: 'heading')
                      .copyWith(color: ordinaryColorSet['accent']),
              pageKey: 'ordinary',
            ),
            CardButton(
              title: AppLocalization.of(context)?.homePageButton4 ??
                  'Fallback message',
              tacticPath: 'assets/exotic/exoticordinary_background.jpg',
              onPressed: () => Navigator.pushNamed(context, '/exotic'),
              textStyle:
                  getFontStyle(fontSet: 'ExoticFont', styleType: 'heading')
                      .copyWith(color: exoticColorSet['accent']),
              pageKey: 'exotic',
            ),
            CardButton(
              title: AppLocalization.of(context)?.homePageButton5 ??
                  'Fallback message',
              tacticPath: 'assets/boutique/door_image.jpg',
              onPressed: () => Navigator.pushNamed(context, '/boutique'),
              textStyle:
                  getFontStyle(fontSet: 'BoutiqueFont', styleType: 'heading')
                      .copyWith(color: boutiqueColorSet['accent']),
              pageKey: 'boutique',
            ),
          ],
        ),
      ),
      bottomNavigationBar: buildFooter(context),
      floatingActionButton: FloatingAction(
        imagePath: 'assets/dusty/dusty-agent-white.png',
        onPressed: () => launchURL('https://dustyagent.chat', context),
        pageKey: 'dusty',
      ),
    );
  }
}
