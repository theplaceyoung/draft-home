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

// const Map<String, Color> lightModeOrdinaryColorSet = {
//   'primaryColor': Color(0xFFF8F5F1),
//   'secondaryColor': Color(0xFFD89CB0),
//   'accentColor': Color(0xFFE6C46E),
//   'backgroundColor': Color(0xFFFFFBF7),
//   'textPrimaryColor': Color(0xFF1A1A1A),
//   'textSecondaryColor': Color(0xFF6A6A6A),
// };
const Map<String, Color> lightModeOrdinaryColorSet = {
  'primaryColor': Color(0xFFFFF8F2),
  'secondaryColor': Color(0xFFD89CB0),
  'accentColor': Color(0xFFE6C46E),
  'backgroundColor': Color(0xFFFFFBF7),
  'textPrimaryColor': Color(0xFF1A1A1A),
  'textSecondaryColor': Color(0xFF6A6A6A),
};

const Map<String, Color> darkModeOrdinaryColorSet = {
  'primaryColor': Color(0xFFE7C3CF),
  'secondaryColor': Color(0xFFD89CB0),
  'accentColor': Color(0xFFE6C46E),
  'backgroundColor': Color(0xFF090909),
  'textPrimaryColor': Colors.white,
  'textSecondaryColor': Color(0xFFB7B7B7),
};
// const Map<String, Color> darkModeOrdinaryColorSet = {
//   'primaryColor': Color(0xFFE7C3CF),
//   'secondaryColor': Color(0xFFD89CB0),
//   'accentColor': Color(0xFFE6C46E),
//   'backgroundColor': Color(0xFF090909),
//   'textPrimaryColor': Colors.white,
//   'textSecondaryColor': Color(0xFFB7B7B7),
// };

final Map<String, Color> lightModeExoticColorSet = {
  'primaryColor': Color(0xFFD8C2BC),
  'secondaryColor': Color(0xFFEDE7E2),
  'accentColor': Color(0xFFDDBB6A),
  'backgroundColor': Color(0xFFF9F8F6),
  'textPrimaryColor': Color(0xFF222222),
  'textSecondaryColor': Color(0xFF8D857F),
};

final Map<String, Color> darkModeExoticColorSet = {
  'primaryColor': Color(0xFF4A3D3A),
  'secondaryColor': Color(0xFF2F2A28),
  'accentColor': Color(0xFFDDBB6A),
  'backgroundColor': Color(0xFF181716),
  'textPrimaryColor': Color(0xFFF5F1EC),
  'textSecondaryColor': Color(0xFFB7AEA7),
};

final Map<String, Color> lightModeBoutiqueColorSet = {
  'primaryColor': Color(0xFFB18E84),
  'secondaryColor': Color(0xFFD8C2BC),
  'accentColor': Color(0xFFDDBB6A),
  'backgroundColor': Color(0xFFF5F0EC),
  'textPrimaryColor': Colors.white,
  'textSecondaryColor': Color(0xFFE7DDD7),
};

final Map<String, Color> darkModeBoutiqueColorSet = {
  'primaryColor': Color(0xFF6B514B),
  'secondaryColor': Color(0xFF403532),
  'accentColor': Color(0xFFDDBB6A),
  'backgroundColor': Color(0xFF141313),
  'textPrimaryColor': Color(0xFFF5F1EC),
  'textSecondaryColor': Color(0xFFC3B5AE),
};

// //old2
// final Map<String, Color> lightModeExoticColorSet = {
//   'primaryColor': Color(0xFFA87478), // Dusty Rose
//   'secondaryColor': Color(0xFFDCCAC3), // Rose Beige
//   'accentColor': Color(0xFFDDBB6A), // Champagne Gold

//   'backgroundColor': Color(0xFFF9F8F6), // Warm Ivory

//   'textPrimaryColor': Color(0xFF222222),
//   'textSecondaryColor': Color(0xFF8D857F)
// };

// final Map<String, Color> darkModeExoticColorSet = {
//   'primaryColor': Color(0xFF7D5A5D), // Dried Rose
//   'secondaryColor': Color(0xFF5A4547), // Deep Rose Brown
//   'accentColor': Color(0xFFDDBB6A), // Champagne Gold

//   'backgroundColor': Color(0xFF1B1A1A), // Soft Black

//   'textPrimaryColor': Color(0xFFF6F1EC),
//   'textSecondaryColor': Color(0xFFC8BBB4),
// };

// final Map<String, Color> lightModeBoutiqueColorSet = {
//   'primaryColor': Color(0xFF7C5D53),      // Bronze Brown
//   'secondaryColor': Color(0xFFB59C90),    // Stone Beige
//   'accentColor': Color(0xFFDDBB6A),       // Champagne Gold

//   'backgroundColor': Color(0xFFF6F2ED),

//   'textPrimaryColor': Colors.white,
//   'textSecondaryColor': Color(0xFFE7D8CF),
// };

// final Map<String, Color> darkModeBoutiqueColorSet = {
//   'primaryColor': Color(0xFF4D3C37),      // Deep Bronze
//   'secondaryColor': Color(0xFF312926),    // Dark Stone

//   'accentColor': Color(0xFFDDBB6A),

//   'backgroundColor': Color(0xFF151414),

//   'textPrimaryColor': Color(0xFFF3ECE6),
//   'textSecondaryColor': Color(0xFFC4B6AE),
// };

// old

// final Map<String, Color> lightModeExoticColorSet = {
//   'primaryColor': Color(0xFFD8C2BC), // Soft Rose Beige
//   'secondaryColor': Color(0xFFEDE7E2), // Warm Ivory
//   'accentColor': Color(0xFFDDBB6A), // Champagne Gold

//   'backgroundColor': Color(0xFFF9F8F6),

//   'textPrimaryColor': Color(0xFF222222),
//   'textSecondaryColor': Color(0xFF8D857F),
// };
// final Map<String, Color> darkModeExoticColorSet = {
//   'primaryColor': Color(0xFF4A3D3A), // Deep Rose Brown
//   'secondaryColor': Color(0xFF2F2A28), // Charcoal Ivory
//   'accentColor': Color(0xFFDDBB6A), // Champagne Gold

//   'backgroundColor': Color(0xFF181716), // Soft Black

//   'textPrimaryColor': Color(0xFFF5F1EC), // Warm White
//   'textSecondaryColor': Color(0xFFB7AEA7),
// };

// final Map<String, Color> lightModeBoutiqueColorSet = {
//   'primaryColor': Color(0xFFA87478), // Dusty Rose
//   'secondaryColor': Color(0xFFD6B7AE), // Rose Beige
//   'accentColor': Color(0xFFDDBB6A), // Champagne Gold
//   'backgroundColor': Color(0xFFF7F2EE),
//   'textPrimaryColor': Colors.white,
//   'textSecondaryColor': Color(0xFFF2E5DF),
// };

// final Map<String, Color> darkModeBoutiqueColorSet = {
//   'primaryColor': Color(0xFF7D5A5D), // Dusty Rose Night
//   'secondaryColor': Color(0xFF5A4547), // Deep Rose Brown
//   'accentColor': Color(0xFFDDBB6A), // Champagne Gold
//   'backgroundColor': Color(0xFF1C1A1B), // Warm Black
//   'textPrimaryColor': Color(0xFFF6F1EC),
//   'textSecondaryColor': Color(0xFFC8BBB4),
// };
