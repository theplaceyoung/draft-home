import 'package:draft_home/l10n/app_localization.dart';
import 'package:draft_home/provider/localization_provider.dart';
import 'package:draft_home/settings/settings_controller.dart';
import 'package:draft_home/themes/color_set.dart';
import 'package:draft_home/themes/dart_theme.dart';
import 'package:draft_home/themes/light_theme.dart';
import 'package:draft_home/utils/floating_action.dart';
import 'package:draft_home/utils/font_map.dart';
import 'package:draft_home/utils/url_button.dart';
import 'package:draft_home/utils/url_utils.dart';
import 'package:draft_home/widgets/app_bar.dart';
import 'package:draft_home/widgets/common_drawer.dart';
import 'package:draft_home/widgets/email_input.dart';
import 'package:draft_home/widgets/footer.dart';
import 'package:draft_home/widgets/video_player.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DustyDraftPage extends StatelessWidget {
  const DustyDraftPage({super.key});

  @override
  Widget build(BuildContext context) {
    final pageKey = 'dusty';
    final localizationProvider = Provider.of<LocalizationProvider>(context);

    // 테마 설정
    final settingsController = Provider.of<SettingsController>(context);
    final dustyColorSet = settingsController.themeMode == ThemeMode.dark
        ? darkModeDustyColorSet
        : lightModeDustyColorSet;

    _getTheme(pageKey, settingsController);
    Localizations.localeOf(context);

    return Scaffold(
      backgroundColor: dustyColorSet['backgroundColor'],
      drawer: CommonDrawer(pageKey: pageKey),
      appBar: _buildAppBar(context, dustyColorSet),
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(top: 0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _buildVideoPlayer(),
            const SizedBox(height: 100),
            _buildTextSection(context, localizationProvider, dustyColorSet),
            const SizedBox(height: 200),
            _buildUrlButton(context, localizationProvider, dustyColorSet),
            const SizedBox(height: 150),
            Image.asset('assets/dusty/logo_dustydraft.png', height: 200),
            const SizedBox(height: 150),
            _buildFooterButton(context, localizationProvider, dustyColorSet),
            const SizedBox(height: 130),
            _buildFooterMessage(context, localizationProvider, dustyColorSet),
            const SizedBox(height: 100),
            EmailInputWidget(colorSet: dustyColorSet),
            const SizedBox(height: 50),
          ],
        ),
      ),
      bottomNavigationBar: buildFooter(context),
      floatingActionButton: FloatingAction(
        imagePath: 'assets/dusty/dusty-agent-white.png',
        onPressed: () => launchURL('https://dustyagent.chat', context),
        pageKey: pageKey,
        themeMode: settingsController.themeMode,
      ),
    );
  }

  // AppBar을 동적으로 생성하는 메서드
  CommonAppBar _buildAppBar(
      BuildContext context, Map<String, Color> dustyColorSet) {
    return CommonAppBar(
      backgroundColor: dustyColorSet['primaryColor']!,
      iconColor: dustyColorSet['textPrimaryColor']!,
      actions: [
        IconButton(
          icon: const Icon(Icons.language),
          onPressed: () => _toggleLanguage(context),
        ),
      ],
      pageKey: 'dusty',
    );
  }

  // 비디오를 로딩하는 FutureBuilder
  Widget _buildVideoPlayer() {
    return FutureBuilder<void>(
      future: _initializeVideoPlayer(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }
        if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        }
        return const VideoPlayerWidget(
          videoUrl: 'assets/videos/7624037-uhd_2160_3840_30fps.mp4',
          isLooping: true,
          autoPlay: true,
        );
      },
    );
  }

  // 언어 전환 로직
  void _toggleLanguage(BuildContext context) {
    final currentLocale = Localizations.localeOf(context);
    final newLocale = currentLocale.languageCode == 'en'
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

  // 테마를 동적으로 반환하는 메서드
  ThemeData _getTheme(String pageKey, SettingsController settingsController) {
    return settingsController.themeMode == ThemeMode.dark
        ? getDarkModeThemeWithColors(pageKey)
        : getLightModeThemeWithColors(pageKey);
  }

  // 텍스트 섹션
  Widget _buildTextSection(
      BuildContext context,
      LocalizationProvider localizationProvider,
      Map<String, Color> dustyColorSet) {
    final appLocalizations = AppLocalization.of(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          _buildLocalizedText(
              appLocalizations?.dustyPageMessage1 ?? 'Fallback message',
              'DustyFontMain',
              dustyColorSet),
          const SizedBox(height: 100),
          _buildLocalizedText(
              appLocalizations?.dustyPageMessage2 ?? 'Fallback message',
              'DustyFontSub',
              dustyColorSet),
        ],
      ),
    );
  }

  // 버튼을 포함하는 URL 섹션
  Widget _buildUrlButton(
      BuildContext context,
      LocalizationProvider localizationProvider,
      Map<String, Color> dustyColorSet) {
    final appLocalizations = AppLocalization.of(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        children: [
          UrlButton(
            label: appLocalizations?.dustyButtonMessage1 ?? 'Fallback message',
            onPressed: () => launchURL('https://www.dustydraft.com', context),
            colorSet: dustyColorSet,
            fontFamily: 'DustyFontMain',
            fontSize: FontSizeOptions.medium,
            textcolor: dustyColorSet['accentColor']!,
          ),
          const SizedBox(height: 100),
          _buildLocalizedText(
              appLocalizations?.dustyPageMessage3 ?? 'Fallback message',
              'DustyFontSub',
              dustyColorSet),
        ],
      ),
    );
  }

  // PDF 버튼 추가
  Widget _buildFooterButton(
      BuildContext context,
      LocalizationProvider localizationProvider,
      Map<String, Color> dustyColorSet) {
    final appLocalizations = AppLocalization.of(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: UrlButton(
        label: appLocalizations?.dustyButtonMessage2 ?? 'Fallback message',
        onPressed: () => launchURL(
            'https://github.com/theplaceyoung/draft_co/blob/main/assets/DRAFT_dustydraft_service-description_24.pdf',
            context),
        colorSet: dustyColorSet,
        fontFamily: 'DustyFontMain',
        fontSize: FontSizeOptions.medium,
        textcolor: dustyColorSet['accentColor']!,
      ),
    );
  }

  // 텍스트를 로컬라이징하여 반환
  Widget _buildLocalizedText(
      String message, String font, Map<String, Color> dustyColorSet) {
    return Text(
      message,
      style: getFontStyle(fontSet: font, styleType: 'heading')
          .copyWith(color: dustyColorSet['textSecondaryColor']),
      textAlign: TextAlign.center,
    );
  }

  // 마지막 메시지 섹션
  Widget _buildFooterMessage(
      BuildContext context,
      LocalizationProvider localizationProvider,
      Map<String, Color> dustyColorSet) {
    final appLocalizations = AppLocalization.of(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Text(
        appLocalizations?.dustyPageMessage4 ?? 'Fallback message',
        style: getFontStyle(fontSet: 'DustyFontMain', styleType: 'heading')
            .copyWith(color: dustyColorSet['textSecondaryColor']),
        textAlign: TextAlign.center,
      ),
    );
  }

  // 비디오 초기화 함수
  Future<void> _initializeVideoPlayer() async {
    await Future.delayed(const Duration(seconds: 1)); // 더미 대기 시간
  }
}
