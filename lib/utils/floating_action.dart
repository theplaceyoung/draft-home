import 'package:flutter/material.dart';
import 'package:draft_home/utils/color_map.dart';

class FloatingAction extends StatelessWidget {
  final String imagePath;
  final VoidCallback onPressed;
  final String pageKey; // 페이지 키로 색상 가져오기

  const FloatingAction({
    required this.imagePath,
    required this.onPressed,
    required this.pageKey, // pageKey 추가
    Key? key,
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
      case 'draft':
        return draftColorSet;
      case 'dusty':
        return dustyColorSet;
      case 'ordinary':
        return ordinaryColorSet;
      case 'exotic':
        return exoticColorSet;
      case 'boutique':
        return boutiqueColorSet;
      default:
        return ordinaryColorSet; // 기본 색상 세트
    }
  }
}
