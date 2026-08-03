import 'package:draft_home/constants/urls.dart';
import 'package:draft_home/utils/url_utils.dart';
import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  static const String _draftAmbientUrl =
      'https://www.youtube.com/@draftambient';

  static const String _exoticLoungeUrl =
      'https://www.youtube.com/@exoticlounge';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 32,
            vertical: 48,
          ),
          child: Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(
                maxWidth: 1000,
              ),
              child: Column(
                children: [
                  _buildHero(context),
                  const SizedBox(height: 72),
                  _sectionTitle('ABOUT'),
                  const SizedBox(height: 24),
                  const Text(
                    'DRAFT House is an independent studio and brand ecosystem '
                    'building practical tools, contents and experiences.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 16,
                      height: 1.8,
                    ),
                  ),
                  const SizedBox(height: 12),
                  const Text(
                    '반복되는 문제를 구조화하고 기술과 콘텐츠를 통해\n'
                    '실제로 사용할 수 있는 결과물로 발전시킵니다.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 14,
                      height: 1.7,
                      color: Colors.grey,
                    ),
                  ),
                  const SizedBox(height: 72),
                  _sectionTitle('WHAT WE BUILD'),
                  const SizedBox(height: 28),
                  _responsiveBlocks(
                    children: [
                      _infoBlock(
                        'AI & Data Systems',
                        '데이터 수집, 구조화,\n검색 및 분석 시스템',
                      ),
                      _infoBlock(
                        'Workflow Automation',
                        '반복 업무를 줄이는\n프로그램과 워크플로우',
                      ),
                      _infoBlock(
                        'Creative Technology',
                        '영상, 음악과 콘텐츠를 위한\n창작 기술과 자동화',
                      ),
                      _infoBlock(
                        'Independent Products',
                        '직접 사용하고 검증하는\n독립 제품과 서비스',
                      ),
                    ],
                  ),
                  const SizedBox(height: 72),
                  _sectionTitle('BRANDS'),
                  const SizedBox(height: 28),
                  _responsiveBlocks(
                    children: [
                      _websiteBlock(
                        context,
                        'DustyDraft®',
                        DraftUrls.dustyDraft,
                        'AI, data, automation and digital products',
                      ),
                      _websiteBlock(
                        context,
                        'Exotic Ordinary®',
                        DraftUrls.exoticOrdinary,
                        'Lifestyle, design, music and creative contents',
                      ),
                      _websiteBlock(
                        context,
                        'ASSETPICKER™',
                        DraftUrls.assetPicker,
                        'Real estate research and asset intelligence',
                      ),
                    ],
                  ),
                  const SizedBox(height: 72),
                  _sectionTitle('MEDIA'),
                  const SizedBox(height: 28),
                  _responsiveBlocks(
                    children: [
                      _websiteBlock(
                        context,
                        'DraftAmbient',
                        _draftAmbientUrl,
                        'Ambient sounds, keyboards and quiet moments',
                      ),
                      _websiteBlock(
                        context,
                        'Exotic Lounge',
                        _exoticLoungeUrl,
                        'Music for beautiful spaces',
                      ),
                      _websiteBlock(
                        context,
                        'Exotic Archive',
                        DraftUrls.exoticArchive,
                        'Creative videos and visual archive',
                      ),
                    ],
                  ),
                  const SizedBox(height: 72),
                  _sectionTitle('PROJECTS & NETWORK'),
                  const SizedBox(height: 28),
                  _responsiveBlocks(
                    children: [
                      _websiteBlock(
                        context,
                        'Dustie',
                        'https://dustie.xyz',
                        'AI-assisted knowledge and decision-support workspace',
                      ),
                      _websiteBlock(
                        context,
                        'Rala\'s Tech Notes',
                        DraftUrls.fairyRala,
                        'Development notes, research and experiments',
                      ),
                      _websiteBlock(
                        context,
                        'GitHub',
                        'https://github.com/dusty-agent',
                        'Source code and open projects',
                      ),
                    ],
                  ),
                  const SizedBox(height: 72),
                  _sectionTitle('WEBSITES'),
                  const SizedBox(height: 28),
                  _responsiveBlocks(
                    children: [
                      _websiteBlock(
                        context,
                        'draft.best',
                        DraftUrls.draft,
                        'DRAFT House portal',
                      ),
                      _websiteBlock(
                        context,
                        'dustydraft.com',
                        DraftUrls.dustyDraft,
                        'Technology studio and projects',
                      ),
                      _websiteBlock(
                        context,
                        'exoticordinary.com',
                        DraftUrls.exoticOrdinary,
                        'Boutique and creative contents',
                      ),
                      _websiteBlock(
                        context,
                        'dustie.xyz',
                        'https://dustie.xyz',
                        'AI workspace and decision-support tools',
                      ),
                    ],
                  ),
                  const SizedBox(height: 72),
                  _sectionTitle('BUSINESS'),
                  const SizedBox(height: 20),
                  const Text(
                    '사업자등록번호 : 756-66-00303',
                    style: TextStyle(
                      fontSize: 14,
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    '통신판매업신고번호 : 2020-서울양천-0014',
                    style: TextStyle(
                      fontSize: 14,
                    ),
                  ),
                  const SizedBox(height: 56),
                  InkWell(
                    onTap: () => launchURL(
                      'mailto:soyoung@draft.best',
                      context,
                    ),
                    child: const Text(
                      'soyoung@draft.best',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                  const SizedBox(height: 24),
                  Text(
                    '© 2019-${DateTime.now().year} '
                    'DRAFT House. All rights reserved.',
                    style: const TextStyle(
                      fontSize: 13,
                      color: Colors.grey,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildHero(
    BuildContext context,
  ) {
    return Column(
      children: [
        MouseRegion(
          cursor: SystemMouseCursors.click,
          child: InkWell(
            onTap: () {
              Navigator.pushNamed(
                context,
                '/',
              );
            },
            child: const Text(
              'DRAFT House',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        const SizedBox(height: 12),
        const Text(
          'Independent Technology & Creative Studio',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 17,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 12),
        const Text(
          'Founded in Seoul, 2019',
          style: TextStyle(
            fontSize: 14,
            color: Colors.grey,
          ),
        ),
        const SizedBox(height: 28),
        const Text(
          'Less repetition.\nMore room to create.',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w600,
            height: 1.4,
          ),
        ),
        const SizedBox(height: 16),
        const Text(
          '반복을 줄이고, 판단과 창작에 더 집중할 수 있는\n'
          '도구와 브랜드를 만듭니다.',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 14,
            height: 1.7,
            color: Colors.grey,
          ),
        ),
      ],
    );
  }

  static Widget _sectionTitle(
    String title,
  ) {
    return Text(
      title,
      style: const TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.bold,
        letterSpacing: 3,
        color: Colors.grey,
      ),
    );
  }

  static Widget _responsiveBlocks({
    required List<Widget> children,
  }) {
    return LayoutBuilder(
      builder: (
        context,
        constraints,
      ) {
        final isMobile = constraints.maxWidth < 700;

        final itemWidth =
            isMobile ? constraints.maxWidth : (constraints.maxWidth - 48) / 3;

        return Wrap(
          spacing: 24,
          runSpacing: 36,
          alignment: WrapAlignment.center,
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

  static Widget _infoBlock(
    String title,
    String description,
  ) {
    return Column(
      children: [
        Text(
          title,
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontSize: 17,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 10),
        Text(
          description,
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontSize: 13,
            color: Colors.grey,
            height: 1.6,
          ),
        ),
      ],
    );
  }

  static Widget _websiteBlock(
    BuildContext context,
    String label,
    String targetUrl,
    String description,
  ) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: InkWell(
        onTap: () {
          launchURL(
            targetUrl,
            context,
          );
        },
        borderRadius: BorderRadius.circular(8),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 8,
            vertical: 8,
          ),
          child: Column(
            children: [
              Text(
                '$label →',
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                  decoration: TextDecoration.underline,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                description,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 12,
                  color: Colors.grey,
                  height: 1.5,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
