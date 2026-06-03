import 'package:draft_home/themes/color_set.dart';
import 'package:draft_home/utils/font_map.dart';
import 'package:flutter/material.dart';

ThemeData getLightModeThemeWithColors(String pageKey) {
  Map<String, Color> selectedColors;
  String fontSet;

  switch (pageKey) {
    case 'home':
      selectedColors = lightModeHomeColorSet;
      fontSet = 'HomeFont';
      break;
    case 'draft':
      selectedColors = lightModeDraftColorSet;
      fontSet = 'DraftFont';
      break;
    case 'dusty':
      selectedColors = lightModeDustyColorSet;
      fontSet = 'DustyFont';
      break;
    case 'ordinary':
      selectedColors = lightModeOrdinaryColorSet;
      fontSet = 'OrdinaryFont';
      break;
    case 'exotic':
      selectedColors = lightModeExoticColorSet;
      fontSet = 'ExoticFont';
      break;
    case 'boutique':
      selectedColors = lightModeBoutiqueColorSet;
      fontSet = 'BoutiqueFont';
      break;
    default:
      throw ArgumentError("Invalid pageKey: $pageKey");
  }

  return ThemeData(
    colorScheme: ColorScheme.light(
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
