import 'package:flutter/material.dart';
import 'package:draft_home/themes/color_set.dart';

class FloatingAction extends StatelessWidget {
  final String imagePath;
  final VoidCallback onPressed;
  final String pageKey; // 페이지 키로 색상 가져오기

  const FloatingAction({
    Key? key,
    required this.imagePath,
    required this.onPressed,
    required this.pageKey, // pageKey 추가
    required ThemeMode themeMode,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final colorSet = _getColorSet(pageKey); // 페이지 키로 색상 가져오기

    return FloatingActionButton(
      backgroundColor: colorSet['secondary'], // secondary 색상
      foregroundColor: colorSet['accent'], // 아이콘 색상
      onPressed: onPressed,
      elevation: 8, // 그림자 효과
      child: Image.asset(
        imagePath,
        fit: BoxFit.contain,
      ),
    );
  }

  /// 페이지 키를 기반으로 색상 세트 반환
  Map<String, Color> _getColorSet(String key) {
    switch (key) {
      case 'home':
        return lightModeHomeColorSet;
      case 'draft':
        return lightModeDraftColorSet;
      case 'dusty':
        return lightModeDustyColorSet;
      case 'ordinary':
        return lightModeOrdinaryColorSet;
      case 'exotic':
        return lightModeExoticColorSet;
      case 'boutique':
        return lightModeBoutiqueColorSet;
      default:
        return lightModeDustyColorSet; // 기본 색상 세트
    }
  }
}
