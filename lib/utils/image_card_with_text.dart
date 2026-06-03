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

class ImageCardWithText extends StatelessWidget {
  final String title;
  final String imageCardPath;
  final CardShape shape;
  final TextStyle textStyle; // TextStyle을 직접 받음
  final String pageKey;
  final CardRatio ratio; // 색상 및 폰트를 가져오기 위한 키

  const ImageCardWithText({
    required this.title,
    required this.imageCardPath,
    required this.textStyle, // textStyle을 직접 받음
    required this.pageKey,
    this.shape = CardShape.rectangle,
    this.ratio = CardRatio.sixteenByNine,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final colorSet = _getColorSet(pageKey); // 색상 세트 가져오기

    return Card(
      shape: _getShape(), // 모양 설정
      clipBehavior: Clip.antiAlias, // 모양 외부 클리핑
      elevation: 0, // 그림자 없애기
      color: colorSet['primary'], // 카드 배경색
      child: Stack(
        children: [
          // 이미지
          AspectRatio(
            aspectRatio: _getAspectRatio(ratio),
            child: Image.asset(
              imageCardPath,
              fit: BoxFit.cover,
              height: shape == CardShape.circle ? 300 : 300, // 높이 설정
              width: double.infinity,
            ),
          ),
          // 텍스트 위에 올려놓기
          Positioned.fill(
            child: Align(
              alignment: Alignment.center,
              child: Text(
                title,
                style: textStyle.copyWith(
                  color: colorSet['textPrimary'], // 전달받은 textStyle에 색상 추가
                  backgroundColor: Colors.black.withOpacity(0), // 텍스트 배경 반투명
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ],
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
  Map<String, Color> _getColorSet(String key) {
    switch (key) {
      case 'draft':
        return lightModeDraftColorSet; // lightModeDraftColorSet 반환
      case 'dusty':
        return lightModeDustyColorSet; // lightModeDustyColorSet 반환
      case 'ordinary':
        return lightModeOrdinaryColorSet; // lightModeOrdinaryColorSet 반환
      case 'exotic':
        return lightModeExoticColorSet; // lightModeExoticColorSet 반환
      case 'boutique':
        return lightModeBoutiqueColorSet; // lightModeBoutiqueColorSet 반환
      default:
        return lightModeOrdinaryColorSet; // 기본 색상 세트
    }
  }
}
