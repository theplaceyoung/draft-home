import 'package:flutter/material.dart';
import 'pages/home_page.dart';
import 'package:draft_co/pages/the-exotic-boutique.dart';
import 'package:draft_co/pages/dusty-draft.dart';
import 'package:draft_co/pages/contact_page.dart';
import 'package:draft_co/widgets/footer.dart';
import 'package:draft_co/pages/exotic-ordinary.dart';

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
              // Text(
              //   'My Website',
              //   style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              // ),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  _buildMenuButton(context, 'Home', '/home'),
                  _buildMenuButton(
                    context,
                    'Exotic Ordinary',
                    '/exotic-ordinary',
                  ),
                  _buildMenuButton(
                    context,
                    'The Exotic Boutique',
                    'the-exotic-boutique',
                  ),
                  _buildMenuButton(context, 'Dusty Draft', 'dusty-draft'),
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

  Widget _buildMenuButton(BuildContext context, String title, String route) {
    return TextButton(
      onPressed: () {
        Navigator.pushNamed(context, route);
      },
      child: Text(title, style: TextStyle(color: Colors.white, fontSize: 16)),
    );
  }

  // Widget _buildFooter() {
  //   return Container(
  //     color: Colors.grey[200],
  //     padding: EdgeInsets.all(10.0),
  //     child: Row(
  //       mainAxisAlignment: MainAxisAlignment.center,
  //       children: [
  //         Text(
  //           '© 2024 My Website. All rights reserved.',
  //           style: TextStyle(fontSize: 14, color: Colors.black54),
  //         ),
  //       ],
  //     ),
  //   );
  // }
}
