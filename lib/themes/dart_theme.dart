// lib/themes/light_theme.dart
import 'package:draft_home/utils/font_map.dart';
import 'package:flutter/material.dart';
import 'color_set.dart';

ThemeData getDarkModeThemeWithColors(String pageKey) {
  Map<String, Color> selectedColors;
  String fontSet;

  switch (pageKey) {
    case 'home':
      selectedColors = darkModeDraftColorSet;
      fontSet = 'HomeFont';
      break;
    case 'draft':
      selectedColors = darkModeDraftColorSet;
      fontSet = 'DraftFont';
      break;
    case 'dusty':
      selectedColors = darkModeDustyColorSet;
      fontSet = 'DustyFont';
      break;
    case 'ordinary':
      selectedColors = darkModeOrdinaryColorSet;
      fontSet = 'OrdinaryFont';
      break;
    case 'exotic':
      selectedColors = darkModeExoticColorSet;
      fontSet = 'ExoticFont';
      break;
    case 'boutique':
      selectedColors = darkModeBoutiqueColorSet;
      fontSet = 'BoutiqueFont';
      break;
    default:
      throw ArgumentError("Invalid pageKey: $pageKey");
  }

  return ThemeData(
    colorScheme: ColorScheme.dark(
      primary: selectedColors['primaryColor']!,
      secondary: selectedColors['secondaryColor']!,
      background: selectedColors['backgroundColor']!,
      surface: selectedColors['backgroundColor']!,
    ),
    textTheme: TextTheme(
      bodyLarge: getFontStyle(fontSet: fontSet, styleType: 'bodyLarge'),
      bodyMedium: getFontStyle(fontSet: fontSet, styleType: 'bodyMedium'),
      headlineSmall: getFontStyle(fontSet: fontSet, styleType: 'heading'),
    ),
    appBarTheme: AppBarTheme(
      backgroundColor: selectedColors['backgroundColor']!,
      foregroundColor: selectedColors['textPrimaryColor'],
    ),
  );
}
