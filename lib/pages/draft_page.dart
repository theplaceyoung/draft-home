import 'package:draft_home/utils/url_utils.dart';
import 'package:draft_home/widgets/app_bar.dart';
import 'package:draft_home/widgets/drawer.dart';
import 'package:flutter/material.dart';
import '../widgets/footer.dart';

class DraftPage extends StatelessWidget {
  const DraftPage({super.key});

  @override
  Widget build(BuildContext context) {
    String logoPath = 'assets/logo_symbol_draft.png';

    return Scaffold(
      drawer: CommonDrawer(),
      appBar: CommonAppBar(
        logoPath: logoPath,
      ),
      // drawer: const CommonDrawer(),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/background_1.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 10),
              Text(
                '어떤 것이든 좋습니다. 마음껏 그려보세요!',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.normal,
                  color: const Color.fromARGB(255, 61, 67, 119),
                ),
                textAlign: TextAlign.center, // 텍스트 중앙 정렬
              ),
              SizedBox(height: 40),
              Image.asset('assets/logo_draft_transparentBG.png', height: 150),
              SizedBox(height: 40),
              Text(
                'Draw your drafts!',
                style: TextStyle(
                    fontSize: 60,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
              SizedBox(height: 40),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () => launchURL(
                        'https://theplaceyoung.github.io/my_creative_canvas/',
                        context),
                    style: ElevatedButton.styleFrom(
                      padding:
                          EdgeInsets.symmetric(vertical: 16, horizontal: 40),
                      textStyle: TextStyle(fontSize: 18),
                      backgroundColor: Colors.black, // 버튼 배경색
                      foregroundColor: Colors.white, // 텍스트 컬러
                    ),
                    child: Text('For web browser'),
                  ),
                  SizedBox(width: 5),
                  ElevatedButton(
                    onPressed: () => launchURL(
                        'https://theplaceyoung.github.io/pwa-webapp-canvas/',
                        context),
                    style: ElevatedButton.styleFrom(
                      padding:
                          EdgeInsets.symmetric(vertical: 16, horizontal: 40),
                      textStyle: TextStyle(fontSize: 18),
                      backgroundColor: Colors.black, // 버튼 배경색
                      foregroundColor: Colors.white, // 텍스트 컬러
                    ),
                    child: Text('My Creative Canvas - 웹브라우저 버전'),
                  ),
                  // Text('For touchpad (iPad, Galaxy Tab)', style: TextStyle(fontSize: 24)),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () => launchURL(
                        'https://theplaceyoung.github.io/pwa-webapp-canvas/',
                        context),
                    style: ElevatedButton.styleFrom(
                      padding:
                          EdgeInsets.symmetric(vertical: 16, horizontal: 40),
                      textStyle: TextStyle(fontSize: 18),
                      backgroundColor: Colors.black, // 버튼 배경색
                      foregroundColor:
                          const Color.fromARGB(255, 90, 88, 88), // 텍스트 컬러
                    ),
                    child: Text(
                        'My Creative Canvas - touch pad version (comming soon)'),
                  ),
                ],
              ),
              // Text('Draw your drafts!', style: TextStyle(fontSize: 24)),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
      bottomNavigationBar: buildFooter(context),
    );
  }

  // Future<void> _launchURL(String url, BuildContext context) async {
  //   final uri = Uri.parse(url);

  //   try {
  //     if (!await launchUrl(uri, mode: LaunchMode.platformDefault)) {
  //       if (kDebugMode) {
  //         debugPrint('링크를 열 수 없습니다: $uri');
  //       }
  //     }
  //   } catch (e) {
  //     if (kDebugMode) {
  //       debugPrint('예상치 못한 오류가 발생했습니다: $uri');
  //     }
  //   }
  // }
}
