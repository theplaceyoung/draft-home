import 'package:draft_home/widgets/common_app_bar.dart';
import 'package:draft_home/widgets/common_drawer.dart';
import 'package:draft_home/widgets/footer.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class TheExoticBoutiquePage extends StatelessWidget {
  const TheExoticBoutiquePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: CommonDrawer(),
      appBar: CommonAppBar(),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/door_image.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 40),
                Text(
                  'Welcome to the Exotic Voutique!',
                  style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
                SizedBox(height: 40),
                Image.asset('assets/logo_the_boutique.png', height: 70),
                SizedBox(height: 40),
                ElevatedButton(
                  onPressed: () => _launchURL('https://naver.me/GctERDE8'),
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(vertical: 16, horizontal: 40),
                    textStyle: TextStyle(fontSize: 18),
                    backgroundColor: const Color.fromARGB(255, 247, 239, 173),
                    foregroundColor: Colors.black,
                  ),
                  child:
                      Text('Visit Offline Shop in Seoul, The Exotic Boutique.'),
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: buildFooter(context),
      backgroundColor: const Color.fromARGB(255, 247, 239, 173),
    );
  }

  Future<void> _launchURL(String url) async {
    final uri = Uri.parse(url);
    try {
      if (!await launchUrl(uri, mode: LaunchMode.platformDefault)) {
        if (kDebugMode) {
          debugPrint('링크를 열 수 없습니다: $uri');
        }
      }
    } catch (e) {
      if (kDebugMode) {
        debugPrint('예상치 못한 오류가 발생했습니다: $uri');
      }
    }
  }
}
