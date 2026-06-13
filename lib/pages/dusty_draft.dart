import 'package:draft_home/constants/urls.dart';
import 'package:draft_home/settings/settings_controller.dart';
import 'package:draft_home/themes/color_set.dart';
import 'package:draft_home/utils/floating_action.dart';
import 'package:draft_home/utils/url_utils.dart';
import 'package:draft_home/widgets/app_bar.dart';
import 'package:draft_home/widgets/common_drawer.dart';
import 'package:draft_home/widgets/footer.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DustyDraftPage extends StatelessWidget {
  const DustyDraftPage({super.key});

  @override
  Widget build(BuildContext context) {
    final settingsController = Provider.of<SettingsController>(context);

    final isDark = settingsController.themeMode == ThemeMode.dark;

    final dustyColorSet =
        isDark ? darkModeDustyColorSet : lightModeDustyColorSet;

    final gradientColors = isDark ? dustyDarkGradient : dustyLightGradient;

    return Scaffold(
      backgroundColor: Colors.transparent,
      endDrawer: const CommonDrawer(
        pageKey: 'dusty',
      ),
      appBar: const CommonAppBar(
        pageKey: 'dusty',
      ),
      body: SizedBox.expand(
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: gradientColors,
            ),
          ),
          child: SingleChildScrollView(
            child: Center(
              child: ConstrainedBox(
                constraints: const BoxConstraints(
                  maxWidth: 900,
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 32,
                    vertical: 64,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildHero(dustyColorSet),
                      const SizedBox(height: 80),
                      _buildWorkspace(
                        context,
                        dustyColorSet,
                      ),
                      const SizedBox(height: 80),
                      _buildProjects(
                        context,
                        dustyColorSet,
                      ),
                      const SizedBox(height: 80),
                      _buildLibrary(
                        context,
                        dustyColorSet,
                      ),
                      const SizedBox(height: 80),
                      _buildEcosystem(
                        context,
                        dustyColorSet,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
      bottomNavigationBar: buildFooter(context),
      floatingActionButton: FloatingAction(
        imagePath: 'assets/dusty/dusty-agent-white.png',
        onPressed: () =>
            launchURL('https://dusty-agent.github.io/dustie/', context),
        themeMode: settingsController.themeMode,
      ),
    );
  }

  Widget _buildHero(
    Map<String, Color> colorSet,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'DUSTY DRAFT®',
          style: TextStyle(
            fontSize: 42,
            fontWeight: FontWeight.bold,
            color: colorSet['textPrimaryColor'],
          ),
        ),
        const SizedBox(height: 12),
        Text(
          '인텔리전스 랩 & 프로덕트 워크스페이스',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w600,
            color: colorSet['textPrimaryColor'],
          ),
        ),
        const SizedBox(height: 4),
        Text(
          'Intelligence Lab & Product Workspace',
          style: TextStyle(
            fontSize: 16,
            fontStyle: FontStyle.italic,
            color: colorSet['textSecondaryColor'],
          ),
        ),
        const SizedBox(height: 24),
        Text(
          '자산, 비즈니스 그리고 기술을 탐구하고,\n'
          '도구와 프로젝트를 통해 아이디어를 현실로 만듭니다.',
          style: TextStyle(
            fontSize: 18,
            height: 1.8,
            color: colorSet['textPrimaryColor'],
          ),
        ),
      ],
    );
  }

  Widget _buildWorkspace(
    BuildContext context,
    Map<String, Color> colorSet,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _sectionTitle(
          '워크스페이스',
          'Workspace',
          colorSet,
        ),
        Text(
          '탐구와 실험이 이루어지는 영역.\n'
          'Areas of exploration and experimentation.',
          style: TextStyle(
            fontSize: 14,
            height: 1.8,
            color: colorSet['textPrimaryColor'],
          ),
        ),
        const SizedBox(height: 30),
        _linkItem(
          context,
          '자산 인텔리전스',
          'Asset Intelligence',
          '건물, 자산 및 투자 분석',
          'https://www.dustydraft.com/#/workspace/building-intelligence',
          colorSet,
        ),
        _linkItem(
          context,
          '비즈니스 인텔리전스',
          'Business Intelligence',
          '비즈니스 모델, 운영 및 실행',
          'https://www.dustydraft.com/#/workspace/business-intelligence',
          colorSet,
        ),
        _linkItem(
          context,
          'AI 준비도',
          'AI Readiness',
          'AI 도입 및 자동화 기회 분석',
          'https://www.dustydraft.com/#/workspace',
          colorSet,
        ),
      ],
    );
  }

  Widget _buildProjects(
    BuildContext context,
    Map<String, Color> colorSet,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _sectionTitle(
          '프로젝트',
          'Projects',
          colorSet,
        ),
        Text(
          '제품, 도구 및 운영 중인 프로젝트.\n'
          'Products, tools and active initiatives.',
          style: TextStyle(
            fontSize: 14,
            height: 1.8,
            color: colorSet['textPrimaryColor'],
          ),
        ),
        const SizedBox(height: 30),
        _linkItem(
          context,
          'AssetPicker',
          'Asset Intelligence',
          '실제 사례 기반 자산 분석',
          'https://blog.naver.com/assetpicker',
          colorSet,
        ),
        _linkItem(
          context,
          'Real Estate Toolkit',
          'Investment Tools',
          '부동산 투자 분석 계산기',
          'https://www.dustydraft.com/#/workspace/real-estate-toolkit',
          colorSet,
        ),
        _linkItem(
          context,
          'ASSIST',
          'AI Workspace',
          'AI 어시스턴트 및 생산성 도구',
          'https://www.dustydraft.com/#/workspace/assist',
          colorSet,
        ),
      ],
    );
  }

  Widget _buildLibrary(
    BuildContext context,
    Map<String, Color> colorSet,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _sectionTitle(
          '라이브러리',
          'Library',
          colorSet,
        ),
        Text(
          '기록, 기술 문서 및 미디어.\n'
          'Research notes, technical writing and media.',
          style: TextStyle(
            fontSize: 14,
            height: 1.8,
            color: colorSet['textPrimaryColor'],
          ),
        ),
        const SizedBox(height: 30),
        _linkItem(
          context,
          'AssetPicker Journal',
          'Investment Research',
          '투자 리서치 및 자산 분석',
          'https://blog.naver.com/assetpicker',
          colorSet,
        ),
        _linkItem(
          context,
          '랄라선녀의 테크일기',
          'Rala\'s Tech Notes',
          '기술 노트, 개발 기록 및 실험',
          'https://theplaceyoung.wordpress.com/',
          colorSet,
        ),
        _linkItem(
          context,
          'GitHub',
          'Open Projects',
          '소스코드 및 오픈 프로젝트',
          'https://github.com/dusty-agent',
          colorSet,
        ),
        _linkItem(
          context,
          'YouTube',
          'Videos & Stories',
          '영상 콘텐츠 및 프로젝트 기록',
          DraftUrls.dustyArchive,
          colorSet,
        ),
      ],
    );
  }

  Widget _buildEcosystem(
    BuildContext context,
    Map<String, Color> colorSet,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _sectionTitle(
          '생태계',
          'Ecosystem',
          colorSet,
        ),
        _linkItem(
          context,
          'DRAFT House',
          'Independent Ventures',
          '독립 프로젝트와 실험의 기반',
          'https://draft.best',
          colorSet,
        ),
        _linkItem(
          context,
          'The Exotic Ordinary',
          'Creative Projects',
          '브랜딩, 라이프스타일 및 창작 프로젝트',
          'https://exoticordinary.com',
          colorSet,
        ),
      ],
    );
  }

  Widget _linkItem(
    BuildContext context,
    String title,
    String subtitle,
    String description,
    String url,
    Map<String, Color> colorSet,
  ) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 24),
      child: InkWell(
        onTap: () => launchURL(url, context),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '$title →',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: colorSet['textPrimaryColor'],
              ),
            ),
            const SizedBox(height: 4),
            Text(
              subtitle,
              style: TextStyle(
                fontSize: 14,
                color: colorSet['textSecondaryColor'],
              ),
            ),
            const SizedBox(height: 4),
            Text(
              description,
              style: TextStyle(
                color: colorSet['textSecondaryColor'],
                height: 1.5,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _sectionTitle(
    String title,
    String subtitle,
    Map<String, Color> colorSet,
  ) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: colorSet['textPrimaryColor'],
            ),
          ),
          const SizedBox(height: 4),
          Text(
            subtitle,
            style: TextStyle(
              color: colorSet['textSecondaryColor'],
            ),
          ),
        ],
      ),
    );
  }
}
