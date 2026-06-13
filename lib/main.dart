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
import 'package:draft_home/widgets/featured_media_card.dart';
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
  Widget build(
    BuildContext context,
  ) {
    final pageKey = _getPageKey(context);
    final isDark = Theme.of(context).brightness == Brightness.dark;

    final colorSet = isDark ? darkModeExoticColorSet : lightModeExoticColorSet;

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
          _buildMedia(
            context,
          ),
          const Divider(
            height: 1,
            thickness: 0.8,
            color: const Color(0xFFC8C8C8),
          ),
          const SizedBox(height: 10),
          _buildToolSection(context),
          const SizedBox(height: 10),
          const Divider(
            height: 1,
            thickness: 0.8,
            color: const Color(0xFFC8C8C8),
          ),
          const SizedBox(height: 10),
          _buildContactCTA(context),
          const SizedBox(height: 10),
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
            'Explore · Build · Operate',
            style: theme.textTheme.bodyLarge?.copyWith(
              color: theme.colorScheme.onSurface.withOpacity(0.8),
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'Assets, Brands and Digital Products',
            style: theme.textTheme.bodyLarge?.copyWith(
              color: theme.colorScheme.onSurface.withOpacity(0.8),
            ),
          ),
          const SizedBox(height: 4),
          Text(
            'An independent business operating across\nasset intelligence, brand development and digital tools.',
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

  Widget _buildMedia(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildSectionTitle(
          context,
          'Media',
          'Blogs, Video & Publications',
          'MEDIA & STORYTELLING',
        ),
        _buildFeaturedMedia(context),
        const SizedBox(height: 24),
        _buildMediaCarousel(context),
        const SizedBox(height: 32),
      ],
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
                subtitle: 'Intelligence Lab & Product Workspace.',
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
                subtitle: 'Asset intelligence and investment research.',
                status: 'Trademark Pending',
                onTap: () {
                  Navigator.pushNamed(context, '/assetpicker');
                },
              ),
              const SizedBox(width: 24),
              InfoCard(
                title: 'The Exotic Voutique™',
                subtitle: 'Virtual boutique and digital experiences.',
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

  Widget _buildFeaturedMedia(
    BuildContext context,
  ) {
    return Column(
      children: [
        FeaturedMediaCard(
          title: 'Warm Silvlin',
          imagePath: 'assets/exotic/warm_silvlin.png',
          onTap: () {
            launchURL(
              'https://smartstore.naver.com/exoticordinary/shoppingstory/detail?id=5002773191',
              context,
            );
          },
        ),
        const SizedBox(height: 16),
        FeaturedMediaCard(
          title: '',
          imagePath: 'assets/assetpicker/assetpicker-hero.jpg',
          onTap: () {
            launchURL(
              'https://blog.naver.com/assetpicker',
              context,
            );
          },
        ),
        const SizedBox(height: 16),
        FeaturedMediaCard(
          title: '',
          imagePath: 'assets/dusty/dustydraft_banner.png',
          onTap: () {
            launchURL(
              'https://www.youtube.com/@dustydraft',
              context,
            );
          },
        ),
      ],
    );
  }

  Widget _buildMediaCarousel(
    BuildContext context,
  ) {
    return SizedBox(
      height: 160,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          SizedBox(
            width: 220,
            child: _mediaTile(
              'Shop',
              'assets/exotic/exoticordinary_background.jpg',
              () {
                launchURL(
                  DraftUrls.exoticShop,
                  context,
                );
              },
            ),
          ),
          const SizedBox(width: 16),
          SizedBox(
            width: 220,
            child: _mediaTile(
              'Tech Diary',
              'assets/draft/crumpled_paper_1405.jpg',
              () {
                launchURL(
                  DraftUrls.fairyRala,
                  context,
                );
              },
            ),
          ),
          const SizedBox(width: 16),
          SizedBox(
            width: 220,
            child: _mediaTile(
              'YouTube',
              'assets/AdobeStock_228406900.jpeg',
              () {
                launchURL(
                  DraftUrls.exoticArchive,
                  context,
                );
              },
            ),
          ),
          const SizedBox(width: 16),
          SizedBox(
            width: 220,
            child: _mediaTile(
              'Studio',
              'assets/ordinary/background_1.png',
              () {
                launchURL(
                  DraftUrls.exoticStudio,
                  context,
                );
              },
            ),
          ),
          const SizedBox(width: 16),
          SizedBox(
            width: 220,
            child: _mediaTile(
              'Instagram',
              'assets/exotic/exotic-instagram.jpg',
              () {
                launchURL(
                  DraftUrls.exoticInstagram,
                  context,
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildToolSection(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildSectionTitle(
          context,
          'Workspace',
          'Tools You Can Use',
          'PRODUCTS & UTILITIES',
        ),
        SizedBox(
          height: 300,
          child: ListView(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 24),
            children: [
              CardButtonWithTextOverImage(
                title: 'Real Estate Toolkit',
                tacticPath: 'assets/assetpicker/assetpicker-hero.jpg',
                pageKey: 'assetpicker',
                width: 300,
                height: 300,
                textStyle: getFontStyle(
                  fontSet: 'DustyFont',
                  styleType: 'cardTitle',
                ),
                onPressed: () {
                  launchURL(
                    'https://www.dustydraft.com/workspace/real-estate-toolkit',
                    context,
                  );
                },
              ),
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
        const SizedBox(height: 24),
      ],
    );
  }

  Widget _buildContactCTA(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(24, 40, 24, 40),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'What Do You Need?',
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 12),
          Text(
            'Looking for investment opportunities?\n'
            'Need help evaluating an asset or business?\n'
            'Interested in AI tools or digital products?\n'
            'Or simply exploring a new idea?',
          ),
          const SizedBox(height: 24),
          ElevatedButton(
            onPressed: () {
              launchURL(
                'mailto:soyoung@draft.best',
                context,
              );
            },
            child: const Text(
              'Let\'s Talk',
            ),
          ),
        ],
      ),
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

  Widget _mediaTile(
    String title,
    String imagePath,
    VoidCallback onTap,
  ) {
    return Card(
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: InkWell(
        onTap: onTap,
        child: Stack(
          fit: StackFit.expand,
          children: [
            Image.asset(
              imagePath,
              fit: BoxFit.cover,
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(
                  vertical: 10,
                ),
                color:
                    const Color.fromARGB(255, 211, 191, 191).withOpacity(0.75),
                child: Text(
                  title,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    shadows: [
                      Shadow(
                        color: Colors.black38,
                        blurRadius: 4,
                        offset: Offset(0, 1),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}


  // Widget _buildMediaSection(BuildContext context) {
  //   return Column(
  //     crossAxisAlignment: CrossAxisAlignment.start,
  //     children: [
  //       _buildSectionTitle(
  //         context,
  //         'Media',
  //         'Blogs, Video & Publications',
  //         'MEDIA & STORYTELLING',
  //       ),
  //       SizedBox(
  //         height: 280,
  //         child: ListView(
  //           scrollDirection: Axis.horizontal,
  //           padding: const EdgeInsets.symmetric(horizontal: 24),
  //           children: [
  //             // AssetPicker Blog
  //             SizedBox(
  //               width: 300,
  //               child: MediaCard(
  //                 title: 'AssetPicker Research',
  //                 imagePath: 'assets/assetpicker/assetpicker-hero.jpg',
  //                   fontWeight: FontWeight.bold,
  //                 ),
  //                 onPressed: () {
  //                   launchURL(
  //                     'https://blog.naver.com/assetpicker',
  //                     context,
  //                   );
  //                 },
  //               ),
  //             ),

  //             const SizedBox(width: 10),

  //             // Exotic Archive
  //             SizedBox(
  //               width: 300,
  //               child: MediaCard(
  //                 title: 'Exotic Archive',
  //                 imagePath: 'assets/ordinary/background_1.png',
  //                 onPressed: () {
  //                   launchURL(
  //                     'https://blog.naver.com/assetpick1',
  //                     context,
  //                   );
  //                 },
  //               ),
  //             ),

  //             const SizedBox(width: 10),

  //             // Exotic Ordinary Blog
  //             SizedBox(
  //               width: 300,
  //               child: MediaCard(
  //                 title: 'Warm Silvlin',
  //                 imagePath: 'assets/AdobeStock_228406900.jpeg',
  //                 onPressed: () {
  //                   launchURL(
  //                     'https://smartstore.naver.com/exoticordinary/shoppingstory/detail?id=5002773191',
  //                     context,
  //                   );
  //                 },
  //               ),
  //             ),

  //             const SizedBox(width: 10),

  //             // YouTube
  //             SizedBox(
  //               width: 300,
  //               child: MediaCard(
  //                 title: 'YouTube',
  //                 imagePath: 'assets/exotic/exotic-instagram.jpg',
  //                 onPressed: () {
  //                   launchURL(
  //                     DraftUrls.exoticArchive,
  //                     context,
  //                   );
  //                 },
  //               ),
  //             ),
  //           ],
  //         ),
  //       ),
  //       const SizedBox(height: 40),
  //     ],
  //   );
  // }