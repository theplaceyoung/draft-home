import 'package:draft_co/widgets/common_app_bar.dart';
import 'package:draft_co/widgets/common_drawer.dart';
import 'package:draft_co/widgets/footer.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class DustyDraftPage extends StatelessWidget {
  const DustyDraftPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBar(),
      drawer: const CommonDrawer(),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('assets/logo_dustydraft.png', height: 200),
              SizedBox(height: 20),
              Text(
                'Welcome to the Dustydraft Page!',
                style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
              SizedBox(height: 30),
              ElevatedButton(
                onPressed: () => _launchURL('https://www.dustydraft.com'),
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(vertical: 16, horizontal: 40),
                  textStyle: TextStyle(fontSize: 18),
                ),
                child: Text('Visit Dusty Draft'),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: buildFooter(context),
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
