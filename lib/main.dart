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
import 'package:draft_home/utils/floating_action.dart';
import 'package:draft_home/widgets/featured_media_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'package:draft_home/l10n/app_localization.dart';
import 'package:draft_home/provider/localization_provider.dart';
import 'package:draft_home/settings/settings_controller.dart';
import 'package:draft_home/settings/settings_service.dart';
import 'package:draft_home/utils/url_utils.dart';
import 'package:draft_home/widgets/common_drawer.dart';
import 'package:draft_home/widgets/app_bar.dart';
import 'package:draft_home/widgets/footer.dart';
import 'package:draft_home/pages/old/draft_page.dart';
import 'package:draft_home/pages/dusty_draft.dart';
import 'package:draft_home/pages/exotic_ordinary.dart';
import 'package:draft_home/pages/the_exotic_boutique.dart';

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

    final localizationProvider = Provider.of<LocalizationProvider>(context);

    return Scaffold(
      endDrawer: CommonDrawer(
        pageKey: pageKey,
      ),
      appBar: CommonAppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        actions: [
          _buildLanguageSwitchButton(
            localizationProvider,
            context,
          ),
        ],
        pageKey: pageKey,
      ),
      body: _buildBody(context),
      floatingActionButton: _buildFloatingActionButton(
        pageKey,
        context,
      ),
    );
  }

  String _getPageKey(
    BuildContext context,
  ) {
    final currentRoute = ModalRoute.of(context)?.settings.name ?? '/';

    if (currentRoute == '/') {
      return homePageKey;
    }

    return currentRoute.substring(1);
  }

  IconButton _buildLanguageSwitchButton(
    LocalizationProvider provider,
    BuildContext context,
  ) {
    return IconButton(
      icon: const Icon(
        Icons.language,
      ),
      onPressed: () {
        provider.toggleLanguage();

        debugPrint(
          '현재 언어: ${provider.locale.languageCode}',
        );

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

  Widget _buildBody(
    BuildContext context,
  ) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildHero(context),
          _sectionDivider(),
          _buildBrandSection(context),
          _sectionDivider(),
          _buildNowBuildingSection(context),
          _sectionDivider(),
          _buildMediaSection(context),
          _sectionDivider(),
          _buildContactCTA(context),
          buildFooter(context),
        ],
      ),
    );
  }

  Widget _sectionDivider() {
    return const Divider(
      height: 1,
      thickness: 0.8,
      color: Color(0xFFD8CEC4),
    );
  }

  Widget _buildHero(
    BuildContext context,
  ) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    final primaryColor = isDark ? Colors.white : const Color(0xFF211A16);

    final secondaryColor = isDark ? Colors.white70 : const Color(0xFF745C4A);

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.fromLTRB(
        32,
        72,
        32,
        72,
      ),
      decoration: BoxDecoration(
        color: isDark ? const Color(0xFF171412) : const Color(0xFFF3E7DB),
      ),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(
            maxWidth: 1100,
          ),
          child: SizedBox(
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'DRAFT House',
                  style: TextStyle(
                    fontSize: 44,
                    fontWeight: FontWeight.bold,
                    letterSpacing: -1.2,
                    color: primaryColor,
                  ),
                ),
                const SizedBox(height: 16),
                Text(
                  'Independent Technology & Creative Studio',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    color: primaryColor,
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  'Technology · Brands · Media · Independent Products',
                  style: TextStyle(
                    fontSize: 14,
                    fontStyle: FontStyle.italic,
                    color: secondaryColor,
                  ),
                ),
                const SizedBox(height: 34),
                Text(
                  'Less repetition.\n'
                  'More room to create.',
                  style: TextStyle(
                    fontSize: 30,
                    height: 1.35,
                    fontWeight: FontWeight.w600,
                    color: primaryColor,
                  ),
                ),
                const SizedBox(height: 20),
                Text(
                  '반복되는 문제를 구조화하고,\n'
                  '기술과 콘텐츠를 실제 제품과 브랜드로 발전시킵니다.',
                  style: TextStyle(
                    fontSize: 17,
                    height: 1.75,
                    color: primaryColor,
                  ),
                ),
                const SizedBox(height: 16),
                Text(
                  'Founded in Seoul, 2019',
                  style: TextStyle(
                    fontSize: 14,
                    color: secondaryColor,
                  ),
                ),
                const SizedBox(height: 34),
                Wrap(
                  spacing: 12,
                  runSpacing: 12,
                  children: [
                    _primaryButton(
                      context,
                      'Explore DRAFT',
                      () {
                        Navigator.pushNamed(
                          context,
                          '/about',
                        );
                      },
                    ),
                    _secondaryButton(
                      context,
                      'Work With Us',
                      () {
                        launchURL(
                          'mailto:soyoung@draft.best',
                          context,
                        );
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildBrandSection(
    BuildContext context,
  ) {
    return _sectionContainer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildSectionTitle(
            context,
            'Brands',
            'Independent brands operated by DRAFT House',
            'BRAND ECOSYSTEM',
          ),
          const SizedBox(height: 28),
          LayoutBuilder(
            builder: (
              context,
              constraints,
            ) {
              final isMobile = constraints.maxWidth < 760;

              if (isMobile) {
                return Column(
                  children: [
                    _brandCard(
                      context,
                      title: 'DustyDraft®',
                      description: 'AI, data, automation and digital products.',
                      status: 'Registered Trademark',
                      onTap: () {
                        Navigator.pushNamed(
                          context,
                          '/dusty',
                        );
                      },
                    ),
                    const SizedBox(height: 16),
                    _brandCard(
                      context,
                      title: 'Exotic Ordinary®',
                      description:
                          'Lifestyle, jewelry, music and creative content.',
                      status: 'Registered Trademark',
                      onTap: () {
                        Navigator.pushNamed(
                          context,
                          '/exotic',
                        );
                      },
                    ),
                    const SizedBox(height: 16),
                    _brandCard(
                      context,
                      title: 'ASSETPICKER™',
                      description:
                          'Real estate research and asset intelligence.',
                      status: 'Trademark Pending',
                      onTap: () {
                        Navigator.pushNamed(
                          context,
                          '/assetpicker',
                        );
                      },
                    ),
                    const SizedBox(height: 16),
                    _brandCard(
                      context,
                      title: 'VOUTIQ™',
                      description:
                          'Virtual boutique and digital brand experiences.',
                      status: 'Trademark Pending',
                      onTap: () {
                        launchURL(
                          DraftUrls.voutiqueOfficial,
                          context,
                        );
                      },
                    ),
                  ],
                );
              }

              final cardWidth = (constraints.maxWidth - 54) / 4;

              return Wrap(
                spacing: 18,
                runSpacing: 18,
                children: [
                  SizedBox(
                    width: cardWidth,
                    child: _brandCard(
                      context,
                      title: 'DustyDraft®',
                      description: 'AI, data, automation and digital products.',
                      status: 'Registered Trademark',
                      onTap: () {
                        Navigator.pushNamed(
                          context,
                          '/dusty',
                        );
                      },
                    ),
                  ),
                  SizedBox(
                    width: cardWidth,
                    child: _brandCard(
                      context,
                      title: 'Exotic Ordinary®',
                      description:
                          'Lifestyle, jewelry, music and creative content.',
                      status: 'Registered Trademark',
                      onTap: () {
                        Navigator.pushNamed(
                          context,
                          '/exotic',
                        );
                      },
                    ),
                  ),
                  SizedBox(
                    width: cardWidth,
                    child: _brandCard(
                      context,
                      title: 'ASSETPICKER™',
                      description:
                          'Real estate research and asset intelligence.',
                      status: 'Trademark Pending',
                      onTap: () {
                        Navigator.pushNamed(
                          context,
                          '/assetpicker',
                        );
                      },
                    ),
                  ),
                  SizedBox(
                    width: cardWidth,
                    child: _brandCard(
                      context,
                      title: 'VOUTIQ™',
                      description:
                          'Virtual boutique and digital brand experiences.',
                      status: 'Trademark Pending',
                      onTap: () {
                        launchURL(
                          DraftUrls.voutiqueOfficial,
                          context,
                        );
                      },
                    ),
                  ),
                ],
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _brandCard(
    BuildContext context, {
    required String title,
    required String description,
    required String status,
    required VoidCallback onTap,
  }) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    final primaryColor = isDark ? Colors.white : const Color(0xFF241C18);

    final secondaryColor = isDark ? Colors.white60 : const Color(0xFF75675D);

    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(14),
      child: Container(
        width: double.infinity,
        height: 220,
        padding: const EdgeInsets.all(24),
        decoration: BoxDecoration(
          color: primaryColor.withOpacity(
            isDark ? 0.06 : 0.018,
          ),
          borderRadius: BorderRadius.circular(14),
          border: Border.all(
            color: primaryColor.withOpacity(0.14),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: 19,
                fontWeight: FontWeight.w600,
                color: primaryColor,
              ),
            ),
            const SizedBox(height: 16),
            Text(
              description,
              style: TextStyle(
                fontSize: 14,
                height: 1.55,
                color: secondaryColor,
              ),
            ),
            const Spacer(),
            Text(
              status,
              style: TextStyle(
                fontSize: 12,
                color: secondaryColor,
              ),
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                Text(
                  'Explore',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: primaryColor,
                  ),
                ),
                const SizedBox(width: 6),
                Icon(
                  Icons.arrow_forward,
                  size: 16,
                  color: primaryColor,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildNowBuildingSection(
    BuildContext context,
  ) {
    return _sectionContainer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildSectionTitle(
            context,
            'Now Building',
            'Products and systems currently in development',
            'ACTIVE PRODUCTS',
          ),
          const SizedBox(height: 28),
          _responsiveProjectCards(
            children: [
              _homeProjectCard(
                context,
                title: 'Dustie',
                subtitle: 'AI Decision-Support Workspace',
                description: '문서, 데이터와 분석을 연결하는 '
                    'AI 기반 업무 및 의사결정 지원 공간입니다.',
                icon: Icons.auto_awesome_outlined,
                onTap: () {
                  launchURL(
                    DraftUrls.dustie,
                    context,
                  );
                },
              ),
              _homeProjectCard(
                context,
                title: 'AssetPicker',
                subtitle: 'Asset Intelligence',
                description: '부동산 정책, 시장과 자산 데이터를 '
                    '구조화해 전달하는 리서치 프로젝트입니다.',
                icon: Icons.apartment_outlined,
                onTap: () {
                  Navigator.pushNamed(
                    context,
                    '/assetpicker',
                  );
                },
              ),
              _homeProjectCard(
                context,
                title: 'AP Daily',
                subtitle: 'Automated Real Estate Brief',
                description: '주요 부동산 뉴스를 수집하고 정리해 '
                    '매일 전달하는 자동화 브리핑입니다.',
                icon: Icons.newspaper_outlined,
                onTap: () {
                  launchURL(
                    DraftUrls.assetPicker,
                    context,
                  );
                },
              ),
              _homeProjectCard(
                context,
                title: 'Real Estate Toolkit',
                subtitle: 'Analysis & Decision Tools',
                description: '부동산 투자와 실무 판단을 돕는 '
                    '계산기 및 분석 도구 모음입니다.',
                icon: Icons.calculate_outlined,
                onTap: () {
                  launchURL(
                    '${DraftUrls.dustyDraft}'
                    '/#/workspace/real-estate-toolkit',
                    context,
                  );
                },
              ),
            ],
          ),
          const SizedBox(height: 32),
          _secondaryButton(
            context,
            'Explore DustyDraft',
            () {
              Navigator.pushNamed(
                context,
                '/dusty',
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _homeProjectCard(
    BuildContext context, {
    required String title,
    required String subtitle,
    required String description,
    required IconData icon,
    required VoidCallback onTap,
  }) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    final foregroundColor = isDark ? Colors.white : const Color(0xFF241C18);

    final secondaryColor = isDark ? Colors.white60 : const Color(0xFF755C4A);

    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(14),
      child: Container(
        width: double.infinity,
        height: double.infinity,
        padding: const EdgeInsets.all(26),
        decoration: BoxDecoration(
          color: foregroundColor.withOpacity(
            isDark ? 0.06 : 0.025,
          ),
          borderRadius: BorderRadius.circular(14),
          border: Border.all(
            color: foregroundColor.withOpacity(
              0.13,
            ),
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(
              icon,
              size: 27,
              color: foregroundColor,
            ),
            const SizedBox(height: 22),
            Text(
              title,
              style: TextStyle(
                fontSize: 19,
                fontWeight: FontWeight.w600,
                color: foregroundColor,
              ),
            ),
            const SizedBox(height: 5),
            Text(
              subtitle,
              style: TextStyle(
                fontSize: 13,
                color: secondaryColor,
              ),
            ),
            const SizedBox(height: 14),
            Text(
              description,
              style: TextStyle(
                fontSize: 14,
                height: 1.65,
                color: secondaryColor,
              ),
            ),
            const Spacer(),
            Icon(
              Icons.arrow_outward,
              size: 19,
              color: foregroundColor,
            ),
          ],
        ),
      ),
    );
  }

  Widget _responsiveProjectCards({
    required List<Widget> children,
  }) {
    return LayoutBuilder(
      builder: (
        context,
        constraints,
      ) {
        final isMobile = constraints.maxWidth < 720;

        final width =
            isMobile ? constraints.maxWidth : (constraints.maxWidth - 24) / 2;

        return Wrap(
          spacing: 24,
          runSpacing: 24,
          children: children
              .map(
                (child) => SizedBox(
                  width: width,
                  height: isMobile ? 250 : 270,
                  child: child,
                ),
              )
              .toList(),
        );
      },
    );
  }

  Widget _buildMediaSection(
    BuildContext context,
  ) {
    return _sectionContainer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildSectionTitle(
            context,
            'Media & Channels',
            'Research, music and visual archives',
            'CONTENT & PUBLISHING',
          ),
          const SizedBox(height: 28),
          _responsiveMediaCards(
            children: [
              _mediaLinkCard(
                context,
                'AssetPicker',
                'Real estate research and daily briefings',
                DraftUrls.assetPickerYouTube,
              ),
              _mediaLinkCard(
                context,
                'DustyDraft Archive',
                'Development, products and project stories',
                DraftUrls.dustyArchive,
              ),
              _mediaLinkCard(
                context,
                'DraftAmbient',
                'Ambient sounds, keyboards and quiet moments',
                DraftUrls.draftAmbient,
              ),
              _mediaLinkCard(
                context,
                'Exotic Lounge',
                'Music for beautiful spaces',
                DraftUrls.exoticLounge,
              ),
            ],
          ),
          const SizedBox(height: 36),
          FeaturedMediaCard(
            title: '', //'Exotic Ordinary — Official Store',
            imagePath: 'assets/exotic/warm_silvlin.png',
            onTap: () {
              launchURL(
                DraftUrls.exoticOfficial,
                context,
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _responsiveMediaCards({
    required List<Widget> children,
  }) {
    return LayoutBuilder(
      builder: (
        context,
        constraints,
      ) {
        final isMobile = constraints.maxWidth < 720;

        final width =
            isMobile ? constraints.maxWidth : (constraints.maxWidth - 24) / 2;

        return Wrap(
          spacing: 24,
          runSpacing: 24,
          children: children
              .map(
                (child) => SizedBox(
                  width: width,
                  child: child,
                ),
              )
              .toList(),
        );
      },
    );
  }

  Widget _mediaLinkCard(
    BuildContext context,
    String title,
    String description,
    String url,
  ) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    final primaryColor = isDark ? Colors.white : const Color(0xFF241C18);

    final secondaryColor = isDark ? Colors.white60 : const Color(0xFF755C4A);

    return InkWell(
      onTap: () {
        launchURL(
          url,
          context,
        );
      },
      borderRadius: BorderRadius.circular(12),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 4,
          vertical: 12,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: primaryColor,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    description,
                    style: TextStyle(
                      fontSize: 14,
                      height: 1.6,
                      color: secondaryColor,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 12),
            Icon(
              Icons.arrow_outward,
              size: 19,
              color: primaryColor,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildContactCTA(
    BuildContext context,
  ) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    final primaryColor = isDark ? Colors.white : const Color(0xFF241C18);

    final secondaryColor = isDark ? Colors.white70 : const Color(0xFF755C4A);

    return _sectionContainer(
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(
          horizontal: 32,
          vertical: 38,
        ),
        decoration: BoxDecoration(
          color: primaryColor.withOpacity(
            isDark ? 0.07 : 0.035,
          ),
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: primaryColor.withOpacity(
              0.16,
            ),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Work With DRAFT',
              style: TextStyle(
                fontSize: 29,
                fontWeight: FontWeight.bold,
                color: primaryColor,
              ),
            ),
            const SizedBox(height: 12),
            Text(
              'AI, 데이터, 자동화, 웹 도구와 독립 제품을 중심으로\n'
              '목적이 분명한 프로젝트를 함께 설계하고 개발합니다.',
              style: TextStyle(
                fontSize: 16,
                height: 1.75,
                color: secondaryColor,
              ),
            ),
            const SizedBox(height: 16),
            Text(
              'Research · Data Structuring · Workflow Automation · '
              'Web Tools · Prototyping',
              style: TextStyle(
                fontSize: 13,
                height: 1.6,
                fontStyle: FontStyle.italic,
                color: secondaryColor,
              ),
            ),
            const SizedBox(height: 28),
            Wrap(
              spacing: 12,
              runSpacing: 12,
              children: [
                _primaryButton(
                  context,
                  'Discuss a Project',
                  () {
                    launchURL(
                      'mailto:soyoung@draft.best',
                      context,
                    );
                  },
                ),
                _secondaryButton(
                  context,
                  'View DustyDraft',
                  () {
                    Navigator.pushNamed(
                      context,
                      '/dusty',
                    );
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _sectionContainer({
    required Widget child,
  }) {
    return Center(
      child: ConstrainedBox(
        constraints: const BoxConstraints(
          maxWidth: 1100,
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 32,
            vertical: 64,
          ),
          child: child,
        ),
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

    return Column(
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
      ],
    );
  }

  Widget _primaryButton(
    BuildContext context,
    String label,
    VoidCallback onPressed,
  ) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return FilledButton.icon(
      onPressed: onPressed,
      icon: const Icon(
        Icons.arrow_forward,
        size: 17,
      ),
      label: Text(label),
      style: FilledButton.styleFrom(
        backgroundColor:
            isDark ? const Color(0xFFF2E6DA) : const Color(0xFF2B211B),
        foregroundColor:
            isDark ? const Color(0xFF2B211B) : const Color(0xFFF7EFE6),
        elevation: 0,
        minimumSize: const Size(160, 50),
        padding: const EdgeInsets.symmetric(
          horizontal: 24,
          vertical: 16,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        textStyle: const TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }

  Widget _secondaryButton(
    BuildContext context,
    String label,
    VoidCallback onPressed,
  ) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    final color = isDark ? const Color(0xFFF2E6DA) : const Color(0xFF2B211B);

    return OutlinedButton(
      onPressed: onPressed,
      style: OutlinedButton.styleFrom(
        foregroundColor: color,
        minimumSize: const Size(160, 50),
        padding: const EdgeInsets.symmetric(
          horizontal: 24,
          vertical: 16,
        ),
        side: BorderSide(
          color: color,
          width: 1.2,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        textStyle: const TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w600,
        ),
      ),
      child: Text(label),
    );
  }

  FloatingAction _buildFloatingActionButton(
    String pageKey,
    BuildContext context,
  ) {
    final themeMode = Provider.of<SettingsController>(
      context,
    ).themeMode;

    return FloatingAction(
      imagePath: 'assets/dusty/dusty-agent-white.png',
      onPressed: () => launchURL(
        DraftUrls.dustyAgent,
        context,
      ),
      themeMode: themeMode,
    );
  }
}
