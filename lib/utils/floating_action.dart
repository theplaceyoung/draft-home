import 'package:flutter/material.dart';

class FloatingAction extends StatelessWidget {
  final String imagePath;
  final VoidCallback onPressed;
  final ThemeMode themeMode;

  const FloatingAction({
    super.key,
    required this.imagePath,
    required this.onPressed,
    required this.themeMode,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = themeMode == ThemeMode.dark;

    return FloatingActionButton(
      backgroundColor: isDark ? Colors.black87 : Colors.grey.shade400,
      elevation: 8,
      child: Image.asset(
        imagePath,
        fit: BoxFit.contain,
      ),
      onPressed: onPressed,
    );
  }
}
