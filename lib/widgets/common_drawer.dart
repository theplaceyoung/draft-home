import 'package:flutter/material.dart';

class CommonDrawer extends StatelessWidget {
  const CommonDrawer({required this.pageKey, super.key});
  final String pageKey; // 페이지 키
  @override
  Widget build(BuildContext context) {
    final backgroundColor = Colors.white; // 기본 색상 설정
    return Drawer(
      child: Container(
        color: backgroundColor,
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              child: Text(
                'Menu',
                style: TextStyle(color: Colors.white, fontSize: 24),
              ),
            ),
            ListTile(
              title: Text('Home'),
              onTap: () {
                Navigator.pushNamed(context, '/');
              },
            ),
            const Divider(), // 구분선
            ListTile(
              title: Text('DRAFT Company'),
              onTap: () {
                Navigator.pushNamed(context, '/draft');
              },
            ),
            ListTile(
              title: Text('Dusty Draft'),
              onTap: () {
                Navigator.pushNamed(context, '/dusty');
              },
            ),
            ListTile(
              title: Text('Ordinary Life'),
              onTap: () {
                Navigator.pushNamed(context, '/ordinary');
              },
            ),
            ListTile(
              title: Text('Exotic Ordinary'),
              onTap: () {
                Navigator.pushNamed(context, '/exotic');
              },
            ),
            ListTile(
              title: Text('The Exotic Boutique'),
              onTap: () {
                Navigator.pushNamed(context, '/boutique');
              },
            ),
            const Divider(), // 구분선
          ],
        ),
      ),
    );
  }
}
