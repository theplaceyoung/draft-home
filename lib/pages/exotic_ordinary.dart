import 'package:draft_home/widgets/common_app_bar.dart';
import 'package:draft_home/widgets/common_drawer.dart';
import 'package:draft_home/widgets/footer.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ExoticOrdinaryPage extends StatelessWidget {
  const ExoticOrdinaryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: CommonDrawer(),
      appBar: CommonAppBar(),
      // drawer: const CommonDrawer(),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // 첫 번째 버튼 크게
              ElevatedButton(
                onPressed: () => _launchURL(
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
                    onPressed: () => _launchURL(
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
                    onPressed: () => _launchURL(
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
                onTap: () => _launchURL(
                    'https://smartstore.naver.com/exoticordinary', context),
                child: Image.asset(
                  'assets/logo_exoticordinary.png',
                  height: 200,
                ),
              ),
              const SizedBox(height: 40),

              // Welcome 메시지
              const Text(
                'Beauty in the mirror, Smiling back at you.',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: buildFooter(context),
      backgroundColor: Colors.black,
    );
  }

  Future<void> _launchURL(String url, BuildContext context) async {
    try {
      final uri = Uri.parse(url);

      if (await canLaunchUrl(uri)) {
        await launchUrl(uri);
      } else {
        await _showError(context, '링크를 열 수 없습니다.');
      }
    } catch (e) {
      await _showError(context, '예상치 못한 오류가 발생했습니다.');
    }
  }

  Future<void> _showError(BuildContext context, String message) async {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message)),
    );
  }
}
