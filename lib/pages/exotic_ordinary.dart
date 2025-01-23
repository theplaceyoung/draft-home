import 'package:draft_home/utils/url_utils.dart';
import 'package:draft_home/widgets/app_bar.dart';
import 'package:draft_home/widgets/drawer.dart';
import 'package:draft_home/widgets/footer.dart';
import 'package:flutter/material.dart';

class ExoticOrdinaryPage extends StatelessWidget {
  const ExoticOrdinaryPage({super.key});

  @override
  Widget build(BuildContext context) {
    String logoPath = 'assets/exotic-48x48.png';
    Color appBarBackgroundColor = Colors.white.withOpacity(0.25); // AppBar 배경색
    Color appBarIconColor = Colors.white; // AppBar 아이콘 색상

    return Scaffold(
      drawer: CommonDrawer(),
      appBar: CommonAppBar(
        logoPath: logoPath,
        backgroundColor: appBarBackgroundColor, // AppBar 배경색
        iconColor: appBarIconColor,
      ),
      // drawer: const CommonDrawer(),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // 첫 번째 버튼 크게
              ElevatedButton(
                onPressed: () => launchURL(
                    'https://smartstore.naver.com/exoticordinary', context),
                style: ElevatedButton.styleFrom(
                  padding:
                      const EdgeInsets.symmetric(vertical: 16, horizontal: 40),
                  textStyle: const TextStyle(fontSize: 18),
                  backgroundColor: Colors.black, // 버튼 배경색
                  foregroundColor: Colors.white, // 텍스트 컬러
                ),
                child: const Text('Purchase at Exotic Ordinary'),
              ),
              const SizedBox(height: 20),

              // 두 개의 작은 버튼
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () => launchURL(
                        'https://www.instagram.com/exoticordinary_official/',
                        context),
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 20),
                      backgroundColor: Colors.black, // 버튼 배경색
                      foregroundColor: Colors.white, // 텍스트 컬러
                    ),
                    child: const Text('Follow us'),
                  ),
                  const SizedBox(width: 10),
                  ElevatedButton(
                    onPressed: () => launchURL(
                        'https://www.youtube.com/@exoticordinary', context),
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 20),
                      backgroundColor: Colors.black, // 버튼 배경색
                      foregroundColor: Colors.white, // 텍스트 컬러
                    ),
                    child: const Text('Subscribe us'),
                  ),
                ],
              ),
              const SizedBox(height: 40),

              // 로고
              GestureDetector(
                onTap: () => launchURL(
                    'https://smartstore.naver.com/exoticordinary', context),
                child: Image.asset(
                  'assets/logo_exoticordinary.png',
                  height: 220,
                ),
              ),
              const SizedBox(height: 40),

              // Welcome 메시지
              ElevatedButton(
                onPressed: () => launchURL(
                    'https://www.instagram.com/exoticordinary_official/',
                    context),
                style: ElevatedButton.styleFrom(
                  padding:
                      const EdgeInsets.symmetric(vertical: 16, horizontal: 40),
                  textStyle: const TextStyle(fontSize: 13),
                  backgroundColor: Colors.black, // 버튼 배경색
                  foregroundColor: Colors.white, // 텍스트 컬러
                ),
                child: const Text('Beauty in the mirror, Smiling back at you.'),
              ),
              const SizedBox(height: 20),
              // const Text(
              //   'Beauty in the mirror, Smiling back at you.',
              //   style: TextStyle(
              //     fontSize: 14,
              //     fontWeight: FontWeight.bold,
              //     color: Colors.white,
              //   ),
              //   textAlign: TextAlign.center,
              // ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: buildFooter(context),
      backgroundColor: Colors.black,
    );
  }

  // Future<void> _launchURL(String url, BuildContext context) async {
  //   try {
  //     final uri = Uri.parse(url);

  //     if (await canLaunchUrl(uri)) {
  //       await launchUrl(uri);
  //     } else {
  //       await _showError(context, '링크를 열 수 없습니다.');
  //     }
  //   } catch (e) {
  //     await _showError(context, '예상치 못한 오류가 발생했습니다.');
  //   }
  // }

  // Future<void> _showError(BuildContext context, String message) async {
  //   ScaffoldMessenger.of(context).showSnackBar(
  //     SnackBar(content: Text(message)),
  //   );
  // }
}
