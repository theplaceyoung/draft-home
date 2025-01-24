import 'package:flutter/material.dart';

class FontSizeOptions {
  static const double small = 14;
  static const double medium = 18;
  static const double large = 24;
}

final Map<String, TextStyle> draftFontSet = {
  'heading': TextStyle(
    fontSize: FontSizeOptions.large,
    fontWeight: FontWeight.bold,
    fontFamily: 'DraftFont', // 폰트 이름
  ),
  'body': TextStyle(
    fontSize: FontSizeOptions.medium,
    fontFamily: 'DraftFont',
  ),
};

final Map<String, TextStyle> exoticFontSet = {
  'heading': TextStyle(
    fontSize: FontSizeOptions.large,
    fontWeight: FontWeight.bold,
    fontFamily: 'ExoticFont',
  ),
  'body': TextStyle(
    fontSize: FontSizeOptions.medium,
    fontFamily: 'ExoticFont',
  ),
};

final Map<String, TextStyle> boutiqueFontSet = {
  'heading': TextStyle(
    fontSize: FontSizeOptions.large,
    fontWeight: FontWeight.bold,
    fontFamily: 'BoutiqueFont',
  ),
  'body': TextStyle(
    fontSize: FontSizeOptions.medium,
    fontFamily: 'BoutiqueFont',
  ),
};

final Map<String, TextStyle> dustyFontSet = {
  'heading': TextStyle(
    fontSize: FontSizeOptions.large,
    fontWeight: FontWeight.bold,
    fontFamily: 'DustyFont',
  ),
  'body': TextStyle(
    fontSize: FontSizeOptions.medium,
    fontFamily: 'DustyFont',
  ),
};

final Map<String, TextStyle> ordinaryFontSet = {
  'heading': TextStyle(
    fontSize: FontSizeOptions.large,
    fontWeight: FontWeight.bold,
    fontFamily: 'OrdinaryFont',
  ),
  'body': TextStyle(
    fontSize: FontSizeOptions.medium,
    fontFamily: 'OrdinaryFont',
  ),
};
