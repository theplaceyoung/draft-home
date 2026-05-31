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
      onPressed: () => launchURL('https://dustyagent.chat', context),
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
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                MouseRegion(
                  cursor: SystemMouseCursors.click,
                  child: InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, '/');
                    },
                    child: const Text(
                      'DRAFT Co.',
                      style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
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
                const SizedBox(height: 8),
                const Text(
                  'Independent Brands, Contents & Tools',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 64),
                _sectionTitle('GOALS & MISSIONS'),
                const SizedBox(height: 12),
                const Text(
                  'Compete with the Most Korean Techniques',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                // ClipRRect(
                //   borderRadius: BorderRadius.circular(12),
                //   child: Image.asset(
                //     'assets/draft/goals_and_missions.png',
                //   ),
                // ),
                const SizedBox(height: 64),
                // _sectionTitle('ECOSYSTEM'),
                // const SizedBox(height: 24),
                // ClipRRect(
                //   borderRadius: BorderRadius.circular(12),
                //   child: Image.asset(
                //     'assets/draft/draft_ecosystem.png',
                //   ),
                // ),
                // const SizedBox(height: 64),
                _sectionTitle('HISTORY'),
                const SizedBox(height: 32),
                const _HistoryItem(
                  year: '2019',
                  title: 'Exotic Ordinary founded',
                ),
                const _HistoryItem(
                  year: '2021',
                  title: 'Exotic Ordinary Warehouse established',
                ),
                const _HistoryItem(
                  year: '2024',
                  title: 'The Exotic Boutique launched',
                ),
                const _HistoryItem(
                  year: '2024',
                  title: 'DRAFT brand identity introduced',
                ),
                const _HistoryItem(
                  year: '2026',
                  title: 'Dusty Draft trademark registered',
                ),
                const SizedBox(height: 64),
                _sectionTitle('BRANDS'),
                const SizedBox(height: 24),
                const Text(
                  'Dusty Draft',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 4),
                const Text(
                  'Projects, archive and experiments.',
                ),
                const SizedBox(height: 24),
                const Text(
                  'Exotic Ordinary',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 4),
                const Text(
                  'Jewelry, boutique and creative contents.',
                ),
                const SizedBox(height: 24),
                const Text(
                  'ASSETPICKER',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 4),
                const Text(
                  'Research, investing and asset tools.',
                ),
                const SizedBox(height: 64),
                _sectionTitle('ECOSYSTEM'),
                const SizedBox(height: 24),
                ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.asset(
                    'assets/draft/draft_ecosystem.png',
                  ),
                ),
                const SizedBox(height: 64),
                _sectionTitle('NETWORK'),
                const SizedBox(height: 24),

                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: _websiteBlock(
                        context,
                        'Dusty Studio',
                        DraftUrls.dustyStudio,
                        'Consulting & Development',
                      ),
                    ),
                    Expanded(
                      child: _websiteBlock(
                        context,
                        'YouTube',
                        DraftUrls.exoticArchive,
                        '@exoticordinary',
                      ),
                    ),
                    Expanded(
                      child: _websiteBlock(
                        context,
                        'Blog',
                        DraftUrls.assetPicker,
                        'ASSETPICKER',
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 64),
                _sectionTitle('BUSINESS'),
                const SizedBox(height: 20),
                const Text(
                  '사업자등록번호 : 756-66-00303',
                ),
                const SizedBox(height: 8),
                const Text(
                  '통신판매업신고번호 : 2020-서울양천-0014',
                ),
                const SizedBox(height: 16),
                const Text(
                  'soyoung@draft.best',
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 16),
                Text(
                  '© 2019-${DateTime.now().year} DRAFT Co. All rights reserved.',
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

  static Widget _brandBlock(
    String title,
    String description,
  ) {
    return Column(
      children: [
        Text(
          title,
          textAlign: TextAlign.start,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
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
              launchURL(
                targetUrl,
                context,
              );
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
            style: const TextStyle(
              fontSize: 12,
              color: Colors.grey,
            ),
          ),
        ],
      ),
    );
  }
}

class _HistoryItem extends StatelessWidget {
  final String year;
  final String title;

  const _HistoryItem({
    required this.year,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
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
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Expanded(
            child: Text(
              title,
              style: const TextStyle(
                fontSize: 16,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
