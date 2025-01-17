import 'package:flutter/material.dart';
import 'pages/home_page.dart';
import 'pages/the_exotic_boutique.dart';
import 'pages/dusty_draft.dart';
import 'pages/contact_page.dart';
import 'pages/exotic_ordinary.dart';
// import 'widgets/footer.dart';
// import 'widgets/common_app_bar.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
      routes: {
        '/home': (context) => HomePage(),
        '/exotic-ordinary': (context) => ExoticOrdinaryPage(),
        '/the-exotic-boutique': (context) => TheExoticBoutiquePage(),
        '/dusty-draft': (context) => DustyDraftPage(),
        '/contact': (context) => ContactPage(),
      },
    );
  }
}
