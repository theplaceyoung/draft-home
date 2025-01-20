import 'package:draft_home/pages/contact_page.dart';
import 'package:draft_home/pages/draft_page.dart';
import 'package:draft_home/pages/dusty_draft.dart';
import 'package:draft_home/pages/exotic_ordinary.dart';
import 'package:draft_home/pages/the_exotic_boutique.dart';
import 'package:draft_home/widgets/common_app_bar.dart';
import 'package:draft_home/widgets/common_drawer.dart';
import 'package:draft_home/widgets/footer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'l10n/localization.dart'; // 수정된 Localization 파일

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // locale: Locale('en', 'US'),
      // localizationsDelegates: [
      //   GlobalMaterialLocalizations.delegate,
      //   GlobalWidgetsLocalizations.delegate,
      //   GlobalCupertinoLocalizations.delegate,
      // ],
      // supportedLocales: [
      //   Locale('en', 'US'),
      //   Locale('ko', ''),
      // ],
      home: MyHomePage(),
      routes: {
        '/draft': (context) => DraftPage(),
        '/exotic-ordinary': (context) => ExoticOrdinaryPage(),
        '/the-exotic-boutique': (context) => TheExoticBoutiquePage(),
        '/dusty-draft': (context) => DustyDraftPage(),
        '/contact': (context) => ContactPage(),
      },
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: CommonDrawer(),
      appBar: CommonAppBar(),
      // drawer: CommonDrawer(),
      body: Center(
          // child: Text(Localization.of(context).homePage),
          ),
      bottomNavigationBar: buildFooter(context),
    );
  }
}
