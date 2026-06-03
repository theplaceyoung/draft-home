import 'package:flutter/material.dart';
import 'package:draft_home/themes/color_set.dart';

enum CardShape {
  rectangle,
  roundedRectangle,
  circle,
}

class CardButtonWithTextOverImage extends StatelessWidget {
  final String title;
  final String tacticPath;
  final VoidCallback onPressed;
  final CardShape shape;
  final TextStyle textStyle; // TextStyle을 직접 받음
  final String pageKey; // 색상 및 폰트를 가져오기 위한 키

  final double width;
  final double height;

  const CardButtonWithTextOverImage({
    required this.title,
    required this.tacticPath,
    required this.onPressed,
    required this.textStyle,
    required this.pageKey,
    this.width = 360,
    this.height = 300,
    this.shape = CardShape.roundedRectangle,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    final colorSet = _getColorSet(
      pageKey,
      isDark,
    );

    return GestureDetector(
      onTap: onPressed,
      child: SizedBox(
        width: width,
        height: height,
        child: Card(
          shape: _getShape(),
          clipBehavior: Clip.antiAlias,
          elevation: 4,
          color: colorSet['primary'],
          child: Stack(
            children: [
              Positioned.fill(
                child: Image.asset(
                  tacticPath,
                  fit: BoxFit.cover,
                ),
              ),
              Positioned.fill(
                child: Align(
                  alignment: Alignment.center,
                  child: Text(
                    title,
                    style: textStyle.copyWith(
                      color: colorSet['textPrimary'], // 전달받은 textStyle에 색상 추가
                      backgroundColor:
                          Colors.black.withOpacity(0), // 텍스트 배경 반투명
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ],
          ),
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
  Map<String, Color> _getColorSet(
    String key,
    bool isDark,
  ) {
    switch (key) {
      case 'draft':
        return isDark ? darkModeDraftColorSet : lightModeDraftColorSet;
      case 'dusty':
        return isDark ? darkModeDustyColorSet : lightModeDustyColorSet;
      case 'ordinary':
        return isDark ? darkModeOrdinaryColorSet : lightModeOrdinaryColorSet;
      case 'exotic':
        return isDark ? darkModeExoticColorSet : lightModeExoticColorSet;
      case 'boutique':
        return isDark ? darkModeBoutiqueColorSet : lightModeBoutiqueColorSet;
      default:
        return lightModeOrdinaryColorSet; // 기본 색상 세트
    }
  }
}
