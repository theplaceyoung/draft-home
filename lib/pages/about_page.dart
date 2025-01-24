import 'package:draft_home/url_launcher/url_launcher.dart';
import 'package:draft_home/utils/color_map.dart';
import 'package:draft_home/utils/floating_action.dart';
import 'package:draft_home/utils/url_utils.dart';
import 'package:draft_home/widgets/app_bar.dart';
import 'package:draft_home/widgets/common_drawer.dart';
import 'package:draft_home/widgets/email_input.dart';
import 'package:draft_home/widgets/footer.dart';
import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    //related to appbar
    String logoPath = 'assets/logo_symbol_draft.png';
    Color appBarBackgroundColor =
        Color.fromARGB(255, 119, 61, 61); // AppBar 배경색
    Color appBarIconColor = Colors.white; // AppBar 아이콘 색상
    double screenWidth = MediaQuery.of(context).size.width; // 화면너비

    return Scaffold(
      backgroundColor: ordinaryColorSet['background'],
      drawer: CommonDrawer(pageKey: 'about'),
      appBar: CommonAppBar(
        logoPath: logoPath,
        backgroundColor: appBarBackgroundColor, // AppBar 배경색
        iconColor: appBarIconColor,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(top: 0), // 상단 영역을 내려줌
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center, // 수평중앙정렬
          children: [
            SizedBox(height: 40),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Text(
                'Core mission of creating ordinary life-style with you.',
                style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: ordinaryColorSet['textPrimary']),
                textAlign: TextAlign.center, // 텍스트 중앙 정렬
              ),
            ),
            SizedBox(height: 60),
            Image.asset('assets/symbol_about_us.png', width: screenWidth * 0.5),
            // Image.asset('assets/symbol_about_us.png',
            //     width: screenWidth * 0.5),
            SizedBox(height: 100),
            Text(
              '```Changing an Ordinary life.```',
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.normal,
                  color: ordinaryColorSet[
                      'textPrimary'] // const Color.fromARGB(255, 145, 79, 79),
                  ),
              textAlign: TextAlign.center, // 텍스트 중앙 정렬
            ),
            SizedBox(height: 40),
            Text(
              '@exoticordinary_official 계정의 팔로워가 되어주세요.',
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.normal,
                  color: ordinaryColorSet['textPrimary']),
              textAlign: TextAlign.center, // 텍스트 중앙 정렬
            ),
            SizedBox(height: 60),
            Row(
              mainAxisAlignment: MainAxisAlignment.center, // Row 내 요소 중앙 정렬
              children: [
                GestureDetector(
                  onTap: () {
                    // URL 열기
                    launchInstagram();
                  },
                  child: Image.asset(
                    'assets/instagram_icon.png', // 인스타그램 아이콘 경로
                    width: 40, // 아이콘 크기
                  ),
                ),
                SizedBox(width: 10), // 아이콘과 텍스트 사이 간격
                GestureDetector(
                  onTap: () {
                    // URL 열기
                    launchInstagram();
                  },
                  child: Text(
                    '@exoticordinary_official',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: ordinaryColorSet['textSecondary'],
                    ), // URL 텍스트 색상
                    // decoration: TextDecoration.underline, // 밑줄 추가
                  ),
                ),
              ],
            ),
            SizedBox(height: 80),
            Image.asset('assets/about_us.png', width: screenWidth * 0.89),
            SizedBox(height: 40),
            Text(
              '#Creative-Hashtags',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.normal,
                color: const Color.fromARGB(255, 145, 79, 79),
              ),
              textAlign: TextAlign.center, // 텍스트 중앙 정렬
            ),
            SizedBox(height: 20),
            Text(
              '#오디너리라이프 #오디너리라이프스타일공유 #나를위한시간',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.normal,
                color: const Color.fromARGB(255, 119, 61, 61),
              ),
              textAlign: TextAlign.center, // 텍스트 중앙 정렬
            ),
            SizedBox(height: 80),
            // Image.asset(
            //   'assets/symbol_about_us.png',
            //   width: ScreenWidth * 1,
            // ),
            SizedBox(height: 60),
            Card(
              elevation: 0,
              color: Colors.transparent,
              child: Image.asset(
                'assets/OL_setup_detail_page.png',
                width: screenWidth * 1,
              ),
            ),
            EmailInputWidget(
              colorSet: ordinaryColorSet,
            ),
          ],
        ),
      ),
      bottomNavigationBar: buildFooter(context),
      floatingActionButton: FloatingAction(
        imagePath: 'assets/dusty/dusty-agent-white.png', // 다른 이미지 경로
        onPressed: () => launchURL('https://www.dustydraft.chat', context),
        pageKey: 'dusty', // 페이지 키 전달
      ),
    );
  }
}
