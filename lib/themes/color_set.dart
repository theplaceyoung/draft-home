import 'package:flutter/material.dart';

final Map<String, Color> lightModeHomeColorSet = {
  'primaryColor': Colors.white,
  'secondaryColor': Colors.white,
  'accentColor': Colors.white,
  'backgroundColor': Colors.white,
  'textPrimaryColor': const Color.fromARGB(255, 240, 233, 233),
  'textSecondaryColor': Colors.white,
};

final Map<String, Color> darkModeHomeColorSet = {
  'primaryColor': Colors.black, //다크 그레이, 기본적인 어두운 색
  'secondaryColor': Colors.black, //어두운 청록색
  'accentColor': Colors.black, //따뜻한 노란색/금색
  'backgroundColor': Colors.black, //어두운 배경
  'textPrimaryColor': Colors.black, //흰색 텍스트
  'textSecondaryColor': Colors.black, //밝은 회색
};

final Map<String, Color> lightModeDraftColorSet = {
  'primaryColor': Color.fromARGB(255, 245, 245, 248),
  'secondaryColor': Color.fromARGB(255, 228, 233, 238),
  'accentColor': Color.fromARGB(255, 227, 155, 45),
  'backgroundColor': Color.fromARGB(255, 238, 226, 173),
  'textPrimaryColor': const Color.fromARGB(255, 24, 23, 23),
  'textSecondaryColor': Colors.black,
};

final Map<String, Color> darkModeDraftColorSet = {
  'primaryColor': Color.fromARGB(255, 60, 60, 60), //다크 그레이, 기본적인 어두운 색
  'secondaryColor': Color.fromARGB(255, 40, 60, 80), //어두운 청록색
  'accentColor': Color.fromARGB(255, 200, 150, 60), //따뜻한 노란색/금색
  'backgroundColor': Color.fromARGB(255, 30, 30, 30), //어두운 배경
  'textPrimaryColor': Colors.white, //흰색 텍스트
  'textSecondaryColor': Color.fromARGB(255, 180, 180, 180), //밝은 회색
};

final Map<String, Color> lightModeDustyColorSet = {
  'primaryColor': Color.fromARGB(255, 206, 166, 134), //#A1887F
  'secondaryColor': Color.fromARGB(255, 224, 195, 171), //#CEA686
  'accentColor': Color.fromARGB(255, 235, 228, 205), //#D4Af37
  'backgroundColor': Color.fromARGB(255, 238, 211, 189), //#F0E5DC
  'textPrimaryColor': Colors.black,
  'textSecondaryColor': Color.fromARGB(255, 163, 108, 63) //#F0E5DC
};

final Map<String, Color> darkModeDustyColorSet = {
  'primaryColor': Color.fromARGB(255, 120, 90, 80), //짙은 갈색
  'secondaryColor': Color.fromARGB(255, 150, 100, 70), //붉은 톤의 갈색
  'accentColor': Color.fromARGB(255, 200, 180, 70), //밝은 금색
  'backgroundColor': Color.fromARGB(255, 50, 50, 50), //어두운 회색 배경
  'textPrimaryColor': Colors.white,
  'textSecondaryColor': Color.fromARGB(255, 220, 220, 220) //밝은 회색
};

const Map<String, Color> lightModeOrdinaryColorSet = {
  'primaryColor': Color.fromARGB(255, 200, 200, 200), //밝은 회색, 기본적인 라이트모드용 기본색
  'secondaryColor': Color.fromARGB(255, 250, 100, 160), //밝고 따뜻한 분홍색
  'accentColor': Color.fromARGB(255, 230, 240, 240), //부드러운 회색
  'backgroundColor': Color.fromARGB(255, 12, 12, 12), //배경은 흰색
  'textPrimaryColor': Colors.black, //검은색 텍스트
  'textSecondaryColor': Color.fromARGB(255, 153, 141, 141), //밝은 회색 텍스트
};

const Map<String, Color> darkModeOrdinaryColorSet = {
  'primaryColor': Colors.grey,
  'secondaryColor': Color.fromARGB(255, 212, 85, 170),
  'accentColor': Color.fromARGB(255, 238, 243, 243),
  'backgroundColor': Color.fromARGB(255, 7, 7, 7),
  'textPrimaryColor': Colors.white,
  'textSecondaryColor': Colors.grey,
};

final Map<String, Color> lightModeExoticColorSet = {
  'primaryColor': Color.fromARGB(255, 160, 80, 110), //밝은 자주색
  'secondaryColor': Color.fromARGB(255, 140, 70, 70), //붉은 갈색
  'accentColor': Color.fromARGB(255, 240, 210, 80), //밝은 노란색
  'backgroundColor': Colors.black, //흰색 배경
  'textPrimaryColor': Colors.white, //검은색 텍스트
  'textSecondaryColor': Color.fromARGB(255, 150, 78, 78), //회색 텍스트
};
final Map<String, Color> darkModeExoticColorSet = {
  'primaryColor': Color.fromARGB(255, 167, 88, 122),
  'secondaryColor': Color.fromARGB(255, 141, 80, 80),
  'accentColor': Color.fromARGB(255, 246, 209, 74),
  'backgroundColor': Colors.white,
  'textPrimaryColor': Colors.black,
  'textSecondaryColor': const Color.fromARGB(255, 161, 90, 90),
};

final Map<String, Color> lightModeBoutiqueColorSet = {
  'primaryColor': Color.fromARGB(255, 118, 67, 62),
  'secondaryColor': Color.fromARGB(255, 161, 107, 102),
  'accentColor': Color.fromARGB(255, 151, 134, 132),
  'backgroundColor': Color.fromARGB(255, 199, 176, 174),
  'textPrimaryColor': Color.fromARGB(255, 235, 219, 213),
  'textSecondaryColor': Color.fromARGB(255, 241, 184, 159),
};

final Map<String, Color> darkModeBoutiqueColorSet = {
  'primaryColor': Color.fromARGB(255, 100, 50, 40), //어두운 갈색
  'secondaryColor': Color.fromARGB(255, 140, 85, 75), //중간 톤의 갈색
  'accentColor': Color.fromARGB(255, 150, 120, 110), //붉은 갈색
  'backgroundColor': Color.fromARGB(255, 65, 62, 62), //어두운 회색
  'textPrimaryColor': Colors.white, //흰색 텍스트
  'textSecondaryColor': Color.fromARGB(255, 180, 180, 180), //밝은 회색 텍스트
};
