import 'package:draft_home/utils/url_utils.dart';
import 'package:draft_home/widgets/app_bar.dart';
import 'package:draft_home/widgets/drawer.dart';
import 'package:draft_home/widgets/footer.dart';
import 'package:flutter/material.dart';

class TheExoticBoutiquePage extends StatelessWidget {
  const TheExoticBoutiquePage({super.key});

  @override
  Widget build(BuildContext context) {
    String logoPath = 'assets/exotic-yellow.png';
    Color appBarBackgroundColor =
        Color.fromARGB(122, 164, 116, 67); // AppBar 배경색
    Color appBarIconColor = Colors.white; // AppBar 아이콘 색상

    return Scaffold(
      drawer: CommonDrawer(),
      appBar: CommonAppBar(
        logoPath: logoPath,
        backgroundColor: appBarBackgroundColor, // AppBar 배경색
        iconColor: appBarIconColor,
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/door_image.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 40),
                Text(
                  'Welcome to the Exotic Voutique!',
                  style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () =>
                      launchURL('https://naver.me/GctERDE8', context),
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.all(16), // 전체 크기 조절
                    shape: CircleBorder(),
                    backgroundColor: Colors.black,
                    elevation: 0.1,
                    // foregroundColor: const Color.fromARGB(255, 247, 239, 173),
                  ),
                  child: Image.asset('assets/evotic.png', height: 40),
                ),
                SizedBox(height: 25),
                Image.asset('assets/logo_the_boutique.png', height: 100),
                SizedBox(height: 40),
                ElevatedButton(
                  onPressed: () =>
                      launchURL('https://naver.me/GctERDE8', context),
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(vertical: 16, horizontal: 40),
                    textStyle: TextStyle(fontSize: 18),
                    backgroundColor: const Color.fromARGB(255, 247, 239, 173),
                    foregroundColor: Colors.black,
                  ),
                  child:
                      Text('Visit Offline Shop in Seoul, The Exotic Boutique.'),
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: buildFooter(context),
      backgroundColor: const Color.fromARGB(255, 247, 239, 173),
    );
  }
}
