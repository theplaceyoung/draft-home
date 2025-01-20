import 'package:draft_home/utils/url_utils.dart';
import 'package:draft_home/widgets/app_bar.dart';
import 'package:draft_home/widgets/drawer.dart';
import 'package:draft_home/widgets/footer.dart';
import 'package:flutter/material.dart';

class DustyDraftPage extends StatelessWidget {
  const DustyDraftPage({super.key});
  @override
  Widget build(BuildContext context) {
    String logoPath = 'assets/logo_symbol_draft_grey.png';

    return Scaffold(
      drawer: CommonDrawer(),
      appBar: CommonAppBar(
        logoPath: logoPath,
      ),
      // drawer: const CommonDrawer(),
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
                onPressed: () =>
                    launchURL('https://www.dustydraft.com', context),
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(vertical: 16, horizontal: 40),
                  textStyle: TextStyle(fontSize: 18),
                  backgroundColor: Colors.black, // 버튼 배경색
                  foregroundColor: Colors.white, // 텍스트 컬러
                ),
                child: Text('웹사이트 바로가기'),
              ),
              SizedBox(height: 10),
              ElevatedButton(
                onPressed: () => launchURL(
                    'https://github.com/theplaceyoung/draft_co/blob/main/assets/DRAFT_dustydraft_service-description_24.pdf',
                    context),
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(vertical: 16, horizontal: 40),
                  textStyle: TextStyle(fontSize: 18),
                  backgroundColor: Colors.black, // 버튼 배경색
                  foregroundColor: Colors.white, // 텍스트 컬러
                ),
                child: Text('소개자료 열어보기'),
              ),
              SizedBox(height: 10),
              ElevatedButton(
                onPressed: () async {
                  try {
                    // 브라우저에서 에셋 PDF 열기
                    const pdfPath =
                        'https://raw.githubusercontent.com/theplaceyoung/draft_home/gh-pages/assets/assets/DRAFT_dustydraft_service-description_24.pdf';
                    // 웹에서는 파일을 직접 열거나 다운로드하지 않고 브라우저로 전달
                    await openPDF(pdfPath);
                  } catch (e) {
                    _showError(context, 'PDF 열기 실패: $e');
                  }
                },
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(vertical: 16, horizontal: 40),
                  textStyle: TextStyle(fontSize: 18),
                  backgroundColor: Colors.black, // 버튼 배경색
                  foregroundColor: Colors.white, // 텍스트 컬러
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

  Future<void> _showError(BuildContext context, String message) async {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message)),
    );
  }
}
