import 'package:draft_home/l10n/localization.dart';
import 'package:draft_home/pages/ordinary_page.dart';
import 'package:draft_home/pages/draft_page.dart';
import 'package:draft_home/pages/dusty_draft.dart';
import 'package:draft_home/pages/exotic_ordinary.dart';
import 'package:draft_home/pages/the_exotic_boutique.dart';
import 'package:draft_home/utils/floating_action.dart';
import 'package:draft_home/utils/font_map.dart';
import 'package:draft_home/utils/url_utils.dart';
import 'package:draft_home/widgets/app_bar.dart';
import 'package:draft_home/widgets/common_drawer.dart';
import 'package:draft_home/widgets/footer.dart';
import 'package:draft_home/utils/card_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() {
  runApp(MaterialApp(
    initialRoute: '/',
    theme: ThemeData(fontFamily: 'NotoSans'),
    home: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      locale: Locale('en', 'US'), // 기본 언어 설정 (영어)
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        Localization.delegate, // 추가된 로컬라이제이션 델리게이트
      ],
      supportedLocales: [
        Locale('en', 'US'), // 영어
        Locale('ko', ''), // 한국어
        // 추가 언어 설정 가능
      ],
      home: const MyHomePage(),
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

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  Color get appBarBackgroundColor => Colors.black;
  Color get appBarIconColor => Colors.white;

  double getResponsiveFontSize(double screenWidth) {
    return screenWidth > 600 ? 24.0 : 18.0;
  }

  @override
  Widget build(BuildContext context) {
    final String currentRoute = ModalRoute.of(context)?.settings.name ?? '/';
    final double screenWidth = MediaQuery.of(context).size.width;
    final double fontSize = getResponsiveFontSize(screenWidth);

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
        backgroundColor: appBarBackgroundColor, // AppBar 배경색
        iconColor: appBarIconColor,
      ), // AppBar 아이콘 색),
      body: SingleChildScrollView(
        child: Column(
          children: [
            CardButton(
              title: 'DRAFT Company',
              tacticPath: 'assets/draft/crumpled_paper_1405.jpg',
              onPressed: () => Navigator.pushNamed(context, '/draft'),
              textStyle: draftFontSet['heading']!, // fontStyle을 전달
              pageKey: 'draft',
            ),
            CardButton(
              title: 'Dusty Draft',
              tacticPath:
                  'assets/dusty/brown-background-water-reflection-texture.jpg',
              onPressed: () => Navigator.pushNamed(context, '/dusty'),
              textStyle: dustyFontSet['heading']!, // fontStyle을 전달
              pageKey: 'dusty',
            ),
            CardButton(
              title: 'Ordinary Life',
              tacticPath: 'assets/ordinary/background_1.png',
              onPressed: () => Navigator.pushNamed(context, '/ordinary'),
              textStyle: ordinaryFontSet['heading']!, // fontStyle을 전달
              pageKey: 'ordinary',
            ),
            CardButton(
              title: 'Exotic Ordinary',
              tacticPath: 'assets/exotic/exoticordinary_background.jpg',
              onPressed: () => Navigator.pushNamed(context, '/exotic'),
              textStyle: exoticFontSet['heading']!, // fontStyle을 전달
              pageKey: 'exotic',
            ),
            CardButton(
              title: 'The Exotic Boutique',
              tacticPath: 'assets/boutique/door_image.jpg',
              onPressed: () => Navigator.pushNamed(context, '/boutique'),
              textStyle: boutiqueFontSet['heading']!, // fontStyle을 전달
              pageKey: 'boutique',
            ),
          ],
        ),
      ),
      bottomNavigationBar: buildFooter(context),
      floatingActionButton: FloatingAction(
        imagePath: 'assets/dusty/dusty-agent-white.png', // 다른 이미지 경로
        onPressed: () => launchURL('https://www.dustydraft.chat', context),
        pageKey: 'boutique', // 페이지 키 전달
      ),
    );
  }
}
