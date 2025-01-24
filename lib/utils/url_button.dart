import 'package:flutter/material.dart';

class UrlButton extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;
  final Map<String, Color> colorSet; // 전달받은 색상 세트
  final String fontFamily; // 전달받은 폰트 패밀리 이름
  final double fontSize; // 전달받은 폰트 크기

  const UrlButton({
    required this.label,
    required this.onPressed,
    required this.colorSet,
    required this.fontFamily,
    required this.fontSize,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: colorSet['accent'], // secondary 색상
        foregroundColor: colorSet['primary'], // 텍스트 색상
        shadowColor: colorSet['primary']?.withOpacity(0.5), // 그림자 색상
        elevation: 6, // 그림자 효과 높이
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8), // 둥근 모서리
        ),
      ),
      child: Text(
        label,
        style: TextStyle(
          fontSize: fontSize, // 폰트 크기
          fontFamily: fontFamily, // 폰트 패밀리 이름
          color: colorSet['textPrimary'], // 텍스트 색상
        ),
      ),
    );
  }
}
