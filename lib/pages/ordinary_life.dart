import 'package:draft_home/constants/urls.dart';
import 'package:draft_home/provider/localization_provider.dart';
import 'package:draft_home/settings/settings_controller.dart';
import 'package:draft_home/themes/color_set.dart';
import 'package:draft_home/utils/floating_action.dart';
import 'package:draft_home/utils/url_utils.dart';
import 'package:draft_home/widgets/app_bar.dart';
import 'package:draft_home/widgets/common_drawer.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class OrdinaryLifePage extends StatelessWidget {
  const OrdinaryLifePage({super.key});

  @override
  Widget build(BuildContext context) {
    final pageKey = _getPageKey(context);
    final localizationProvider = Provider.of<LocalizationProvider>(context);
    final isDark = Theme.of(context).brightness == Brightness.dark;

    final colors =
        isDark ? darkModeOrdinaryColorSet : lightModeOrdinaryColorSet;
    return Scaffold(
      backgroundColor: colors['backgroundColor'],
      endDrawer: CommonDrawer(pageKey: pageKey),
      appBar: CommonAppBar(
        // actions: [
        //   _buildLanguageSwitchButton(localizationProvider, context),
        // ],
        pageKey: pageKey,
      ),
      body: _buildBody(context, colors),
      floatingActionButton: _buildFloatingActionButton(pageKey, context),
    );
  }

  String _getPageKey(BuildContext context) {
    final currentRoute = ModalRoute.of(context)?.settings.name ?? '/';
    return currentRoute.substring(1); // '/draft' -> 'draft'
  }

  Widget _buildBody(BuildContext context, Map<String, Color> colors) {
    return Center(
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 800),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 80),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'ORDINARY LIFE',
                style: TextStyle(
                  fontSize: 42,
                  fontWeight: FontWeight.bold,
                  color: colors['secondaryColor'],
                ),
              ),
              const SizedBox(height: 12),
              Text(
                'Ordinary to Extraordinary.',
                style: TextStyle(
                  fontSize: 18,
                  fontStyle: FontStyle.italic,
                  color: colors['accentColor'],
                ),
              ),
              const SizedBox(height: 48),
              Text(
                'A lifestyle focused on confidence,\n'
                'self-expression and meaningful experiences.',
                style: TextStyle(
                  fontSize: 18,
                  height: 1.8,
                  color: colors['textPrimaryColor'],
                ),
              ),
              const SizedBox(height: 80),
              InkWell(
                onTap: () {
                  launchURL(
                    'https://www.instagram.com/exoticordinary_official/',
                    context,
                  );
                },
                child: Text(
                  'Instagram',
                  style: TextStyle(
                    fontSize: 18,
                    decoration: TextDecoration.underline,
                    color: colors['accentColor'],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  FloatingAction _buildFloatingActionButton(
    String pageKey,
    BuildContext context,
  ) {
    final themeMode = Provider.of<SettingsController>(context).themeMode;

    return FloatingAction(
      imagePath: 'assets/dusty/dusty-agent-white.png',
      onPressed:
          () => launchURL('https://dusty-agent.github.io/dustie/', context),
      themeMode: themeMode,
    );
  }
}
