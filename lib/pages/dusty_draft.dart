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

  static const String contactEmail = 'mailto:soyoung@dustydraft.com';

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
                  maxWidth: 960,
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
                        context,
                        dustyColorSet,
                      ),
                      const SizedBox(height: 88),
                      _buildAbout(
                        dustyColorSet,
                      ),
                      const SizedBox(height: 88),
                      _buildCapabilities(
                        context,
                        dustyColorSet,
                      ),
                      const SizedBox(height: 88),
                      _buildProjects(
                        context,
                        dustyColorSet,
                      ),
                      const SizedBox(height: 88),
                      _buildServices(
                        context,
                        dustyColorSet,
                      ),
                      const SizedBox(height: 88),
                      _buildLibrary(
                        context,
                        dustyColorSet,
                      ),
                      const SizedBox(height: 88),
                      _buildEcosystem(
                        context,
                        dustyColorSet,
                      ),
                      const SizedBox(height: 88),
                      _buildContact(
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
        onPressed: () => launchURL(
          DraftUrls.dustyAgent,
          context,
        ),
        themeMode: settingsController.themeMode,
      ),
    );
  }

  Widget _buildHero(
    BuildContext context,
    Map<String, Color> colorSet,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'DUSTYDRAFT®',
          style: TextStyle(
            fontSize: 44,
            fontWeight: FontWeight.bold,
            letterSpacing: -1,
            color: colorSet['textPrimaryColor'],
          ),
        ),
        const SizedBox(height: 14),
        Text(
          'Independent Technology Studio',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w600,
            color: colorSet['textPrimaryColor'],
          ),
        ),
        const SizedBox(height: 8),
        Text(
          'AI · Data · Automation · Digital Products',
          style: TextStyle(
            fontSize: 15,
            fontStyle: FontStyle.italic,
            color: colorSet['textSecondaryColor'],
          ),
        ),
        const SizedBox(height: 28),
        Text(
          'AI와 데이터를 활용해 반복되는 업무를 구조화하고,\n'
          '실제로 사용할 수 있는 도구와 시스템을 만듭니다.',
          style: TextStyle(
            fontSize: 19,
            height: 1.75,
            color: colorSet['textPrimaryColor'],
          ),
        ),
        const SizedBox(height: 14),
        Text(
          'We turn fragmented information and repetitive work '
          'into practical digital products.',
          style: TextStyle(
            fontSize: 15,
            height: 1.7,
            color: colorSet['textSecondaryColor'],
          ),
        ),
        const SizedBox(height: 32),
        Wrap(
          spacing: 12,
          runSpacing: 12,
          children: [
            _actionButton(
              context,
              'View Projects',
              DraftUrls.dustyDraft,
              colorSet,
            ),
            _outlineActionButton(
              context,
              'Work With Me',
              contactEmail,
              colorSet,
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildAbout(
    Map<String, Color> colorSet,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _sectionTitle(
          '소개',
          'About',
          colorSet,
        ),
        Text(
          'DustyDraft는 AI, 웹 기술과 데이터 구조화를 바탕으로 '
          '리서치, 업무 자동화, 분석 도구 및 디지털 제품을 '
          '개발하는 독립 기술 스튜디오입니다.',
          style: TextStyle(
            fontSize: 16,
            height: 1.8,
            color: colorSet['textPrimaryColor'],
          ),
        ),
        const SizedBox(height: 14),
        Text(
          '직접 운영하는 브랜드와 실제 업무에서 발견한 문제를 '
          '출발점으로 삼아, 자료 수집부터 구조 설계, 개발, '
          '문서화와 운영까지 연결합니다.',
          style: TextStyle(
            fontSize: 15,
            height: 1.8,
            color: colorSet['textSecondaryColor'],
          ),
        ),
      ],
    );
  }

  Widget _buildCapabilities(
    BuildContext context,
    Map<String, Color> colorSet,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _sectionTitle(
          '주요 역량',
          'Capabilities',
          colorSet,
        ),
        Text(
          '문제를 발견하고 구조화해 실제 업무에 적용할 수 있는 '
          '형태로 발전시킵니다.',
          style: TextStyle(
            fontSize: 14,
            height: 1.8,
            color: colorSet['textSecondaryColor'],
          ),
        ),
        const SizedBox(height: 30),
        _responsiveCards(
          children: [
            _capabilityCard(
              'AI & Data Systems',
              '데이터 수집, 정제, 구조화,\n검색과 분석 시스템',
              Icons.hub_outlined,
              colorSet,
            ),
            _capabilityCard(
              'Workflow Automation',
              '반복 업무를 줄이는\n맞춤형 프로그램과 워크플로우',
              Icons.auto_awesome_outlined,
              colorSet,
            ),
            _capabilityCard(
              'Digital Products',
              '웹 도구, MVP 및\n독립 디지털 제품 개발',
              Icons.web_asset_outlined,
              colorSet,
            ),
            _capabilityCard(
              'Research & Intelligence',
              '시장, 자산, 비즈니스 및\n기술 리서치 구조화',
              Icons.manage_search_outlined,
              colorSet,
            ),
          ],
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
          'Active Projects',
          colorSet,
        ),
        Text(
          '직접 운영하고 개발하며 실제 사용 환경에서 '
          '검증하는 프로젝트입니다.',
          style: TextStyle(
            fontSize: 14,
            height: 1.8,
            color: colorSet['textSecondaryColor'],
          ),
        ),
        const SizedBox(height: 30),
        _linkItem(
          context,
          'AssetPicker',
          'Asset Intelligence & Research',
          '부동산, 정책, 시장 데이터를 바탕으로 한 '
              '자산 리서치 및 정보 구조화',
          DraftUrls.assetPicker,
          colorSet,
        ),
        _linkItem(
          context,
          'Dustie',
          'AI Decision-Support Workspace',
          '문서, 데이터와 분석 결과를 연결하는 '
              'AI 기반 업무 및 의사결정 지원 도구',
          DraftUrls.dustie,
          colorSet,
        ),
        _linkItem(
          context,
          'Real Estate Toolkit',
          'Investment Analysis Tools',
          '부동산 의사결정을 위한 분석 계산기와 '
              '실무 도구 모음',
          '${DraftUrls.dustyDraft}/#/workspace/real-estate-toolkit',
          colorSet,
        ),
        _linkItem(
          context,
          'ASSIST',
          'AI Workspace',
          '업무 생산성과 정보 활용을 돕는 '
              'AI 어시스턴트 및 워크스페이스',
          '${DraftUrls.dustyDraft}/#/workspace/assist',
          colorSet,
        ),
      ],
    );
  }

  Widget _buildServices(
    BuildContext context,
    Map<String, Color> colorSet,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _sectionTitle(
          '업무 서비스',
          'Services',
          colorSet,
        ),
        Text(
          '외부 프로젝트는 목적과 범위를 먼저 정리한 후 '
          '프로젝트 단위로 진행합니다.',
          style: TextStyle(
            fontSize: 14,
            height: 1.8,
            color: colorSet['textSecondaryColor'],
          ),
        ),
        const SizedBox(height: 30),
        _linkItem(
          context,
          '리서치 & 데이터 구조화',
          'Research & Data Structuring',
          '자료 수집, 정리, Excel·JSON 변환, '
              '데이터셋 및 리포트 구성',
          contactEmail,
          colorSet,
        ),
        _linkItem(
          context,
          '업무 자동화',
          'Workflow Automation',
          '수작업과 반복 업무를 줄이는 '
              '맞춤형 자동화 프로그램 개발',
          contactEmail,
          colorSet,
        ),
        _linkItem(
          context,
          '웹 도구 & 프로토타입',
          'Web Tools & Prototyping',
          '아이디어 검증을 위한 웹 도구, '
              'MVP 및 초기 제품 개발',
          contactEmail,
          colorSet,
        ),
        _linkItem(
          context,
          'AI & IT 컨설팅',
          'AI & IT Consulting',
          'AI 도입 검토, 기술 방향 설정과 '
              '프로젝트 구조 설계',
          contactEmail,
          colorSet,
        ),
        _linkItem(
          context,
          'LinkedIn Services',
          'Professional Profile',
          '경력, 서비스 범위 및 프로젝트 활동 확인',
          DraftUrls.linkedIn,
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
          '리서치, 개발 기록, 기술 문서와 미디어 아카이브입니다.',
          style: TextStyle(
            fontSize: 14,
            height: 1.8,
            color: colorSet['textSecondaryColor'],
          ),
        ),
        const SizedBox(height: 30),
        _linkItem(
          context,
          'AssetPicker Journal',
          'Real Estate Research',
          '부동산 정책, 시장 및 자산 분석 기록',
          DraftUrls.assetPicker,
          colorSet,
        ),
        _linkItem(
          context,
          'Rala\'s Tech Notes',
          'Development Notes',
          '개발 기록, 기술 실험과 프로젝트 노트',
          DraftUrls.fairyRala,
          colorSet,
        ),
        _linkItem(
          context,
          'GitHub',
          'Open Projects',
          '소스코드, 자동화 도구 및 공개 프로젝트',
          DraftUrls.github,
          colorSet,
        ),
        _linkItem(
          context,
          'DustyDraft Archive',
          'Videos & Stories',
          '영상 콘텐츠와 프로젝트 기록',
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
          '브랜드 생태계',
          'Ecosystem',
          colorSet,
        ),
        Text(
          'DustyDraft는 DRAFT House의 기술 및 제품 스튜디오입니다.',
          style: TextStyle(
            fontSize: 14,
            height: 1.8,
            color: colorSet['textSecondaryColor'],
          ),
        ),
        const SizedBox(height: 30),
        _linkItem(
          context,
          'DRAFT House',
          'Independent Technology & Creative Studio',
          '독립 브랜드, 제품과 프로젝트를 연결하는 기반',
          DraftUrls.draft,
          colorSet,
        ),
        _linkItem(
          context,
          'Exotic Ordinary®',
          'Lifestyle & Creative Brand',
          '디자인, 라이프스타일, 음악 및 창작 프로젝트',
          DraftUrls.exoticOfficial,
          colorSet,
        ),
        _linkItem(
          context,
          'AssetPicker',
          'Asset Intelligence Brand',
          '부동산과 자산을 위한 리서치 및 정보 서비스',
          DraftUrls.assetPicker,
          colorSet,
        ),
      ],
    );
  }

  Widget _buildContact(
    BuildContext context,
    Map<String, Color> colorSet,
  ) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(
        horizontal: 28,
        vertical: 32,
      ),
      decoration: BoxDecoration(
        color: colorSet['cardColor']?.withValues(
          alpha: 0.45,
        ),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: colorSet['textSecondaryColor']!.withValues(
            alpha: 0.2,
          ),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Have a project in mind?',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: colorSet['textPrimaryColor'],
            ),
          ),
          const SizedBox(height: 12),
          Text(
            '프로젝트 목적, 필요한 결과물과 일정이 정리되어 있다면 '
            '이메일로 문의해 주세요.',
            style: TextStyle(
              fontSize: 15,
              height: 1.7,
              color: colorSet['textSecondaryColor'],
            ),
          ),
          const SizedBox(height: 24),
          _actionButton(
            context,
            'Contact DustyDraft',
            contactEmail,
            colorSet,
          ),
        ],
      ),
    );
  }

  Widget _responsiveCards({
    required List<Widget> children,
  }) {
    return LayoutBuilder(
      builder: (
        context,
        constraints,
      ) {
        final isMobile = constraints.maxWidth < 700;

        final itemWidth =
            isMobile ? constraints.maxWidth : (constraints.maxWidth - 24) / 2;

        return Wrap(
          spacing: 24,
          runSpacing: 24,
          children: children
              .map(
                (child) => SizedBox(
                  width: itemWidth,
                  child: child,
                ),
              )
              .toList(),
        );
      },
    );
  }

  Widget _capabilityCard(
    String title,
    String description,
    IconData icon,
    Map<String, Color> colorSet,
  ) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 24,
        vertical: 24,
      ),
      decoration: BoxDecoration(
        color: colorSet['textPrimaryColor']?.withValues(
          alpha: 0.025,
        ),
        borderRadius: BorderRadius.circular(14),
        border: Border.all(
          color: colorSet['textPrimaryColor']!.withValues(
            alpha: 0.14,
          ),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.w600,
              color: colorSet['textPrimaryColor'],
            ),
          ),
          const SizedBox(height: 10),
          Text(
            description,
            style: TextStyle(
              fontSize: 14,
              height: 1.65,
              color: colorSet['textSecondaryColor'],
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
        bottom: 28,
      ),
      child: InkWell(
        onTap: () => launchURL(
          url,
          context,
        ),
        borderRadius: BorderRadius.circular(10),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 8,
            vertical: 8,
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
                        color: colorSet['textPrimaryColor'],
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      subtitle,
                      style: TextStyle(
                        fontSize: 13,
                        color: colorSet['textSecondaryColor'],
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      description,
                      style: TextStyle(
                        fontSize: 14,
                        height: 1.55,
                        color: colorSet['textSecondaryColor'],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 16),
              Icon(
                Icons.arrow_outward,
                size: 20,
                color: colorSet['textSecondaryColor'],
              ),
            ],
          ),
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
            subtitle.toUpperCase(),
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.bold,
              letterSpacing: 2.4,
              color: colorSet['textSecondaryColor'],
            ),
          ),
          const SizedBox(height: 8),
          Text(
            title,
            style: TextStyle(
              fontSize: 29,
              fontWeight: FontWeight.bold,
              color: colorSet['textPrimaryColor'],
            ),
          ),
        ],
      ),
    );
  }

  Widget _actionButton(
    BuildContext context,
    String label,
    String url,
    Map<String, Color> colorSet,
  ) {
    final foregroundColor =
        colorSet['backgroundColor'] ?? const Color(0xFFF5ECE2);

    final backgroundColor =
        colorSet['textPrimaryColor'] ?? const Color(0xFF241C18);

    return FilledButton(
      onPressed: () => launchURL(
        url,
        context,
      ),
      style: FilledButton.styleFrom(
        backgroundColor: backgroundColor,
        foregroundColor: foregroundColor,
        elevation: 0,
        minimumSize: const Size(150, 48),
        padding: const EdgeInsets.symmetric(
          horizontal: 24,
          vertical: 15,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        textStyle: const TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w600,
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(label),
          const SizedBox(width: 8),
          const Icon(
            Icons.arrow_forward,
            size: 16,
          ),
        ],
      ),
    );
  }

  Widget _outlineActionButton(
    BuildContext context,
    String label,
    String url,
    Map<String, Color> colorSet,
  ) {
    final buttonColor = colorSet['textPrimaryColor'] ?? const Color(0xFF2B211B);

    return OutlinedButton(
      onPressed: () => launchURL(
        url,
        context,
      ),
      style: OutlinedButton.styleFrom(
        foregroundColor: buttonColor,
        minimumSize: const Size(150, 48),
        padding: const EdgeInsets.symmetric(
          horizontal: 24,
          vertical: 15,
        ),
        side: BorderSide(
          color: buttonColor,
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
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(label),
          const SizedBox(width: 8),
          const Icon(
            Icons.mail_outline,
            size: 16,
          ),
        ],
      ),
    );
  }
}
