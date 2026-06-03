import 'package:flutter/material.dart';
import 'package:draft_home/themes/color_set.dart';

enum CardShape {
  rectangle,
  roundedRectangle,
  circle,
}

enum CardRatio {
  square, // 1:1 비율
  sixteenByNine, // 16:9 비율
  sixteenBySix, // 16:6
}

class CardButton extends StatelessWidget {
  final String title;
  final String tacticPath;
  final VoidCallback onPressed;
  final CardShape shape;
  final TextStyle textStyle; // TextStyle을 직접 받음
  final String pageKey; // 색상 및 폰트를 가져오기 위한 키
  final CardRatio ratio; // 카드 비율 추가

  const CardButton({
    required this.title,
    required this.tacticPath,
    required this.onPressed,
    this.shape = CardShape.rectangle,
    required this.textStyle, // textStyle을 직접 받음
    required this.pageKey,
    this.ratio = CardRatio.square, // 기본값은 정사각형
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
      child: Card(
        shape: _getShape(),
        clipBehavior: Clip.antiAlias,
        elevation: 4,
        color: colorSet['primaryColor'],
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            AspectRatio(
              aspectRatio: _getAspectRatio(ratio),
              child: Image.asset(
                tacticPath,
                fit: BoxFit.cover,
                width: double.infinity,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 28),
              child: Text(
                title,
                style: textStyle.copyWith(
                  color: colorSet['textPrimaryColor'],
                ),
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

  /// 카드 비율에 맞는 aspect ratio 반환
  double _getAspectRatio(CardRatio ratio) {
    switch (ratio) {
      case CardRatio.sixteenBySix:
        return 16 / 6; // 16: 7
      case CardRatio.sixteenByNine:
        return 16 / 9; // 16:9 비율
      case CardRatio.square:
      default:
        return 1; // 정사각형 비율 (1:1)
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
        return isDark ? darkModeDraftColorSet : lightModeDraftColorSet;
    }
  }
}
