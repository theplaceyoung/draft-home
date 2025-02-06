// lib/utils/page_utils.dart

import 'package:flutter/material.dart';
import 'package:draft_home/themes/color_set.dart';

// 페이지별로 사용하는 pageKey와 logoPath를 정의
const Map<String, String> pageLogos = {
  'home': 'assets/dusty/logo_symbol_draft_grey.png',
  'draft': 'assets/draft/logo_symbol_draft.png',
  'dusty': 'assets/dusty/logo_symbol_draft_grey.png',
  'ordinary': 'assets/dusty/logo_symbol_draft_grey.png',
  'exotic': 'assets/dusty/logo_symbol_draft_grey.png',
  'boutique': 'assets/dusty/logo_symbol_draft_grey.png',
};

// 페이지별 색상 설정 (라이트 모드, 다크 모드)
Map<String, Map<String, Color>> pageColors = {
  'home': lightModeHomeColorSet,
  'draft': lightModeDraftColorSet,
  'dusty': lightModeDustyColorSet,
  'ordinary': lightModeDustyColorSet,
  'exotic': lightModeDustyColorSet,
  'boutique': lightModeDustyColorSet,
};

/// 페이지에 맞는 로고 경로를 가져오는 함수
String getLogoPath(String pageKey) {
  return pageLogos[pageKey] ?? pageLogos['home']!;
}

/// 페이지에 맞는 색상 세트를 가져오는 함수
Map<String, Color> getColorSet(String pageKey, {bool isDarkMode = false}) {
  // 라이트모드 또는 다크모드 색상 세트를 반환
  final colorSet = pageColors[pageKey] ?? lightModeDustyColorSet;
  return isDarkMode ? darkModeDraftColorSet : colorSet;
}
