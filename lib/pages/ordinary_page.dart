import 'package:draft_home/l10n/app_localization.dart';
import 'package:draft_home/provider/localization_provider.dart';
import 'package:draft_home/url_launcher/url_launcher.dart';
import 'package:draft_home/utils/color_map.dart';
import 'package:draft_home/utils/floating_action.dart';
import 'package:draft_home/utils/font_map.dart';
import 'package:draft_home/utils/url_utils.dart';
import 'package:draft_home/widgets/app_bar.dart';
import 'package:draft_home/widgets/common_drawer.dart';
import 'package:draft_home/widgets/email_input.dart';
import 'package:draft_home/widgets/footer.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class OrdinaryPage extends StatelessWidget {
  const OrdinaryPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Localization instance
    final appLocalizations = AppLocalization.of(context);

    //related to appbar
    String logoPath = 'assets/draft/logo_symbol_draft.png';
    Color? appBarBackgroundColor = ordinaryColorSet['primary'];
    Color appBarIconColor = Colors.white; // AppBar 아이콘 색상

    double screenWidth = MediaQuery.of(context).size.width; // 화면너비

    // 현재 언어 가져오기
    Locale currentLocale = Localizations.localeOf(context);

    // 언어 전환 함수
    void toggleLanguage(BuildContext context) {
      Locale newLocale = currentLocale.languageCode == 'en'
          ? const Locale('ko')
          : const Locale('en');
      // Flutter 앱의 언어를 변경하는 로직 추가 (예: Provider, ChangeNotifier 등으로 구현)
      context.read<LocalizationProvider>().changeLocale(newLocale);
      // LocalizationProvider.changeLocale(newLocale);

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            'Language changed to ${newLocale.languageCode.toUpperCase()}!',
          ),
        ),
      );
    }

    return Scaffold(
      backgroundColor: ordinaryColorSet['background'],
      drawer: CommonDrawer(pageKey: 'ordinary'),
      appBar: CommonAppBar(
        logoPath: logoPath,
        backgroundColor: appBarBackgroundColor ??
            Color.fromARGB(255, 119, 61, 61), // AppBar 배경색
        iconColor: appBarIconColor,
        actions: [
          IconButton(
            icon: Icon(
              Icons.language,
              color: appBarIconColor,
            ),
            onPressed: () => toggleLanguage(context), // 언어 전환 버튼
          ),
        ],
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
                AppLocalization.of(context)?.ordinaryPageMessage1 ??
                    'Fallback message',
                // 'Core mission of creating ordinary life-style with you.',
                style:
                    getFontStyle(fontSet: 'OrdinaryFont', styleType: 'heading')
                        .copyWith(color: ordinaryColorSet['accent']),
                textAlign: TextAlign.center, // 텍스트 중앙 정렬
              ),
            ),
            SizedBox(height: 60),
            Image.asset('assets/ordinary/symbol_about_us.png',
                width: screenWidth * 0.5),
            // Image.asset('assets/symbol_about_us.png',
            //     width: screenWidth * 0.5),
            SizedBox(height: 100),
            Text(
              AppLocalization.of(context)?.ordinaryPageMessage2 ??
                  'Fallback message',
              //'```Changing an Ordinary life.```',
              style: getFontStyle(fontSet: 'OrdinaryFont', styleType: 'heading')
                  .copyWith(color: ordinaryColorSet['accent']),
              textAlign: TextAlign.center, // 텍스트 중앙 정렬
            ),
            SizedBox(height: 40),
            Text(
              AppLocalization.of(context)?.ordinaryPageMessage3 ??
                  'Fallback message',
              //'@exoticordinary_official 계정의 팔로워가 되어주세요.',
              style: getFontStyle(fontSet: 'OrdinaryFont', styleType: 'heading')
                  .copyWith(color: ordinaryColorSet['accent']),
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
            Image.asset('assets/ordinary/about_us.png',
                width: screenWidth * 0.89),
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
              AppLocalization.of(context)?.ordinaryPageMessage4 ??
                  'Fallback message',
              //'#오디너리라이프 #오디너리라이프스타일공유 #나를위한시간',
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
                'assets/ordinary/OL_setup_detail_page.png',
                width: screenWidth * 1,
              ),
            ),
            EmailInputWidget(
              colorSet: ordinaryColorSet,
            ),
            const SizedBox(height: 50),
          ],
        ),
      ),
      bottomNavigationBar: buildFooter(context),
      floatingActionButton: FloatingAction(
        imagePath: 'assets/dusty/dusty-agent-white.png', // 다른 이미지 경로
        onPressed: () => launchURL('https://www.dustydraft.chat', context),
        pageKey: 'boutique', // 페이지 키 전달
      ),
    );
  }
}
