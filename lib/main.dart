import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'pages/home_page.dart';
import 'pages/the-exotic-boutique.dart';
import 'pages/dusty-draft.dart';
import 'pages/contact_page.dart';
import 'pages/exotic-ordinary.dart';
import 'widgets/footer.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
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

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60.0),
        child: AppBar(
          backgroundColor: Colors.blueAccent,
          elevation: 0,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.asset('assets/logo_draft_transparentBG.png', height: 45),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  _buildMenuButton(context, 'Home', '/home'),
                  _buildMenuButton(context, 'Exotic Ordinary',
                      'http://smartstore.naver.com/exoticordinary'), // 수정된 부분
                  _buildMenuButton(
                      context, 'The Exotic Boutique', '/the-exotic-boutique'),
                  _buildMenuButton(context, 'Dusty Draft', '/dusty-draft'),
                  _buildMenuButton(context, 'Contact', '/contact'),
                ],
              ),
            ],
          ),
        ),
      ),
      endDrawerEnableOpenDragGesture: true,
      body: Center(
        child: Text('Welcome to My Website!', style: TextStyle(fontSize: 24)),
      ),
      bottomNavigationBar: buildFooter(),
    );
  }

  Widget _buildMenuButton(BuildContext context, String title, dynamic route) {
    return TextButton(
      onPressed: () async {
        if (route is String && route.startsWith('http')) {
          if (await canLaunch(route)) {
            await launch(route);
          } else {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text('링크를 열 수 없습니다.'),
            ));
          }
        } else {
          Navigator.pushNamed(context, route);
        }
      },
      child: Text(title, style: TextStyle(color: Colors.white, fontSize: 16)),
    );
  }
}
