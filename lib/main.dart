import 'package:draft_home/constants/urls.dart';
import 'package:draft_home/pages/about_page.dart';
import 'package:draft_home/pages/asset_lab_page.dart';
import 'package:draft_home/pages/asset_picker_page.dart';
import 'package:draft_home/pages/company_page.dart';
import 'package:draft_home/pages/ordinary_life.dart';
import 'package:draft_home/pages/virtual_boutique_page.dart';
import 'package:draft_home/settings/settings_view.dart';
import 'package:draft_home/themes/dart_theme.dart';
import 'package:draft_home/themes/light_theme.dart';
import 'package:draft_home/themes/color_set.dart';
import 'package:draft_home/utils/card_button.dart';
import 'package:draft_home/utils/card_button_with_text_over_image.dart';
import 'package:draft_home/utils/floating_action.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'package:draft_home/l10n/app_localization.dart';
import 'package:draft_home/provider/localization_provider.dart';
import 'package:draft_home/settings/settings_controller.dart';
import 'package:draft_home/settings/settings_service.dart';
import 'package:draft_home/utils/font_map.dart';
import 'package:draft_home/utils/url_utils.dart';
import 'package:draft_home/widgets/common_drawer.dart';
import 'package:draft_home/widgets/app_bar.dart';
import 'package:draft_home/widgets/footer.dart';
import 'package:draft_home/pages/old/draft_page.dart';
import 'package:draft_home/pages/dusty_draft.dart';
import 'package:draft_home/pages/exotic_ordinary.dart';
import 'package:draft_home/pages/the_exotic_boutique.dart';
import 'package:draft_home/widgets/info_card.dart';

const String homePageKey = 'home';
const String draftPageKey = 'draft';

const String dustyPageKey = 'dusty';
const String ordinaryPageKey = 'ordinary';

const String exoticPageKey = 'exotic';
const String boutiquePageKey = 'boutique';

const String assetPickerPageKey = 'assetpicker';
const String assetLabPageKey = 'assetlab';
void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => _initSettingsController()),
        ChangeNotifierProvider(create: (_) => LocalizationProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

SettingsController _initSettingsController() {
  final settingsController = SettingsController(SettingsService());
  settingsController.loadSettings();
  return settingsController;
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final settingsController = Provider.of<SettingsController>(context);
    final localizationProvider = Provider.of<LocalizationProvider>(context);
    // final pageKey = ModalRoute.of(context)?.settings.name ?? homePageKey;
    const pageKey = homePageKey;
    return MaterialApp(
      themeMode: settingsController.themeMode,
      theme: getLightModeThemeWithColors(pageKey),
      darkTheme: getDarkModeThemeWithColors(pageKey),
      locale: localizationProvider.locale,
      localizationsDelegates: const [
        AppLocalization.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: AppLocalization.supportedLocales,
      // home: const MyHomePage(),
      routes: _getRoutes(),
    );
  }

  Map<String, WidgetBuilder> _getRoutes() {
    return {
      '/': (context) => const MyHomePage(),
      '/company': (context) => CompanyPage(),
      '/draft': (context) => DraftPage(),
      '/about': (context) => AboutPage(),
      '/dusty': (context) => DustyDraftPage(),
      '/ordinary': (context) => OrdinaryLifePage(),
      '/exotic': (context) => ExoticOrdinaryPage(),
      '/boutique': (context) => TheExoticBoutiquePage(),
      '/assetpicker': (context) => AssetPickerPage(),
      '/assetlab': (context) => AssetLabPage(),
      '/virtualBoutique': (context) => VirtualBoutiquePage(),
      '/settings': (context) {
        final settingsController = Provider.of<SettingsController>(context);
        return SettingsView(controller: settingsController);
      },
    };
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final pageKey = _getPageKey(context);

    final localizationProvider = Provider.of<LocalizationProvider>(context);

    return Scaffold(
      endDrawer: CommonDrawer(pageKey: pageKey),
      appBar: CommonAppBar(
        backgroundColor: Colors.white,
        actions: [_buildLanguageSwitchButton(localizationProvider, context)],
        pageKey: pageKey,
      ),
      body: _buildBody(context),
      floatingActionButton: _buildFloatingActionButton(pageKey, context),
    );
  }

  String _getPageKey(BuildContext context) {
    final currentRoute = ModalRoute.of(context)?.settings.name ?? '/';
    return currentRoute.substring(1); // '/draft' -> 'draft'
  }

  IconButton _buildLanguageSwitchButton(
    LocalizationProvider provider,
    BuildContext context,
  ) {
    return IconButton(
      icon: const Icon(Icons.language),
      onPressed: () {
        provider.toggleLanguage();
        debugPrint("현재 언어: ${provider.locale.languageCode}");
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              provider.locale.languageCode == 'en'
                  ? 'Language changed to English!'
                  : '언어가 변경되었습니다!',
            ),
          ),
        );
      },
    );
  }

  // Widget _buildBody(BuildContext context) {
  //   return const Center(
  //     child: Text(
  //       'BODY TEST',
  //       style: TextStyle(
  //         fontSize: 40,
  //         color: Colors.red,
  //       ),
  //     ),
  //   );
  // }
  Widget _buildBody(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildHero(context),
          const Divider(
            height: 1,
            thickness: 0.8,
            color: const Color(0xFFC8C8C8),
          ),
          _buildBrandSection(context),
          const Divider(
            height: 1,
            thickness: 0.8,
            color: const Color(0xFFC8C8C8),
          ),
          _buildMediaSection(context),
          const Divider(
            height: 1,
            thickness: 0.8,
            color: const Color(0xFFC8C8C8),
          ),
          _buildToolSection(context),
          const Divider(
            height: 1,
            thickness: 0.8,
            color: const Color(0xFFC8C8C8),
          ),
          buildFooter(context),
        ],
      ),
    );
  }

  Widget _buildHero(BuildContext context) {
    final theme = Theme.of(context);

    return Padding(
      padding: const EdgeInsets.fromLTRB(24, 32, 24, 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'DRAFT House',
            style: theme.textTheme.headlineMedium?.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'Independent Brands · Contents · Creative Tools',
            style: theme.textTheme.bodyLarge?.copyWith(
              color: theme.colorScheme.onSurface.withOpacity(0.8),
            ),
          ),
          const SizedBox(height: 4),
          Text(
            'An independent ecosystem of projects, stories and digital experiences.',
            style: theme.textTheme.bodyMedium?.copyWith(
              color: theme.colorScheme.onSurface.withOpacity(0.6),
            ),
          ),
          const SizedBox(height: 4),
          Text(
            'Founded in Seoul, 2019',
            style: theme.textTheme.bodyMedium?.copyWith(
              color: theme.colorScheme.onSurface.withOpacity(0.6),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBrandSection(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildSectionTitle(
          context,
          'Brands',
          'Independent Brands(Registered & Emerging)',
          'IDENTITY & OWNERSHIP',
        ),
        SizedBox(
          height: 220,
          child: ListView(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 24),
            children: [
              InfoCard(
                title: 'Dusty Draft®',
                subtitle: 'Projects, experiments and digital products.',
                status: 'Registered Trademark',
                onTap: () {
                  Navigator.pushNamed(context, '/dusty');
                },
              ),
              const SizedBox(width: 24),
              InfoCard(
                title: 'Exotic Ordinary®',
                subtitle: 'Beauty, jewelry and visual storytelling.',
                status: 'Registered Trademark',
                onTap: () {
                  Navigator.pushNamed(context, '/exotic');
                },
              ),
              const SizedBox(width: 24),
              InfoCard(
                title: 'ASSETPICKER™',
                subtitle: 'Research and investing beyond the noise.',
                status: 'Trademark Pending',
                onTap: () {
                  Navigator.pushNamed(context, '/assetpicker');
                },
              ),
              const SizedBox(width: 24),
              InfoCard(
                title: 'The Exotic Voutique™',
                subtitle: 'Curated boutique and digital commerce.',
                status: 'Trademark Pending',
                onTap: () {
                  launchURL(
                    DraftUrls.theExoticVoutique,
                    context,
                  );
                },
              ),
            ],
          ),
        ),
        const SizedBox(height: 32),
      ],
    );
  }

  Widget _buildMediaSection(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildSectionTitle(
          context,
          'Media',
          'Blogs, Video & Publications',
          'MEDIA & STORYTELLING',
        ),
        SizedBox(
          height: 280,
          child: ListView(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 24),
            children: [
              // AssetPicker Blog
              SizedBox(
                width: 300,
                child: CardButton(
                  title: 'AssetPicker Research',
                  tacticPath: 'assets/assetpicker/assetpicker-hero.jpg',
                  pageKey: 'assetpicker',
                  ratio: CardRatio.sixteenByNine,
                  textStyle: const TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                  onPressed: () {
                    launchURL(
                      'https://blog.naver.com/assetpicker',
                      context,
                    );
                  },
                ),
              ),

              const SizedBox(width: 20),

              // Exotic Archive
              SizedBox(
                width: 300,
                child: CardButton(
                  title: 'Exotic Archive',
                  tacticPath: 'assets/ordinary/background_1.png',
                  pageKey: 'exotic',
                  ratio: CardRatio.sixteenByNine,
                  textStyle: getFontStyle(
                    fontSet: 'ExoticFont',
                    styleType: 'cardTitle',
                  ),
                  onPressed: () {
                    launchURL(
                      'https://blog.naver.com/assetpick1',
                      context,
                    );
                  },
                ),
              ),

              const SizedBox(width: 20),

              // Exotic Ordinary Blog
              SizedBox(
                width: 300,
                child: CardButton(
                  title: 'Exotic Ordinary',
                  tacticPath: 'assets/AdobeStock_228406900.jpeg',
                  pageKey: 'exotic',
                  ratio: CardRatio.sixteenByNine,
                  textStyle: getFontStyle(
                    fontSet: 'ExoticFont',
                    styleType: 'cardTitle',
                  ),
                  onPressed: () {
                    launchURL(
                      'https://blog.naver.com/exoticordinary',
                      context,
                    );
                  },
                ),
              ),

              const SizedBox(width: 20),

              // YouTube
              SizedBox(
                width: 300,
                child: CardButton(
                  title: 'YouTube',
                  tacticPath: 'assets/exotic/exotic-instagram.jpg',
                  pageKey: 'exotic',
                  ratio: CardRatio.sixteenByNine,
                  textStyle: getFontStyle(
                    fontSet: 'ExoticFont',
                    styleType: 'cardTitle',
                  ),
                  onPressed: () {
                    launchURL(
                      DraftUrls.exoticArchive,
                      context,
                    );
                  },
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 40),
      ],
    );
  }

  Widget _buildToolSection(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildSectionTitle(
          context,
          'Creative Tools',
          'AI & Creative Utilities',
          'TOOLS FOR THINKING',
        ),
        SizedBox(
          height: 300,
          child: ListView(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 24),
            children: [
              CardButtonWithTextOverImage(
                title: '"Dustie"',
                tacticPath: 'assets/dusty/dusty-agent-white+bg+gd.png',
                pageKey: 'dusty',
                width: 300,
                height: 300,
                textStyle: getFontStyle(
                  fontSet: 'DustyFont',
                  styleType: 'cardTitle',
                ),
                onPressed: () {
                  launchURL(DraftUrls.dustyAgent, context);
                },
              ),
              const SizedBox(width: 24),
              CardButtonWithTextOverImage(
                title: '',
                tacticPath: 'assets/dusty/dusty_painter.png',
                pageKey: 'dusty',
                width: 300,
                height: 300,
                textStyle: getFontStyle(
                  fontSet: 'DustyFont',
                  styleType: 'cardTitle',
                ),
                onPressed: () {
                  launchURL(DraftUrls.painter, context);
                },
              ),
              const SizedBox(width: 24),
              CardButtonWithTextOverImage(
                title: '',
                tacticPath: 'assets/dusty/meemo.png',
                pageKey: 'dusty',
                width: 300,
                height: 300,
                textStyle: getFontStyle(
                  fontSet: 'DustyFont',
                  styleType: 'cardTitle',
                ),
                onPressed: () {
                  launchURL(DraftUrls.meemo, context);
                },
              ),
            ],
          ),
        ),
        const SizedBox(height: 32),
      ],
    );
  }

  Widget _buildSectionTitle(
    BuildContext context,
    String title,
    String subtitle,
    String tagline,
  ) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Padding(
      padding: const EdgeInsets.fromLTRB(24, 32, 24, 6),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.w700,
              color: isDark ? Colors.white : Colors.black87,
            ),
          ),
          const SizedBox(height: 6),
          Text(
            subtitle,
            style: TextStyle(
              fontSize: 14,
              color: isDark ? Colors.white60 : Colors.black54,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            tagline,
            style: TextStyle(
              fontSize: 13,
              fontStyle: FontStyle.italic,
              color: isDark ? Colors.white60 : Colors.black54,
            ),
          ),
          const SizedBox(height: 5),
        ],
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
      onPressed: () =>
          launchURL('https://dusty-agent.github.io/dustie/', context),
      themeMode: themeMode,
    );
  }
}
