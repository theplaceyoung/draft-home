import 'package:draft_co/widgets/common_app_bar.dart';
import 'package:draft_co/widgets/common_drawer.dart';
import 'package:flutter/material.dart';
import '../widgets/footer.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBar(), // 공통 AppBar 사용
      drawer: const CommonDrawer(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/logo_draft_transparentBG.png', height: 200),
            SizedBox(height: 20),
            Text('Welcome to the Home Page!', style: TextStyle(fontSize: 24)),
          ],
        ),
      ),
      bottomNavigationBar: buildFooter(context),
    );
  }
}
