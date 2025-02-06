import 'package:draft_home/l10n/app_localization.dart';
import 'package:draft_home/settings/settings_controller.dart';
import 'package:draft_home/themes/color_set.dart';
import 'package:draft_home/themes/dart_theme.dart';
import 'package:draft_home/themes/light_theme.dart';
import 'package:draft_home/utils/font_map.dart';
import 'package:draft_home/utils/image_card_with_text.dart' as image_card;
import 'package:draft_home/utils/image_card_without_text.dart';
import 'package:draft_home/utils/url_utils.dart';
import 'package:draft_home/widgets/app_bar.dart';
import 'package:draft_home/utils/floating_action.dart';
import 'package:draft_home/utils/url_button.dart';
import 'package:draft_home/widgets/common_drawer.dart';
import 'package:draft_home/provider/localization_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../widgets/footer.dart';
import '../utils/card_button.dart';

class DraftPage extends StatelessWidget {
  DraftPage({super.key});

  final Map<String, Color> draftColorSet = lightModeDraftColorSet;

  @override
  Widget build(BuildContext context) {
    // Ensure settingsController is available if it's from a provider
    final settingsController = Provider.of<SettingsController>(context);

    final draftColorSet = settingsController.themeMode == ThemeMode.dark
        ? darkModeDraftColorSet
        : lightModeDraftColorSet;

    Color appBarBackgroundColor = draftColorSet['primaryColor'] ?? Colors.black;
    Color appBarIconColor = draftColorSet['textPrimaryColor'] ?? Colors.white;

    final appLocalizations = AppLocalization.of(context);

    Locale currentLocale = Localizations.localeOf(context);

    void toggleLanguage(BuildContext context) {
      Locale newLocale = currentLocale.languageCode == 'en'
          ? const Locale('ko')
          : const Locale('en');
      context.read<LocalizationProvider>().changeLocale(newLocale);

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            'Language changed to ${newLocale.languageCode.toUpperCase()}!',
          ),
        ),
      );
    }

    return Scaffold(
      backgroundColor: lightModeDraftColorSet['backgroundColor'],
      drawer: CommonDrawer(pageKey: 'draft'),
      appBar: CommonAppBar(
        backgroundColor: appBarBackgroundColor,
        iconColor: appBarIconColor,
        actions: [
          IconButton(
            icon: Icon(Icons.language, color: appBarIconColor),
            onPressed: () => toggleLanguage(context),
          ),
        ],
        pageKey: 'draft',
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(top: 0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 40),
            Text(
              appLocalizations?.draftPageMessage ?? 'Fallback message',
              style: getFontStyle(
                fontSet: 'DraftFontMain',
                styleType: 'body',
              ).copyWith(color: lightModeDraftColorSet['textSecondaryColor']),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 40),
            ImageCardWithoutText(
              imageCardPath: 'assets/draft/my_creative_canvas_description.png',
              pageKey: 'draft',
            ),
            const SizedBox(height: 40),
            UrlButton(
              label: appLocalizations?.webVersion ?? 'Fallback message',
              onPressed: () => launchURL(
                'https://my-creative-canvas-browser.web.app/',
                context,
              ),
              colorSet: lightModeDraftColorSet,
              fontFamily: 'draftFont',
              fontSize: FontSizeOptions.medium,
              textcolor: lightModeDraftColorSet['accentColor'],
            ),
            const SizedBox(height: 40),
            UrlButton(
              label: appLocalizations?.touchPadVersion ?? 'Fallback message',
              onPressed: () => launchURL(
                'https://theplaceyoung.github.io/pwa-webapp-canvas/',
                context,
              ),
              colorSet: lightModeDraftColorSet,
              fontFamily: 'draftFont',
              fontSize: FontSizeOptions.medium,
              textcolor: lightModeDraftColorSet['accentColor'],
            ),
            const SizedBox(height: 90),
            ImageCardWithoutText(
                imageCardPath: 'assets/draft/goals_and_missions.png',
                pageKey: 'draft'),
            ImageCardWithoutText(
              imageCardPath: 'assets/draft/draft_ecosystem.png',
              pageKey: 'draft',
            ),
            const SizedBox(height: 150),
            Text(
              appLocalizations?.draftSolutions ?? 'Fallback message',
              style: getFontStyle(
                fontSet: 'DraftFontMain',
                styleType: 'body',
              ).copyWith(color: lightModeDraftColorSet['textSecondaryColor']),
              textAlign: TextAlign.center,
            ),
            Image.asset('assets/draft/logo_draft_transparentBG.png',
                height: 100),
            const SizedBox(height: 40),
          ],
        ),
      ),
      bottomNavigationBar: buildFooter(context),
      floatingActionButton: FloatingAction(
        imagePath: 'assets/dusty/dusty-agent-white.png',
        onPressed: () => launchURL('https://dustyagent.chat', context),
        pageKey: 'draft',
        themeMode: ThemeMode.dark,
      ),
    );
  }
}
