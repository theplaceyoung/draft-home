import 'package:flutter/material.dart';

class CommonDrawer extends StatelessWidget {
  const CommonDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          // DrawerHeader(
          //   decoration:
          //       BoxDecoration(color: const Color.fromARGB(255, 194, 207, 221)),
          //   child: Text(
          //     'Business',
          //     style: TextStyle(
          //         color: const Color.fromARGB(255, 20, 21, 26), fontSize: 24),
          //   ),
          // ),
          ListTile(
            // leading: Icon(Icons.home),
            title: Text(''),
            onTap: () {
              Navigator.pushNamed(context, '/');
            },
          ),
          const Divider(), // 구분선
          ListTile(
            // leading: Icon(Icons.home),
            title: Text('DRAFT Company'),
            onTap: () {
              Navigator.pushNamed(context, '/draft');
            },
          ),
          ListTile(
            // leading: Icon(Icons.home),
            title: Text('Exotic Ordinary'),
            onTap: () {
              Navigator.pushNamed(context, '/exotic-ordinary');
            },
          ),
          ListTile(
            // leading: Icon(Icons.info),
            title: Text('The Exotic Boutique'),
            onTap: () {
              Navigator.pushNamed(context, '/the-exotic-boutique');
            },
          ),
          ListTile(
            // leading: Icon(Icons.info),
            title: Text('Dusty Draft'),
            onTap: () {
              Navigator.pushNamed(context, '/dusty-draft');
            },
          ),
          ListTile(
            // leading: Icon(Icons.contact_page),
            title: Text('Ordinary Life'),
            onTap: () {
              Navigator.pushNamed(context, '/about');
            },
          ),
          const Divider(), // 구분선
        ],
      ),
    );
  }
}
