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
                _buildBrands(context, colorSet),
                const SizedBox(height: 100),
                _buildCreativeDirection(
                  colorSet,
                ),
                const SizedBox(height: 100),
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
        const SizedBox(height: 16),
        Text(
          'Beauty in the Mirror.',
          style: TextStyle(
            fontSize: 22,
            fontStyle: FontStyle.italic,
            color: colorSet['textSecondaryColor'],
          ),
        ),
        const SizedBox(height: 32),
        Text(
          '아름다움을 탐구하는\n독립 브랜드.',
          style: TextStyle(
            fontSize: 20,
            height: 1.8,
            color: colorSet['textPrimaryColor'],
          ),
        ),
      ],
    );
  }

  Widget _buildBrands(
    BuildContext context,
    Map<String, Color> colorSet,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _sectionTitle(
          'Brands',
          '',
          colorSet,
        ),
        _linkItem(
          context,
          'SILVLIN',
          '',
          'Silver For Everyday.',
          'https://exoticordinary.com/silvlin',
          colorSet,
        ),
        _linkItem(
          context,
          'STONIN',
          '',
          'Stone Archive.',
          'https://exoticordinary.com/stonin',
          colorSet,
        ),
        _linkItem(
          context,
          'BOUTIQUE',
          '',
          'Curated Commerce.',
          DraftUrls.exoticOrdinary,
          colorSet,
        ),
        _linkItem(
          context,
          'VOUTIQ™',
          '',
          'Digital Experiences.',
          DraftUrls.voutiqueOfficial,
          colorSet,
        ),
      ],
    );
  }

  Widget _buildCreativeDirection(
    Map<String, Color> colorSet,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _sectionTitle(
          'Creative Direction',
          '',
          colorSet,
        ),
        Text(
          '아름다움을 기록합니다.',
          style: TextStyle(
            fontSize: 24,
            color: colorSet['textPrimaryColor'],
          ),
        ),
        const SizedBox(height: 24),
        Text(
          'Exotic Ordinary는\n아름다움을 탐구하는 독립 브랜드입니다.\n\n'
          'SILVLIN의 실버 컬렉션,\n'
          'STONIN의 원석 아카이브,\n'
          '그리고 VOUTIQ™의 디지털 경험까지.\n\n'
          '우리는 물건과 이야기,\n'
          '그리고 경험을 만듭니다.',
          style: TextStyle(
            fontSize: 18,
            height: 1.8,
            color: colorSet['textPrimaryColor'],
          ),
        ),
        const SizedBox(height: 32),
        Text(
          'So Young Jang',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: colorSet['textPrimaryColor'],
          ),
        ),
        const SizedBox(height: 4),
        Text(
          'Founder & Creative Director',
          style: TextStyle(
            color: colorSet['textSecondaryColor'],
          ),
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
