import 'package:draft_home/constants/urls.dart';
import 'package:draft_home/provider/localization_provider.dart';
import 'package:draft_home/settings/settings_controller.dart';
import 'package:draft_home/utils/floating_action.dart';
import 'package:draft_home/utils/url_utils.dart';
import 'package:draft_home/widgets/app_bar.dart';
import 'package:draft_home/widgets/common_drawer.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CompanyPage extends StatelessWidget {
  const CompanyPage({super.key});

  @override
  Widget build(BuildContext context) {
    final pageKey = _getPageKey(context);

    final localizationProvider = Provider.of<LocalizationProvider>(context);

    return Scaffold(
      endDrawer: CommonDrawer(pageKey: pageKey),
      appBar: CommonAppBar(
        backgroundColor: Colors.white,
        // actions: [
        //   _buildLanguageSwitchButton(localizationProvider, context),
        // ],
        pageKey: pageKey,
      ),
      body: _buildBody(context),
      floatingActionButton: _buildFloatingActionButton(pageKey, context),
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

  String _getPageKey(BuildContext context) {
    final currentRoute = ModalRoute.of(context)?.settings.name ?? '/';
    return currentRoute.substring(1); // '/draft' -> 'draft'
  }

  Widget _buildBody(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 48),
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 1000),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                MouseRegion(
                  cursor: SystemMouseCursors.click,
                  child: InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, '/');
                    },
                    child: const Text(
                      'DRAFT House',
                      style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 12),
                const Text(
                  '소개 · About',
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey,
                  ),
                ),
                const SizedBox(height: 48),
                const Text(
                  '자산, 비즈니스 그리고 기술을 탐구합니다.',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 12),
                const Text(
                  'We explore assets, businesses and technology\nthrough research, tools and real-world projects.',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.black87,
                    height: 1.8,
                  ),
                ),
                const Text(
                  'Founded in Seoul, 2019',
                  style: TextStyle(fontSize: 14, color: Colors.grey),
                ),
                const SizedBox(height: 64),
                _sectionTitle('Philosophy'),
                const SizedBox(height: 32),
                const Text(
                  'Building brands, products and stories.\n\nTechnology.\nCraftsmanship.\nCreativity.\nWorking together.',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                ),
                const SizedBox(height: 64),
                _sectionTitle(
                  '철학 · Philosophy',
                ),
                const SizedBox(height: 24),
                const Text(
                  '탐구하고,\n만들고,\n운영합니다.',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    height: 2,
                  ),
                ),
                const SizedBox(height: 16),
                const Text(
                  'Explore.\nBuild.\nOperate.',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey,
                    height: 2,
                  ),
                ),
                const SizedBox(height: 64),
                _sectionTitle(
                  '타임라인 · Timeline',
                ),
                const SizedBox(height: 32),
                const _HistoryItem(
                  year: '2019',
                  title: 'Exotic Ordinary 시작',
                ),
                const _HistoryItem(
                  year: '2021',
                  title: '창고 운영 시작',
                ),
                const _HistoryItem(
                  year: '2022',
                  title: 'The Exotic Boutique 런칭',
                ),
                const _HistoryItem(
                  year: '2023',
                  title: '주얼리 공예 및 제품 개발',
                ),
                const _HistoryItem(
                  year: '2025',
                  title: 'DUSTY DRAFT 및 The Exotic Voutique™ 시작',
                ),
                const _HistoryItem(
                  year: '2026',
                  title: 'Workspace 및 Library 공개',
                ),
                const SizedBox(height: 64),
                _sectionTitle(
                  '생태계 · Ecosystem',
                ),
                const SizedBox(height: 24),
                const Text(
                  'DUSTY DRAFT®',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 4),
                const Text(
                  '인텔리전스 랩 & 프로덕트 워크스페이스',
                ),
                const SizedBox(height: 4),
                const Text(
                  'Intelligence Lab & Product Workspace',
                  style: TextStyle(
                    color: Colors.grey,
                  ),
                ),
                const SizedBox(height: 24),
                const Text(
                  'Exotic Ordinary®',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 4),
                const Text(
                  '브랜드, 큐레이션 그리고 스토리텔링',
                ),
                const SizedBox(height: 4),
                const Text(
                  'Brand, Curation & Storytelling',
                  style: TextStyle(
                    color: Colors.grey,
                  ),
                ),
                const SizedBox(height: 24),
                const Text(
                  'The Exotic Voutiq™',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 4),
                const Text(
                  '가상 부티크와 디지털 경험',
                ),
                const SizedBox(height: 4),
                const Text(
                  'Virtual Boutique & Digital Experience',
                  style: TextStyle(
                    color: Colors.grey,
                  ),
                ),
                const SizedBox(height: 24),
                const Text(
                  'AssetPicker',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 4),
                const Text(
                  '자산 분석 및 투자 연구',
                ),
                const SizedBox(height: 4),
                const Text(
                  'Asset Intelligence & Investment Research',
                  style: TextStyle(
                    color: Colors.grey,
                  ),
                ),
                const SizedBox(height: 64),
                _sectionTitle(
                  '네트워크 · Network',
                ),
                const SizedBox(height: 24),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: _websiteBlock(
                        context,
                        'dustydraft.com',
                        'https://www.dustydraft.com',
                        'Workspace',
                      ),
                    ),
                    Expanded(
                      child: _websiteBlock(
                        context,
                        'draft.best',
                        'https://draft.best',
                        'DRAFT House',
                      ),
                    ),
                    Expanded(
                      child: _websiteBlock(
                        context,
                        'exoticordinary.com',
                        'https://exoticordinary.com',
                        'Exotic Ordinary',
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 64),
                _sectionTitle('BUSINESS'),
                const SizedBox(height: 20),
                const Text('사업자등록번호 : 756-66-00303'),
                const SizedBox(height: 8),
                const Text('통신판매업신고번호 : 2020-서울양천-0014'),
                const SizedBox(height: 16),
                _sectionTitle(
                  '연락처 · Contact',
                ),
                const SizedBox(height: 16),
                const Text(
                  'Email',
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 8),
                const Text(
                  'soyoung@draft.best',
                ),
                const SizedBox(height: 16),
                Text(
                  '© 2019-${DateTime.now().year} DRAFT House. All rights reserved.',
                  style: const TextStyle(
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  static Widget _sectionTitle(String title) {
    return Text(
      title,
      style: const TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.bold,
        letterSpacing: 1,
        color: Colors.grey,
      ),
    );
  }

  static Widget _brandBlock(String title, String description) {
    return Column(
      children: [
        Text(
          title,
          textAlign: TextAlign.start,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
        ),
        const SizedBox(height: 8),
        Text(
          description,
          textAlign: TextAlign.start,
          style: const TextStyle(
            fontSize: 13,
            height: 1.6,
            color: Colors.black87,
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
      child: Column(
        children: [
          InkWell(
            onTap: () {
              launchURL(targetUrl, context);
            },
            child: Text(
              label,
              textAlign: TextAlign.left,
              style: const TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w600,
                decoration: TextDecoration.underline,
              ),
            ),
          ),
          const SizedBox(height: 6),
          Text(
            description,
            style: const TextStyle(fontSize: 12, color: Colors.grey),
          ),
        ],
      ),
    );
  }
}

class _HistoryItem extends StatelessWidget {
  final String year;
  final String title;

  const _HistoryItem({required this.year, required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 24),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 90,
            child: Text(
              year,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(child: Text(title, style: const TextStyle(fontSize: 16))),
        ],
      ),
    );
  }
}
