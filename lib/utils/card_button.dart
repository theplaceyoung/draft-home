import 'package:flutter/material.dart';
import 'package:draft_home/utils/color_map.dart';

enum CardShape {
  rectangle,
  roundedRectangle,
  circle,
}

class CardButton extends StatelessWidget {
  final String title;
  final String tacticPath;
  final VoidCallback onPressed;
  final CardShape shape;
  final TextStyle textStyle; // TextStyle을 직접 받음
  final String pageKey; // 색상 및 폰트를 가져오기 위한 키

  const CardButton({
    required this.title,
    required this.tacticPath,
    required this.onPressed,
    this.shape = CardShape.rectangle,
    required this.textStyle, // textStyle을 직접 받음
    required this.pageKey,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final colorSet = _getColorSet(pageKey); // 색상 세트 가져오기

    return GestureDetector(
      onTap: onPressed,
      child: Card(
        shape: _getShape(), // 모양 설정
        clipBehavior: Clip.antiAlias, // 모양 외부 클리핑
        elevation: 4, // 그림자 효과
        color: colorSet['primary'], // 카드 배경색
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // 이미지
            Image.asset(
              tacticPath,
              fit: BoxFit.cover,
              height: shape == CardShape.circle ? 300 : 300, // 높이 설정
              width: double.infinity,
            ),
            // 텍스트
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                title,
                style: textStyle.copyWith(
                    color: colorSet['textPrimary']), // 전달받은 textStyle에 색상 추가
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// 카드의 모양 설정 함수
  ShapeBorder _getShape() {
    switch (shape) {
      case CardShape.roundedRectangle:
        return RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.0),
        );
      case CardShape.circle:
        return const CircleBorder();
      case CardShape.rectangle:
      default:
        return const RoundedRectangleBorder(
          borderRadius: BorderRadius.zero,
        );
    }
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
