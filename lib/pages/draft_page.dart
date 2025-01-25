import 'package:draft_home/utils/color_map.dart';
import 'package:draft_home/utils/font_map.dart';
import 'package:draft_home/utils/url_utils.dart';
import 'package:draft_home/widgets/app_bar.dart';
import 'package:draft_home/utils/floating_action.dart';
import 'package:draft_home/utils/url_button.dart';
import 'package:draft_home/widgets/common_drawer.dart';
import 'package:flutter/material.dart';
import '../widgets/footer.dart';
import '../utils/card_button.dart';

class DraftPage extends StatelessWidget {
  const DraftPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Related to appbar
    String logoPath = 'assets/draft/logo_symbol_draft.png';
    Color appBarBackgroundColor = draftColorSet['primary'] ?? Colors.black;
    // const Color.fromARGB(255, 4, 39, 69); // AppBar 배경색
    Color appBarIconColor = draftColorSet['textSecondary'] ?? Colors.white;
    // const Color.fromARGB(255, 209, 203, 203); // AppBar 아이콘 색상
    double screenWidth = MediaQuery.of(context).size.width; // 화면너비

    return Scaffold(
      backgroundColor: draftColorSet['background'],
      drawer: CommonDrawer(pageKey: 'draft'),
      appBar: CommonAppBar(
        logoPath: logoPath,
        backgroundColor: appBarBackgroundColor, // AppBar 배경색
        iconColor: appBarIconColor,
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 40),
            Text(
              '어떤 것이든 좋습니다. 마음껏 그려보세요!',
              style: draftFontSet['heading']!
                  .copyWith(color: draftColorSet['textSecondary']),
              textAlign: TextAlign.center, // 텍스트 중앙 정렬
            ),
            // textAlign: TextAlign.center,
            const SizedBox(height: 40),
            CardButton(
              title: 'draft solutions and services',
              tacticPath: 'assets/draft/logo_draft_transparentBG.png',
              onPressed: () => Navigator.pushNamed(context, '/dusty'),
              shape: CardShape.roundedRectangle,
              textStyle: boutiqueFontSet['body']!.copyWith(
                  color: ordinaryColorSet['textPrimary']), // fontStyle을 전달
              pageKey: 'draft',
            ),
            const SizedBox(height: 40),
            UrlButton(
              label: 'My Creative Canvas - 웹브라우저 버전',
              onPressed: () => launchURL(
                'https://theplaceyoung.github.io/my-creative-canvas/',
                context,
              ),
              colorSet: draftColorSet,
              fontFamily: 'draftFont',
              fontSize: FontSizeOptions.medium,
              textcolor: exoticColorSet['accent'],
            ),
            const SizedBox(height: 40),
            UrlButton(
              label: 'Touch Pad Version (Coming Soon)',
              onPressed: () => launchURL(
                'https://theplaceyoung.github.io/pwa-webapp-canvas/',
                context,
              ),
              colorSet: draftColorSet,
              fontFamily: 'draftFont',
              fontSize: FontSizeOptions.medium,
              textcolor: exoticColorSet['accent'],
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
