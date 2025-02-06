import 'package:draft_home/l10n/app_localization.dart';
import 'package:draft_home/provider/localization_provider.dart';
import 'package:draft_home/settings/settings_controller.dart';
import 'package:draft_home/themes/dart_theme.dart';
import 'package:draft_home/themes/light_theme.dart';
import 'package:draft_home/url_launcher/url_launcher.dart';
import 'package:draft_home/themes/color_set.dart';
import 'package:draft_home/utils/floating_action.dart';
import 'package:draft_home/utils/font_map.dart';
import 'package:draft_home/utils/url_utils.dart';
import 'package:draft_home/widgets/app_bar.dart';
import 'package:draft_home/widgets/common_drawer.dart';
import 'package:draft_home/widgets/email_input.dart';
import 'package:draft_home/widgets/footer.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class OrdinaryPage extends StatelessWidget {
  const OrdinaryPage({super.key});

  final Map<String, Color> ordinaryColorSet = lightModeOrdinaryColorSet;

  @override
  Widget build(BuildContext context) {
    String pageKey = 'ordinary';

    // Ensure settingsController is available if it's from a provider
    final settingsController = Provider.of<SettingsController>(context);

    final ordinaryColorSet = settingsController.themeMode == ThemeMode.dark
        ? darkModeOrdinaryColorSet
        : lightModeOrdinaryColorSet;

    Color appBarBackgroundColor =
        ordinaryColorSet['primaryColor'] ?? Colors.black;
    Color appBarIconColor =
        ordinaryColorSet['textSecondaryColor'] ?? Colors.white;

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

    // Get the screen width
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: ordinaryColorSet['backgroundColor'],
      drawer: CommonDrawer(pageKey: 'ordinary'),
      appBar: CommonAppBar(
        backgroundColor: appBarBackgroundColor,
        iconColor: appBarIconColor,
        actions: [
          IconButton(
            icon: Icon(
              Icons.language,
              color: appBarIconColor,
            ),
            onPressed: () => toggleLanguage(context),
          ),
        ],
        pageKey: 'ordinary',
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(top: 0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 40),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Text(
                appLocalizations?.ordinaryPageMessage1 ?? 'Fallback message',
                style: getFontStyle(
                        fontSet: 'OrdinaryFont', styleType: 'heading')
                    .copyWith(color: lightModeOrdinaryColorSet['accentColor']),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(height: 60),
            Image.asset('assets/ordinary/symbol_about_us.png',
                width: screenWidth * 0.5),
            SizedBox(height: 100),
            Text(
              appLocalizations?.ordinaryPageMessage2 ?? 'Fallback message',
              style: getFontStyle(fontSet: 'OrdinaryFont', styleType: 'heading')
                  .copyWith(color: ordinaryColorSet['accentColor']),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 40),
            Text(
              appLocalizations?.ordinaryPageMessage3 ?? 'Fallback message',
              style: getFontStyle(fontSet: 'OrdinaryFont', styleType: 'heading')
                  .copyWith(color: ordinaryColorSet['accentColor']),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 60),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {
                    launchInstagram();
                  },
                  child: Image.asset(
                    'assets/instagram_icon.png',
                    width: 40,
                  ),
                ),
                SizedBox(width: 10),
                GestureDetector(
                  onTap: () {
                    launchInstagram();
                  },
                  child: Text(
                    '@exoticordinary_official',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: lightModeOrdinaryColorSet['textSecondaryColor'],
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 80),
            Image.asset('assets/ordinary/about_us.png',
                width: screenWidth * 0.89),
            SizedBox(height: 40),
            Text(
              '#Creative-Hashtags',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.normal,
                color: const Color.fromARGB(255, 145, 79, 79),
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20),
            Text(
              appLocalizations?.ordinaryPageMessage4 ?? 'Fallback message',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.normal,
                color: const Color.fromARGB(255, 119, 61, 61),
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 80),
            SizedBox(height: 60),
            Card(
              elevation: 0,
              color: Colors.transparent,
              child: Image.asset(
                'assets/ordinary/OL_setup_detail_page.png',
                width: screenWidth * 1,
              ),
            ),
            EmailInputWidget(
              colorSet: ordinaryColorSet,
            ),
            const SizedBox(height: 50),
          ],
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
}
