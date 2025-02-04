import 'package:draft_home/l10n/app_localization.dart';
import 'package:draft_home/provider/localization_provider.dart';
import 'package:draft_home/settings/settings_controller.dart';
import 'package:draft_home/themes/color_set.dart';
import 'package:draft_home/themes/dart_theme.dart';
import 'package:draft_home/themes/light_theme.dart';
import 'package:draft_home/utils/card_button.dart';
import 'package:draft_home/utils/floating_action.dart';
import 'package:draft_home/utils/font_map.dart';
import 'package:draft_home/utils/url_button.dart';
import 'package:draft_home/utils/url_utils.dart';
import 'package:draft_home/widgets/app_bar.dart';
import 'package:draft_home/widgets/common_drawer.dart';
import 'package:draft_home/widgets/footer.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TheExoticBoutiquePage extends StatelessWidget {
  const TheExoticBoutiquePage({super.key});

  @override
  Widget build(BuildContext context) {
    final settingsController = Provider.of<SettingsController>(context);
    final boutiqueColorSet = settingsController.themeMode == ThemeMode.dark
        ? darkModeBoutiqueColorSet
        : lightModeBoutiqueColorSet;

    final appLocalizations = AppLocalization.of(context);
    final appBarBackgroundColor =
        boutiqueColorSet['primaryColor'] ?? Colors.black;
    final appBarIconColor =
        boutiqueColorSet['textSecondaryColor'] ?? Colors.white;
    final currentLocale = Localizations.localeOf(context);

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
      backgroundColor: boutiqueColorSet['backgroundColor'],
      drawer: CommonDrawer(pageKey: 'boutique'),
      appBar: CommonAppBar(
        backgroundColor: appBarBackgroundColor,
        iconColor: appBarIconColor,
        actions: [
          IconButton(
            icon: Icon(Icons.language, color: appBarIconColor),
            onPressed: () => toggleLanguage(context),
          ),
        ],
        pageKey: 'boutique',
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            children: [
              const SizedBox(height: 40),
              Text(
                appLocalizations?.boutiquePageMessage1 ?? 'Fallback message',
                style:
                    getFontStyle(fontSet: 'BoutiqueFont', styleType: 'heading')
                        .copyWith(color: boutiqueColorSet['textSecondary']),
              ),
              const SizedBox(height: 20),
              CardButton(
                title: appLocalizations?.boutiquePageMessage1 ??
                    'Fallback message',
                tacticPath: 'assets/exotic/evotic.png',
                onPressed: () =>
                    launchURL('https://naver.me/GctERDE8', context),
                shape: CardShape.roundedRectangle,
                textStyle: getFontStyle(
                        fontSet: 'BoutiqueFont', styleType: 'body')
                    .copyWith(color: boutiqueColorSet['textSecondaryColor']),
                pageKey: 'boutique',
                ratio: CardRatio.square,
              ),
              const SizedBox(height: 25),
              CardButton(
                title: appLocalizations?.boutiquePageMessage2 ??
                    'Fallback message',
                tacticPath: 'assets/boutique/logo_the_boutique.png',
                onPressed: () =>
                    launchURL('https://naver.me/GctERDE8', context),
                shape: CardShape.roundedRectangle,
                textStyle: getFontStyle(
                        fontSet: 'BoutiqueFont', styleType: 'body')
                    .copyWith(color: boutiqueColorSet['textSecondaryColor']),
                pageKey: 'boutique',
                ratio: CardRatio.sixteenBySix,
              ),
              const SizedBox(height: 40),
              UrlButton(
                label: appLocalizations?.boutiquePageMessage2 ??
                    'Fallback message',
                onPressed: () =>
                    launchURL('https://naver.me/GctERDE8', context),
                colorSet: boutiqueColorSet,
                fontFamily: 'boutiqueFont',
                fontSize: FontSizeOptions.medium,
              ),
              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
      bottomNavigationBar: buildFooter(context),
      floatingActionButton: FloatingAction(
        imagePath: 'assets/dusty/dusty-agent-white.png',
        onPressed: () => launchURL('https://dustyagent.chat', context),
        pageKey: 'boutique',
        themeMode: ThemeMode.light,
      ),
    );
  }

  Widget _buildCardButton(String imagePath, String url, BuildContext context) {
    return CardButton(
      title: '',
      tacticPath: imagePath,
      onPressed: () => launchURL(url, context),
      textStyle: getFontStyle(fontSet: 'BoutiqueFont', styleType: 'body')
          .copyWith(color: lightModeBoutiqueColorSet['textSecondary']),
      pageKey: 'boutique',
    );
  }
}
