import 'package:draft_home/l10n/localization.dart';
import 'package:draft_home/pages/about_page.dart';
import 'package:draft_home/pages/draft_page.dart';
import 'package:draft_home/pages/dusty_draft.dart';
import 'package:draft_home/pages/exotic_ordinary.dart';
import 'package:draft_home/pages/the_exotic_boutique.dart';
import 'package:draft_home/widgets/app_bar.dart';
import 'package:draft_home/widgets/drawer.dart';
import 'package:draft_home/widgets/footer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() {
  runApp(MyApp());
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
      home: MyHomePage(),
      routes: {
        '/draft': (context) => DraftPage(),
        '/exotic-ordinary': (context) => ExoticOrdinaryPage(),
        '/the-exotic-boutique': (context) => TheExoticBoutiquePage(),
        '/dusty-draft': (context) => DustyDraftPage(),
        '/about': (context) => AboutPage(),
      },
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    String logoPath;

    switch (ModalRoute.of(context)?.settings.name) {
      case '/draft':
        logoPath = 'assets/logo_draft.png';
        break;
      case '/exotic-ordinary':
        logoPath = 'assets/logo_exotic_ordinary.png';
        break;
      case '/the-exotic-boutique':
        logoPath = 'assets/logo_boutique.png';
        break;
      case '/dusty-draft':
        logoPath = 'assets/logo_dusty_draft.png';
        break;
      case '/about':
        logoPath = 'assets/logo_contact.png';
        break;
      default:
        logoPath = 'assets/logo_symbol_draft.png';
    }

    return Scaffold(
      drawer: CommonDrawer(),
      appBar: CommonAppBar(logoPath: logoPath),
      body: SingleChildScrollView(
        child: Column(
          children: [
            CardButton(
              title: 'DRAFT Company',
              tacticPath: 'assets/background_1.png',
              onPressed: () => Navigator.pushNamed(context, '/draft'),
            ),
            CardButton(
              title: 'Exotic Ordinary',
              tacticPath: 'assets/exoticordinary_background.jpg',
              onPressed: () => Navigator.pushNamed(context, '/exotic-ordinary'),
            ),
            CardButton(
              title: 'The Exotic Boutique',
              tacticPath: 'assets/door_image.jpg',
              onPressed: () =>
                  Navigator.pushNamed(context, '/the-exotic-boutique'),
            ),
            CardButton(
              title: 'Dusty Draft',
              tacticPath: 'assets/AdobeStock_228406900.jpeg',
              onPressed: () => Navigator.pushNamed(context, '/dusty-draft'),
            ),
            CardButton(
              title: 'Ordinary Life',
              tacticPath: 'assets/AdobeStock_712861746.jpeg',
              onPressed: () => Navigator.pushNamed(context, '/about'),
            ),
          ],
        ),
      ),
      bottomNavigationBar: buildFooter(context),
    );
  }
}

class CardButton extends StatelessWidget {
  final String title;
  final String tacticPath;
  final VoidCallback onPressed;

  const CardButton({
    required this.title,
    required this.tacticPath,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 8.0),
      child: InkWell(
        onTap: onPressed,
        child: Stack(
          alignment: Alignment.center,
          children: [
            Image.asset(
              tacticPath,
              fit: BoxFit.cover,
              height: 300, // 부모 크기에 맞춰 이미지 높이 확장
              width: double.infinity, // 부모 크기에 맞춰 이미지 넓이 확장
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                title,
                style: TextStyle(fontSize: 18.0),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
