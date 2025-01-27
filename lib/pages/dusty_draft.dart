import 'package:draft_home/l10n/app_localization.dart';
import 'package:draft_home/provider/localization_provider.dart';
import 'package:draft_home/utils/color_map.dart';
import 'package:draft_home/utils/floating_action.dart';
import 'package:draft_home/utils/font_map.dart';
import 'package:draft_home/utils/url_button.dart';
import 'package:draft_home/utils/url_utils.dart';
import 'package:draft_home/widgets/app_bar.dart';
import 'package:draft_home/widgets/common_drawer.dart';
import 'package:draft_home/widgets/email_input.dart';
import 'package:draft_home/widgets/footer.dart';
import 'package:draft_home/widgets/video_player.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DustyDraftPage extends StatelessWidget {
  const DustyDraftPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Localization instance
    final appLocalizations = AppLocalization.of(context);

    // Related to appbar
    String logoPath = 'assets/dusty/logo_symbol_draft_grey.png';
    Color? appBarBackgroundColor = dustyColorSet['primary'];
    Color appBarIconColor = Colors.white;

    // 화면 너비
    // double screenWidth = MediaQuery.of(context).size.width;

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
      backgroundColor: dustyColorSet['background'],
      drawer: CommonDrawer(pageKey: 'dusty'),
      appBar: CommonAppBar(
        logoPath: logoPath,
        backgroundColor:
            appBarBackgroundColor ?? Color.fromARGB(255, 161, 136, 127),
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
        padding: const EdgeInsets.only(top: 0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 20),
            FutureBuilder<void>(
              future: _initializeVideoPlayer(), // 비디오 초기화 작업을 위한 Future
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator()); // 로딩 표시
                }
                if (snapshot.hasError) {
                  return Text('Error: ${snapshot.error}');
                }
                return VideoPlayerWidget(
                  videoUrl: 'assets/videos/7624037-uhd_2160_3840_30fps.mp4',
                  isLooping: true,
                  autoPlay: true,
                );
              },
            ),
            SizedBox(height: 100),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  Text(
                    AppLocalization.of(context)?.dustyPageMessage1 ??
                        'Fallback message',
                    style:
                        getFontStyle(fontSet: 'DustyFont', styleType: 'heading')
                            .copyWith(color: dustyColorSet['textSecondary']),
                    textAlign: TextAlign.center, // 텍스트 중앙 정렬
                  ),
                  //   style: TextStyle(
                  //       fontSize: 24,
                  //       fontWeight: FontWeight.bold,
                  //       color: Colors.black),
                  // ),
                  SizedBox(height: 100),
                  Text(
                    AppLocalization.of(context)?.dustyPageMessage2 ??
                        'Fallback message',
                    //'창의력은 기회를 만들어 잡아내는 자의 것입니다. \n 모래처럼 흩어지기 전에, 당신의 아이디어를 현실로 만들어보세요.\n 우리의 도구와 플랫폼이 함께합니다.',
                    style:
                        getFontStyle(fontSet: 'DustyFont', styleType: 'heading')
                            .copyWith(color: dustyColorSet['textPrimary']),
                    textAlign: TextAlign.center, // 텍스트 중앙 정렬
                  ),
                ],
              ),
            ),
            SizedBox(height: 200),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                children: [
                  UrlButton(
                    label: AppLocalization.of(context)?.dustyButtonMessage1 ??
                        'Fallback message', //'웹사이트 바로가기',
                    onPressed: () =>
                        launchURL('https://www.dustydraft.com', context),
                    colorSet: dustyColorSet,
                    fontFamily: 'dustyFont',
                    fontSize: FontSizeOptions.medium,
                    textcolor: exoticColorSet['accent'],
                  ),
                  SizedBox(height: 100),
                  Text(
                    AppLocalization.of(context)?.dustyPageMessage3 ??
                        'Fallback message',
                    //'더스티 드래프트와 함께, \n 아이디어가 모래처럼 흩어져버리기 전에 보배가 되도록 꿰어보세요.',
                    style:
                        getFontStyle(fontSet: 'DustyFont', styleType: 'heading')
                            .copyWith(color: dustyColorSet['textSecondary']),
                    textAlign: TextAlign.center, // 텍스트 중앙 정렬
                  ),
                ],
              ),
            ),
            SizedBox(height: 150),
            Image.asset('assets/dusty/logo_dustydraft.png', height: 200),
            SizedBox(height: 150),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: UrlButton(
                label: AppLocalization.of(context)?.dustyButtonMessage2 ??
                    'Fallback message', //'소개자료 열어보기',
                onPressed: () => launchURL(
                    'https://github.com/theplaceyoung/draft_co/blob/main/assets/DRAFT_dustydraft_service-description_24.pdf',
                    context),
                colorSet: dustyColorSet,
                fontFamily: 'dustyFont',
                fontSize: FontSizeOptions.medium,
                textcolor: exoticColorSet['accent'],
              ),
            ),
            SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: UrlButton(
                label: AppLocalization.of(context)?.dustyButtonMessage3 ??
                    'Fallback message', //'소개자료 다운로드',
                onPressed: () => launchURL(
                    'https://raw.githubusercontent.com/theplaceyoung/draft_home/gh-pages/assets/assets/DRAFT_dustydraft_service-description_24.pdf',
                    context),
                colorSet: dustyColorSet,
                fontFamily: 'dustyFont',
                fontSize: FontSizeOptions.medium,
                textcolor: exoticColorSet['accent'],
              ),
            ),
            SizedBox(height: 130),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Text(
                AppLocalization.of(context)?.dustyPageMessage4 ??
                    'Fallback message',
                //'당신의 오래된 초안을 꺼내세요. 지금이 바로 실현할 때입니다!',
                style: getFontStyle(fontSet: 'DustyFont', styleType: 'heading')
                    .copyWith(color: dustyColorSet['textSecondary']),
                textAlign: TextAlign.center, // 텍스트 중앙 정렬
              ),
            ),
            SizedBox(height: 100),
            // padding: const EdgeInsets.symmetric(horizontal: 20.0),
            // child: PdfButton(
            //     label: '소개자료 다운받기',
            //     pdfUrl:
            //         'https://raw.githubusercontent.com/theplaceyoung/draft_home/gh-pages/assets/assets/DRAFT_dustydraft_service-description_24.pdf',
            //     colorSet: dustyColorSet)
            // child: ElevatedButton(
            //   onPressed: () async {
            //     try {
            //       const pdfPath =
            //           'https://raw.githubusercontent.com/theplaceyoung/draft_home/gh-pages/assets/assets/DRAFT_dustydraft_service-description_24.pdf';
            //       await openPDF(pdfPath);
            //     } catch (e) {
            //       _showError(context, 'PDF 열기 실패: $e');
            //     }
            //   },
            //   style: ElevatedButton.styleFrom(
            //     padding: EdgeInsets.symmetric(vertical: 16, horizontal: 40),
            //     textStyle: TextStyle(fontSize: 18),
            //     backgroundColor: Colors.black,
            //     foregroundColor: Colors.white,
            //   ),
            //   child: Text('소개자료 다운받기'),
            // ),
            SizedBox(height: 100),
            EmailInputWidget(
              colorSet: dustyColorSet,
            ),
            const SizedBox(height: 50),
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

  // 비디오 초기화 작업
  Future<void> _initializeVideoPlayer() async {
    // 비디오 초기화 작업 (예: 비디오 로드, 준비 등)
    await Future.delayed(Duration(seconds: 1)); // 더미 대기 시간
  }

  Future<void> _showError(BuildContext context, String message) async {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message)),
    );
  }
}
