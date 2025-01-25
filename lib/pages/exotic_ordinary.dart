import 'package:draft_home/url_launcher/url_launcher.dart';
import 'package:draft_home/utils/card_button.dart';
import 'package:draft_home/utils/color_map.dart';
import 'package:draft_home/utils/floating_action.dart';
import 'package:draft_home/utils/font_map.dart';
import 'package:draft_home/widgets/app_bar.dart';
import 'package:draft_home/widgets/common_drawer.dart';
import 'package:draft_home/widgets/email_input.dart';
import 'package:draft_home/widgets/footer.dart';
import 'package:flutter/material.dart';
import 'package:draft_home/utils/url_utils.dart';
import 'package:draft_home/utils/url_button.dart';

class ExoticOrdinaryPage extends StatelessWidget {
  const ExoticOrdinaryPage({super.key});

  @override
  Widget build(BuildContext context) {
    String logoPath = 'assets/exotic/exotic-48x48.png';
    Color? appBarBackgroundColor =
        exoticColorSet['secondary']; // Color.fromARGB(255, 119, 61, 61);
    Color appBarIconColor = Colors.white;

    return Scaffold(
      backgroundColor: exoticColorSet['background'],
      drawer: CommonDrawer(pageKey: 'exotic'),
      appBar: CommonAppBar(
        logoPath: logoPath,
        backgroundColor: appBarBackgroundColor ??
            Color.fromARGB(255, 119, 61, 61), // AppBar 배경색
        iconColor: appBarIconColor,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 50), // 상단 영역을 내려줌
          child: Column(
            children: [
              // 첫번째 버튼
              SizedBox(
                width: double.infinity, // column 내 가로 확장
                child: CardButton(
                  tacticPath: 'assets/exotic/logo_exoticordinary.png',
                  title: 'See and Purchase at Exotic Ordinary',
                  onPressed: () => launchURL(
                      'https://smartstore.naver.com/exoticordinary', context),
                  shape: CardShape.roundedRectangle,
                  textStyle: boutiqueFontSet['body']!.copyWith(
                      color: exoticColorSet['textSecondary']), // fontStyle을 전달
                  pageKey: 'exotic',
                ),
              ),
              SizedBox(height: 20),
              // 두번째 버튼인데 Row..
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Flexible(
                    child: UrlButton(
                      label: 'Visit our Instagram, Follow us.',
                      onPressed: () => launchInstagram(),
                      colorSet: exoticColorSet,
                      fontFamily: 'exoticFont',
                      fontSize: FontSizeOptions.medium,
                      textcolor: exoticColorSet['textPrimary'],
                    ),
                  ),
                  const SizedBox(width: 10),
                  Flexible(
                    child: UrlButton(
                      label: 'Visit our smartstore, Follow us.',
                      onPressed: () => launchURL(
                        'https://www.exoticordinary.com',
                        context,
                      ),
                      colorSet: exoticColorSet,
                      fontFamily: 'exoticFont',
                      fontSize: FontSizeOptions.medium,
                      textcolor: exoticColorSet['textPrimary'],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              // 세 번째 버튼
              Padding(
                padding: const EdgeInsets.all(16.0), // 원하는 마진 값 (예: 16.0)
                child: SizedBox(
                  width: double.infinity,
                  child: UrlButton(
                    label: 'Visit Exotic Webpage',
                    onPressed: () => launchURL(
                      'https://www.exoticordinary.com',
                      context,
                    ),
                    colorSet: exoticColorSet,
                    fontFamily: 'exoticFont',
                    fontSize: FontSizeOptions.medium,
                    textcolor: exoticColorSet['textPrimary'],
                  ),
                ),
              ),
              const SizedBox(height: 20),
              SizedBox(
                width: double.infinity,
                child: CardButton(
                  tacticPath: 'assets/exotic/logo_exoticordinary.png',
                  title: 'Meet us at the Exotic Shop',
                  onPressed: () => launchURL(
                      'https://smartstore.naver.com/exoticordinary', context),
                  shape: CardShape.roundedRectangle,
                  textStyle: boutiqueFontSet['body']!.copyWith(
                      color: exoticColorSet['textSecondary']), // fontStyle을 전달
                  pageKey: 'exotic',
                ),
              ),
              const SizedBox(height: 20),

              Text(
                'Beauty in the mirror, Smiling back at you.',
                style: exoticFontSet['heading']!
                    .copyWith(color: exoticColorSet['accent']),
                textAlign: TextAlign.center, // 텍스트 중앙 정렬
              ),
              const SizedBox(height: 50),
              EmailInputWidget(colorSet: exoticColorSet),
              const SizedBox(height: 50),
            ],
          ),
        ),
      ),
      bottomNavigationBar: buildFooter(context),
      floatingActionButton: FloatingAction(
        imagePath: 'assets/dusty/dusty-agent-white.png', // 다른 이미지 경로
        onPressed: () => launchURL('https://www.dustydraft.chat', context),
        pageKey: 'exotic', // 페이지 키 전달
      ),
    );
  }
}

// import 'package:draft_home/utils/color_map.dart';
// import 'package:draft_home/utils/card_button.dart';
// import 'package:draft_home/utils/url_button.dart';
// import 'package:draft_home/utils/url_utils.dart';
// import 'package:draft_home/widgets/app_bar.dart';
// import 'package:draft_home/widgets/common_drawer.dart';
// import 'package:draft_home/widgets/footer.dart';
// import 'package:flutter/material.dart';

// class ExoticOrdinaryPage extends StatelessWidget {
//   const ExoticOrdinaryPage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final colors = exoticColorSet;

//     String logoPath = 'assets/exotic-48x48.png';
//     Color appBarBackgroundColor = Color.fromARGB(255, 119, 61, 61);
//     Color appBarIconColor = Colors.white;

//     return Scaffold(
//       drawer: CommonDrawer(pageKey: 'exotic'),
//       appBar: CommonAppBar(
//         logoPath: logoPath,
//         backgroundColor: appBarBackgroundColor,
//         iconColor: appBarIconColor,
//       ),
//       body: LayoutBuilder(
//         builder: (context, constraints) {
//           // 화면 너비가 600px 미만이면 버튼들을 세로로 배치
//           if (constraints.maxWidth < 600) {
//             return SingleChildScrollView(
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   // 첫 번째 버튼 크게
//                   UrlButton(
//                     label: 'Purchase at Exotic Ordinary',
//                     color: colors['secondary']!,
//                     onPressed: () => launchURL(
//                       'https://smartstore.naver.com/exoticordinary',
//                       context,
//                     ),
//                     colorSet: {},
//                   ),
//                   // const SizedBox(height: 20),

//                   // 두 개의 작은 버튼 세로로 배치
//                   Column(
//                     children: [
//                       UrlButton(
//                         label: 'Follow us',
//                         color: colors['secondary']!,
//                         onPressed: () => launchURL(
//                           'https://www.instagram.com/exoticordinary_official/',
//                           context,
//                         ),
//                         colorSet: {},
//                       ),
//                       const SizedBox(height: 10),
//                       UrlButton(
//                         label: 'Subscribe us',
//                         color: colors['secondary']!,
//                         onPressed: () => launchURL(
//                           'https://www.youtube.com/@exoticordinary',
//                           context,
//                         ),
//                         colorSet: {},
//                       ),
//                     ],
//                   ),
//                   // const SizedBox(height: 40),

//                   // 로고
//                   CardButton(
//                     tacticPath: 'assets/logo_exoticordinary.png',
//                     title: 'draft solutions and services',
//                     onPressed: () => launchURL(
//                       'https://smartstore.naver.com/exoticordinary',
//                       context,
//                     ),
//                   ),
//                   // const SizedBox(height: 40),

//                   // Welcome 메시지
//                   ElevatedButton(
//                     onPressed: () => launchURL(
//                         'https://www.instagram.com/exoticordinary_official/',
//                         context),
//                     style: ElevatedButton.styleFrom(
//                       padding: const EdgeInsets.symmetric(
//                           vertical: 16, horizontal: 40),
//                       textStyle: const TextStyle(fontSize: 13),
//                       backgroundColor: Colors.black,
//                       foregroundColor: Colors.white,
//                     ),
//                     child: const Text(
//                         'Beauty in the mirror, Smiling back at you.'),
//                   ),
//                   // const SizedBox(height: 20),
//                 ],
//               ),
//             );
//           } else {
//             // 화면 너비가 600px 이상이면 버튼들을 가로로 배치
//             return SingleChildScrollView(
//               scrollDirection: Axis.horizontal,
//               child: Row(
//                 children: [
//                   // 첫 번째 버튼 크게
//                   UrlButton(
//                     label: 'Purchase at Exotic Ordinary',
//                     color: colors['secondary']!,
//                     onPressed: () => launchURL(
//                       'https://smartstore.naver.com/exoticordinary',
//                       context,
//                     ),
//                     colorSet: {},
//                   ),
//                   const SizedBox(width: 20),

//                   // 두 개의 작은 버튼 가로로 배치
//                   Row(
//                     children: [
//                       UrlButton(
//                         label: 'Follow us',
//                         color: colors['secondary']!,
//                         onPressed: () => launchURL(
//                           'https://www.instagram.com/exoticordinary_official/',
//                           context,
//                         ),
//                         colorSet: {},
//                       ),
//                       const SizedBox(width: 10),
//                       UrlButton(
//                         label: 'Subscribe us',
//                         color: colors['secondary']!,
//                         onPressed: () => launchURL(
//                           'https://www.youtube.com/@exoticordinary',
//                           context,
//                         ),
//                         colorSet: {},
//                       ),
//                     ],
//                   ),
//                   // const SizedBox(width: 40),

//                   // 로고
//                   CardButton(
//                     tacticPath: 'assets/logo_exoticordinary.png',
//                     title: 'draft solutions and services',
//                     onPressed: () => launchURL(
//                       'https://smartstore.naver.com/exoticordinary',
//                       context,
//                     ),
//                   ),
//                   // const SizedBox(width: 40),

//                   // Welcome 메시지
//                   ElevatedButton(
//                     onPressed: () => launchURL(
//                         'https://www.instagram.com/exoticordinary_official/',
//                         context),
//                     style: ElevatedButton.styleFrom(
//                       padding: const EdgeInsets.symmetric(
//                           vertical: 16, horizontal: 40),
//                       textStyle: const TextStyle(fontSize: 13),
//                       backgroundColor: Colors.black,
//                       foregroundColor: Colors.white,
//                     ),
//                     child: const Text(
//                         'Beauty in the mirror, Smiling back at you.'),
//                   ),
//                   // const SizedBox(height: 20),
//                 ],
//               ),
//             );
//           }
//         },
//       ),
//       bottomNavigationBar: buildFooter(context),
//       floatingActionButton: FloatingActionButton(
//         onPressed: () => launchURL('https://www.dustyagent.chat', context),
//         child: Image.asset('assets/dusty-agent-white.png'),
//         backgroundColor: appBarBackgroundColor,
//       ),
//     );
//   }
// }
