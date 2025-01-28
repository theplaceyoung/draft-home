import 'package:draft_home/l10n/app_localization.dart';
import 'package:draft_home/utils/color_map.dart';
import 'package:draft_home/utils/font_map.dart';
import 'package:draft_home/utils/url_utils.dart';
import 'package:draft_home/widgets/app_bar.dart';
import 'package:draft_home/utils/floating_action.dart';
import 'package:draft_home/utils/url_button.dart';
import 'package:draft_home/widgets/common_drawer.dart';
import 'package:draft_home/provider/localization_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../widgets/footer.dart';
import '../utils/card_button.dart';

class DraftPage extends StatelessWidget {
  const DraftPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Localization instance
    final appLocalization = AppLocalization.of(context);

    // Related to appbar
    String logoPath = 'assets/draft/logo_symbol_draft.png';
    Color appBarBackgroundColor = draftColorSet['primary'] ?? Colors.black;
    // const Color.fromARGB(255, 4, 39, 69); // AppBar 배경색
    Color appBarIconColor = draftColorSet['textSecondary'] ?? Colors.white;
    // const Color.fromARGB(255, 209, 203, 203); // AppBar 아이콘 색상

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
      backgroundColor: draftColorSet['background'],
      drawer: CommonDrawer(pageKey: 'draft'),
      appBar: CommonAppBar(
        logoPath: logoPath,
        backgroundColor: appBarBackgroundColor, // AppBar 배경색
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
            const SizedBox(height: 40),
            Text(
              AppLocalization.of(context)?.draftPageMessage ??
                  'Fallback message', // '어떤 것이든 좋습니다. 마음껏 그려보세요!',
              style: getFontStyle(
                fontSet: 'DraftFont',
                styleType: 'body',
              ).copyWith(color: draftColorSet['textSecondary']),
              textAlign: TextAlign.center, // 텍스트 중앙 정렬
            ),
            // textAlign: TextAlign.center,
            const SizedBox(height: 40),
            CardButton(
              title: AppLocalization.of(context)?.draftSolutions ??
                  'Fallback message', //  title: 'draft solutions and services',
              tacticPath: 'assets/draft/logo_draft_transparentBG.png',
              onPressed: () => Navigator.pushNamed(context, '/dusty'),
              shape: CardShape.roundedRectangle,
              textStyle: getFontStyle(fontSet: 'DraftFont', styleType: 'body')
                  .copyWith(
                      color: draftColorSet['textPrimary']), // fontStyle을 전달
              pageKey: 'draft',
            ),
            const SizedBox(height: 40),
            UrlButton(
              label:
                  AppLocalization.of(context)?.webVersion ?? 'Fallback message',
              //label: 'My Creative Canvas - 웹브라우저 버전',
              onPressed: () => launchURL(
                'https://my-canvas-canvas.web.app/',
                context,
              ),
              colorSet: draftColorSet,
              fontFamily: 'draftFont',
              fontSize: FontSizeOptions.medium,
              textcolor: draftColorSet['accent'],
            ),
            const SizedBox(height: 40),
            UrlButton(
              label: AppLocalization.of(context)?.touchPadVersion ??
                  'Fallback message',
              //label: 'Touch Pad Version (Coming Soon)',
              onPressed: () => launchURL(
                'https://theplaceyoung.github.io/pwa-webapp-canvas/',
                context,
              ),
              colorSet: draftColorSet,
              fontFamily: 'draftFont',
              fontSize: FontSizeOptions.medium,
              textcolor: draftColorSet['accent'],
            ),
          ],
        ),
      ),
      bottomNavigationBar: buildFooter(context),
      floatingActionButton: FloatingAction(
        imagePath: 'assets/dusty/dusty-agent-white.png', // 다른 이미지 경로
        onPressed: () => launchURL('https://www.dustydraft.chat', context),
        pageKey: 'draft', // 페이지 키 전달
      ),
    );
  }
}
