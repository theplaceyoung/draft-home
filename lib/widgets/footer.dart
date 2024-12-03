import 'package:flutter/material.dart';

Widget buildFooter() {
  return Container(
    color: Colors.grey[200],
    padding: EdgeInsets.all(10.0),
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(
              onPressed: () {},
              child: Text('Privacy Policy', style: TextStyle(fontSize: 14)),
            ),
            Text('|', style: TextStyle(fontSize: 14, color: Colors.black54)),
            TextButton(
              onPressed: () {},
              child: Text('Terms of Service', style: TextStyle(fontSize: 14)),
            ),
          ],
        ),
        Text(
          '© 2024 My Website. All rights reserved.',
          style: TextStyle(fontSize: 14, color: Colors.black54),
        ),
      ],
    ),
  );
}
