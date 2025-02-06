import 'package:draft_home/l10n/app_localization.dart';
import 'package:draft_home/provider/localization_provider.dart';
import 'package:draft_home/settings/settings_controller.dart';
import 'package:draft_home/utils/card_button.dart' as cardButton;
import 'package:draft_home/themes/color_set.dart';
import 'package:draft_home/utils/card_button_with_text_over_image.dart'
    as cardButtonWithTextOverImage;
import 'package:draft_home/utils/floating_action.dart';
import 'package:draft_home/utils/font_map.dart';
import 'package:draft_home/utils/url_button.dart';
import 'package:draft_home/utils/url_utils.dart';
import 'package:draft_home/widgets/app_bar.dart';
import 'package:draft_home/widgets/common_drawer.dart';
import 'package:draft_home/widgets/email_input.dart';
import 'package:draft_home/widgets/footer.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

class ExoticOrdinaryPage extends StatelessWidget {
  ExoticOrdinaryPage({super.key});

  // 색상 설정 함수
  Map<String, Color> _getExoticColorSet(SettingsController settingsController) {
    return settingsController.themeMode == ThemeMode.dark
        ? darkModeExoticColorSet
        : lightModeExoticColorSet;
  }

  // 언어 전환 함수
  void _toggleLanguage(BuildContext context) {
    final currentLocale = Localizations.localeOf(context);
    Locale newLocale = currentLocale.languageCode == 'en'
        ? const Locale('ko')
        : const Locale('en');
    context.read<LocalizationProvider>().changeLocale(newLocale);

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
            'Language changed to ${newLocale.languageCode.toUpperCase()}!'),
      ),
    );
  }

  // 버튼 컴포넌트 생성
  Widget _buildUrlButton({
    required String label,
    required String url,
    required BuildContext context,
    required Map<String, Color> colorSet,
    String fontFamily = 'exoticFont',
  }) {
    return UrlButton(
      label: label,
      onPressed: () => launchURL(url, context),
      colorSet: colorSet,
      fontFamily: fontFamily,
      fontSize: FontSizeOptions.medium,
      textcolor: colorSet['textPrimaryColor'],
    );
  }

  @override
  Widget build(BuildContext context) {
    final settingsController = Provider.of<SettingsController>(context);
    final exoticColorSet = _getExoticColorSet(settingsController);

    final appLocalizations = AppLocalization.of(context);

    return Scaffold(
      backgroundColor: exoticColorSet['backgroundColor'],
      drawer: CommonDrawer(pageKey: 'exotic'),
      appBar: CommonAppBar(
        backgroundColor: exoticColorSet['primaryColor'] ?? Colors.black,
        iconColor: exoticColorSet['textSecondaryColor'] ?? Colors.white,
        actions: [
          IconButton(
            icon: Icon(Icons.language,
                color: exoticColorSet['textSecondaryColor']),
            onPressed: () => _toggleLanguage(context),
          ),
        ],
        pageKey: 'exotic',
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(top: 50),
        child: Padding(
          padding: const EdgeInsets.only(top: 50),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // 첫 번째 큰 버튼
              cardButtonWithTextOverImage.CardButtonWithTextOverImage(
                title:
                    appLocalizations?.exoticPageMessage1 ?? 'Fallback message',
                tacticPath: 'assets/exotic/exoticordinary_background.jpg',
                onPressed: () => launchURL(
                    'https://smartstore.naver.com/exoticordinary', context),
                textStyle:
                    getFontStyle(fontSet: 'ExoticFont', styleType: 'body')
                        .copyWith(color: exoticColorSet['textSecondaryColor']),
                pageKey: 'exotic',
              ),
              const SizedBox(height: 20),

              // 두 개의 작은 버튼 (Row)
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Flexible(
                      child: UrlButton(
                    label: appLocalizations?.exoticPageMessage2 ??
                        'Fallback message',
                    onPressed: () => launchURL(
                        'https://www.instagram.com/exoticordinary_official/',
                        context),
                    colorSet: lightModeExoticColorSet,
                    fontFamily: 'exoticFont',
                    fontSize: 16.0,
                  )),
                  const SizedBox(width: 10),
                  Flexible(
                      child: UrlButton(
                    label: appLocalizations?.exoticPageMessage3 ??
                        'Fallback message',
                    onPressed: () =>
                        launchURL('https://www.exoticordinary.com/', context),
                    colorSet: lightModeExoticColorSet,
                    fontFamily: 'exoticFont',
                    fontSize: 16.0,
                  )),
                ],
              ),
              const SizedBox(height: 20),

              // 세 번째 버튼
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: UrlButton(
                  label: appLocalizations?.exoticPageMessage4 ??
                      'Fallback message',
                  onPressed: () =>
                      launchURL('https://www.exoticordinary.com/', context),
                  colorSet: lightModeExoticColorSet,
                  fontFamily: 'exoticFont',
                  fontSize: 16.0,
                ),
              ),
              const SizedBox(height: 20),

              // 네 번째 큰 버튼
              cardButton.CardButton(
                title:
                    appLocalizations?.exoticPageMessage5 ?? 'Fallback message',
                tacticPath: 'assets/exotic/logo_exoticordinary.png',
                onPressed: () => launchURL(
                    'https://smartstore.naver.com/exoticordinary', context),
                shape: cardButton.CardShape.roundedRectangle,
                textStyle:
                    getFontStyle(fontSet: 'ExoticFont', styleType: 'body')
                        .copyWith(color: exoticColorSet['textSecondaryColor']),
                pageKey: 'exotic',
                ratio: cardButton.CardRatio.square,
              ),
              const SizedBox(height: 20),

              // 텍스트 메시지
              Text(
                appLocalizations?.exoticPageMessage6 ?? 'Fallback message',
                style: getFontStyle(fontSet: 'ExoticFont', styleType: 'heading')
                    .copyWith(color: exoticColorSet['accentColor']),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 50),

              // 이메일 입력 위젯
              EmailInputWidget(colorSet: exoticColorSet),
              const SizedBox(height: 50),
            ],
          ),
        ),
      ),
      bottomNavigationBar: buildFooter(context),
      floatingActionButton: FloatingAction(
        imagePath: 'assets/dusty/dusty-agent-white.png',
        onPressed: () => launchURL('https://dustyagent.chat', context),
        pageKey: 'exotic',
        themeMode: ThemeMode.light,
      ),
    );
  }
}
