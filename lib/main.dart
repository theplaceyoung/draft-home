import 'package:draft_co/widgets/common_app_bar.dart';
import 'package:draft_co/widgets/common_drawer.dart';
import 'package:draft_co/widgets/footer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'pages/draft_page.dart';
import 'pages/the_exotic_boutique.dart';
import 'pages/dusty_draft.dart';
import 'pages/contact_page.dart';
import 'pages/exotic_ordinary.dart';
// import 'widgets/footer.dart';
// import 'widgets/common_app_bar.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  static void setLocale(BuildContext context, Locale newLocale) {
    _MyAppState? state = context.findAncestorStateOfType<_MyAppState>();
    state?.setLocale(newLocale);
  }

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Locale _locale = const Locale('en', '');

  void setLocale(Locale locale) {
    setState(() {
      _locale = locale;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'DRAFT',
      locale: _locale, // 현재 로케일 설정
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('en', ''),
        Locale('ko', ''),
      ],
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
      appBar: CommonAppBar(),
      drawer: CommonDrawer(),
      body: Center(
        child: Text('Hello, Draft World!'),
      ),
      bottomNavigationBar: buildFooter(context),
    );
  }
}
