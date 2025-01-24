import 'package:flutter/material.dart';

class PdfButton extends StatelessWidget {
  final String label;
  final String pdfUrl;
  final Map<String, Color> colorSet;

  const PdfButton({
    required this.label,
    required this.pdfUrl,
    required this.colorSet,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () async {
        try {
          // PDF 열기 함수 호출
          await openPDF(pdfUrl);
        } catch (e) {
          _showError(context, 'PDF 열기 실패: $e');
        }
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: colorSet['accent'], // secondary 색상
        foregroundColor: colorSet['primary'], // 텍스트 색상 (accent)
        shadowColor: colorSet['primary']!.withValues(), // 그림자
        elevation: 6, // 그림자 효과 높이
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8), // 약간 둥근 버튼
        ),
      ),
      child: Text(
        label,
        style: const TextStyle(fontSize: 16),
      ),
    );
  }

  // PDF를 여는 함수
  Future<void> openPDF(String pdfUrl) async {
    // PDF 파일을 여는 로직 (예: external viewer, 웹뷰, etc.)
    // 여기에 PDF 열기를 위한 로직을 작성하세요.
    print('Opening PDF from $pdfUrl');
    // 예시: flutter_pdfview 또는 다른 패키지를 사용하여 열 수 있음
  }

  // 에러 처리 함수
  void _showError(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message)),
    );
  }
}
