import 'package:draft_home/utils/card_button.dart';
import 'package:draft_home/utils/color_map.dart';
import 'package:draft_home/utils/floating_action.dart';
import 'package:draft_home/utils/font_map.dart';
import 'package:draft_home/utils/url_button.dart';
import 'package:draft_home/utils/url_utils.dart';
import 'package:draft_home/widgets/app_bar.dart';
import 'package:draft_home/widgets/common_drawer.dart';
import 'package:draft_home/widgets/footer.dart';
import 'package:flutter/material.dart';

class TheExoticBoutiquePage extends StatelessWidget {
  const TheExoticBoutiquePage({super.key});

  @override
  Widget build(BuildContext context) {
    // related to page
    final colors = boutiqueColorSet;

    //related to appbar
    String logoPath = 'assets/boutique/exotic-yellow.png';
    Color? appBarBackgroundColor = boutiqueColorSet['primary']; // AppBar 배경색
    Color appBarIconColor = Colors.white; // AppBar 아이콘 색상
    // double screenWidth = MediaQuery.of(context).size.width; // 화면너비

    return Scaffold(
      backgroundColor: boutiqueColorSet['background'],
      drawer: CommonDrawer(pageKey: 'boutique'),
      appBar: CommonAppBar(
        logoPath: logoPath,
        backgroundColor: appBarBackgroundColor ??
            Color.fromARGB(255, 161, 107, 102), // AppBar 배경색
        iconColor: appBarIconColor,
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 40),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Text('Welcome to the Exotic Voutique!',
                  style: boutiqueFontSet['heading']),
              // fontSize: FontSizeOptions.large,
              // fontWeight: FontWeight.bold,
              // color: Colors.black),
            ),
            SizedBox(height: 20),
            CardButton(
              title: '',
              tacticPath: 'assets/exotic/evotic.png',
              onPressed: () => launchURL(
                'https://naver.me/GctERDE8',
                context,
              ),
              textStyle: boutiqueFontSet['body']!,
              pageKey: 'boutique',
            ),
            SizedBox(height: 25),
            CardButton(
              title: 'logo',
              tacticPath: 'assets/boutique/logo_the_boutique.png',
              onPressed: () => launchURL(
                'https://naver.me/GctERDE8',
                context,
              ),
              textStyle: boutiqueFontSet['body']!, // fontStyle을 전달
              pageKey: 'boutique',
            ),
            SizedBox(height: 40),
            UrlButton(
              label: 'Visit Offline Shop in Seoul, The Exotic Boutique.',
              onPressed: () => launchURL(
                'https://naver.me/GctERDE8',
                context,
              ),
              colorSet: boutiqueColorSet,
              fontFamily: 'boutiqueFont',
              fontSize: FontSizeOptions.medium,
            ),
            // ElevatedButton(
            //   onPressed: () => launchURL('https://naver.me/GctERDE8', context),
            //   style: ElevatedButton.styleFrom(
            //     padding: EdgeInsets.symmetric(vertical: 16, horizontal: 40),
            //     textStyle: TextStyle(fontSize: 18),
            //     backgroundColor: const Color.fromARGB(255, 247, 239, 173),
            //     foregroundColor: Colors.black,
            //   ),
            //   child: Text('Visit Offline Shop in Seoul, The Exotic Boutique.'),
          ],
        ),
      ),
      bottomNavigationBar: buildFooter(context),
      // backgroundColor: const Color.fromARGB(255, 247, 239, 173),
      floatingActionButton: FloatingAction(
        imagePath: 'assets/dusty/dusty-agent-white.png', // 다른 이미지 경로
        onPressed: () => launchURL('https://www.dustydraft.chat', context),
        pageKey: 'boutique', // 페이지 키 전달
      ),
    );
  }
}
