import 'package:draft_home/url_launcher/url_launcher.dart';
import 'package:draft_home/widgets/app_bar.dart';
import 'package:draft_home/widgets/drawer.dart';
import 'package:draft_home/widgets/footer.dart';
import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    String logoPath = 'assets/logo_symbol_draft.png';
    double screenWidth = MediaQuery.of(context).size.width; // 화면너비

    return Scaffold(
      drawer: CommonDrawer(),
      appBar: CommonAppBar(logoPath: logoPath),
      body: SingleChildScrollView(
        child: ConstrainedBox(
          constraints: BoxConstraints(
            minHeight: MediaQuery.of(context).size.height,
          ),
          child: IntrinsicHeight(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center, // 수평중앙정렬
              children: [
                SizedBox(height: 100),
                Text(
                  'Core mission of creating ordinary life-style with you.',
                  style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.normal,
                    color: const Color.fromARGB(255, 225, 200, 200),
                  ),
                  textAlign: TextAlign.center, // 텍스트 중앙 정렬
                ),
                SizedBox(height: 60),
                Image.asset('assets/symbol_about_us.png',
                    width: screenWidth * 0.5),
                SizedBox(height: 100),
                Text(
                  '```Changing an Ordinary life.```',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.normal,
                    color: const Color.fromARGB(255, 145, 79, 79),
                  ),
                  textAlign: TextAlign.center, // 텍스트 중앙 정렬
                ),
                SizedBox(height: 40),
                Text(
                  '@exoticordinary_official 계정의 팔로워가 되어주세요.',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.normal,
                    color: const Color.fromARGB(255, 119, 61, 61),
                  ),
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
                          color: Colors.blue, // URL 텍스트 색상
                          decoration: TextDecoration.underline, // 밑줄 추가
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 80),

                Card(
                  elevation: 0,
                  color: Colors.transparent,
                  child: Image.asset(
                    'assets/about_us.png',
                    width: screenWidth * 0.75,
                  ),
                ),
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
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: buildFooter(context),
      backgroundColor: Colors.black,
    );
  }
}
