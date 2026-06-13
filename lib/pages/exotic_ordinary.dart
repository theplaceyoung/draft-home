import 'package:draft_home/constants/urls.dart';
import 'package:draft_home/utils/url_utils.dart';
import 'package:draft_home/widgets/app_bar.dart';
import 'package:draft_home/widgets/common_drawer.dart';
import 'package:draft_home/widgets/footer.dart';
import 'package:flutter/material.dart';
import 'package:draft_home/themes/color_set.dart';

class ExoticOrdinaryPage extends StatelessWidget {
  const ExoticOrdinaryPage({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    final colorSet = isDark ? darkModeExoticColorSet : lightModeExoticColorSet;

    final gradientColors = isDark ? exoticDarkGradient : exoticLightGradient;

    return Scaffold(
      endDrawer: const CommonDrawer(
        pageKey: 'exotic',
      ),
      appBar: CommonAppBar(
        pageKey: 'exotic',
      ),
      backgroundColor: Colors.transparent,
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: gradientColors,
          ),
        ),
        child: _buildBody(
          context,
          colorSet,
        ),
      ),
      bottomNavigationBar: buildFooter(context),
    );
  }

  Widget _buildBody(
    BuildContext context,
    Map<String, Color> colorSet,
  ) {
    return SingleChildScrollView(
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
                _buildHero(
                  colorSet,
                ),
                const SizedBox(height: 100),
                _buildChannels(
                  context,
                  colorSet,
                ),
                const SizedBox(height: 100),
                _buildProjects(
                  context,
                  colorSet,
                ),
                const SizedBox(height: 100),
                _buildLibrary(
                  context,
                  colorSet,
                ),
                const SizedBox(height: 100),
                _buildBrand(
                  colorSet,
                ),
                const SizedBox(height: 100),
                _buildTimeline(
                  colorSet,
                ),
              ],
            ),
          ),
        ),
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
          'EXOTIC ORDINARY®',
          style: TextStyle(
            fontSize: 42,
            fontWeight: FontWeight.bold,
            color: colorSet['textPrimaryColor'],
          ),
        ),
        const SizedBox(height: 12),
        Text(
          '브랜드, 큐레이션 그리고 스토리텔링',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w600,
            color: colorSet['textPrimaryColor'],
          ),
        ),
        const SizedBox(height: 4),
        Text(
          'Brand, Curation & Storytelling',
          style: TextStyle(
            fontSize: 16,
            fontStyle: FontStyle.italic,
            color: colorSet['textSecondaryColor'],
          ),
        ),
        const SizedBox(height: 24),
        Text(
          '실물과 디지털 공간을 넘나들며\n브랜드와 경험을 만들어갑니다.',
          style: TextStyle(
            fontSize: 18,
            height: 1.8,
            color: colorSet['textPrimaryColor'],
          ),
        ),
      ],
    );
  }

  Widget _buildChannels(
    BuildContext context,
    Map<String, Color> colorSet,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _sectionTitle(
          '채널',
          'Channels',
          colorSet,
        ),
        _linkItem(
          context,
          'Instagram',
          'Visual Journal',
          '브랜드와 일상의 기록',
          DraftUrls.exoticInstagram,
          colorSet,
        ),
        _linkItem(
          context,
          'Shop',
          'Naver SmartStore',
          '네이버 스마트스토어',
          DraftUrls.exoticOrdinary,
          colorSet,
        ),
        _linkItem(
          context,
          'YouTube',
          'Video Stories',
          '영상 콘텐츠 및 프로젝트 기록',
          DraftUrls.exoticArchive,
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
        _linkItem(
          context,
          'The Exotic Boutique',
          'Physical Boutique',
          '실물 기반 큐레이션과 커머스',
          DraftUrls.exoticOfficial,
          colorSet,
        ),
        _linkItem(
          context,
          'The Exotic Voutique(Voutiq™)',
          'Virtual Boutique',
          '가상 부티크와 디지털 경험',
          DraftUrls.voutiqueOfficial,
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
          '기록, 콘텐츠 및 브랜드 아카이브.\nLibrary of stories, media and archives.',
          style: TextStyle(
            color: colorSet['textSecondaryColor'],
            height: 1.7,
          ),
        ),
      ],
    );
  }

  Widget _buildBrand(
    Map<String, Color> colorSet,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _sectionTitle(
          '브랜드',
          'Brand',
          colorSet,
        ),
        Text(
          'Exotic Ordinary는 브랜드, 큐레이션,\n공예 및 스토리텔링을 탐구하는 독립 프로젝트입니다.',
          style: TextStyle(
            fontSize: 18,
            height: 1.8,
            color: colorSet['textPrimaryColor'],
          ),
        ),
        const SizedBox(height: 20),
        Text(
          'Founded in Seoul, 2019',
          style: TextStyle(
            color: colorSet['textSecondaryColor'],
          ),
        ),
        const SizedBox(height: 8),
        Text(
          'Part of DRAFT House',
          style: TextStyle(
            color: colorSet['textSecondaryColor'],
          ),
        ),
      ],
    );
  }

  Widget _buildTimeline(
    Map<String, Color> colorSet,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _sectionTitle(
          '타임라인',
          'Timeline',
          colorSet,
        ),
        const SizedBox(height: 24),
        _timelineItem(
          '2024',
          'The Exotic Voutique(Voutiq™) 프로젝트 시작',
          colorSet,
        ),
        _timelineItem(
          '2023',
          '주얼리 공예 및 제품 개발',
          colorSet,
        ),
        _timelineItem(
          '2022',
          'The Exotic Boutique 런칭',
          colorSet,
        ),
        _timelineItem(
          '2021',
          '창고 운영 시작',
          colorSet,
        ),
        _timelineItem('2019', 'Exotic Ordinary 시작', colorSet),
      ],
    );
  }

  Widget _timelineItem(
    String year,
    String text,
    Map<String, Color> colorSet,
  ) {
    return Padding(
      padding: const EdgeInsets.only(
        bottom: 24,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 90,
            child: Text(
              year,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: colorSet['accentColor'],
              ),
            ),
          ),
          Expanded(
            child: Text(
              text,
              style: TextStyle(
                fontSize: 18,
                color: colorSet['textPrimaryColor'],
              ),
            ),
          ),
        ],
      ),
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
      padding: const EdgeInsets.only(
        bottom: 24,
      ),
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
      padding: const EdgeInsets.only(
        bottom: 24,
      ),
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
