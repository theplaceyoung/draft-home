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
              SizedBox(height: 10),
              Text(
                '컴퓨터 프로그래밍 및 AGI(인공일반지능) 서비스 컨설팅',
                style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
              SizedBox(height: 15),
              Image.asset('assets/logo_dustydraft.png', height: 200),
              SizedBox(height: 15),
              Text(
                '당신의 오래된 초안을 꺼내세요. 지금이 바로 실현할 때입니다!',
                style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
              SizedBox(height: 60),
              ElevatedButton(
                onPressed: () => _launchURL('https://www.dustydraft.com'),
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(vertical: 16, horizontal: 40),
                  textStyle: TextStyle(fontSize: 18),
                ),
                child: Text('웹사이트 바로가기'),
              ),
              SizedBox(height: 10),
              ElevatedButton(
                onPressed: () {
                  // 브라우저에서 에셋 PDF 열기
                  const pdfPath =
                      'assets/DRAFT_dustydraft_service-description_24.pdf';
                  // 웹에서는 파일을 직접 열거나 다운로드하지 않고 브라우저로 전달
                  openPDF(pdfPath);
                },
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(vertical: 16, horizontal: 40),
                  textStyle: TextStyle(fontSize: 18),
                ),
                child: Text('소개자료 다운받기'),
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

  void openPDF(String assetPath) async {
    try {
      // 현재 웹의 베이스 경로와 에셋 경로를 결합
      final pdfUrl = Uri.base.resolve(assetPath).toString();
      if (!await launchUrl(Uri.parse(pdfUrl))) {
        if (kDebugMode) {
          debugPrint('PDF를 열 수 없습니다: $pdfUrl');
        }
      }
    } catch (e) {
      if (kDebugMode) {
        debugPrint('PDF 열기 중 오류 발생: $e');
      }
    }
  }
}
