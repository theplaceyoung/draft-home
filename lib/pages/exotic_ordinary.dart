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
                _buildMedia(context, colorSet),
                const SizedBox(height: 100),
                _buildOngoings(context, colorSet),
                const SizedBox(height: 100),
                _buildCraft(
                  colorSet,
                ),
                const SizedBox(height: 100),
                _buildTimeline(colorSet),
                const SizedBox(height: 100),
                _buildAbout(
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
          'Beauty in the Mirror.',
          style: TextStyle(
            fontSize: 20,
            fontStyle: FontStyle.italic,
            color: colorSet['textSecondaryColor'],
          ),
        ),
        const SizedBox(height: 24),
        Text(
          'Beauty, craft and storytelling.',
          style: TextStyle(
            fontSize: 18,
            height: 1.8,
            color: colorSet['textPrimaryColor'],
          ),
        ),
        const SizedBox(height: 12),
        Text(
          'From jewelry and objects to media, archives and future collections.',
          style: TextStyle(
            fontSize: 16,
            height: 1.6,
            color: colorSet['textSecondaryColor'],
          ),
        ),
      ],
    );
  }

  Widget _buildMedia(
    BuildContext context,
    Map<String, Color> colorSet,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _sectionTitle(
          'Channels',
          colorSet,
        ),
        _linkItem(
          context,
          'The Exotic Boutique',
          'Boutique, Warehouse & Selected Collections',
          DraftUrls.theExoticBoutique,
          colorSet,
        ),
        _linkItem(
          context,
          'Instagram',
          'Visual Journal, Daily Stories & New Works',
          DraftUrls.exoticInstagram,
          colorSet,
        ),
        _linkItem(
          context,
          'Archive',
          'Articles, Essays & Editorial Contents',
          DraftUrls.exoticOrdinary,
          colorSet,
        ),
        _linkItem(
          context,
          'YouTube',
          'Short Films, Behind The Scenes & Creative Contents',
          DraftUrls.exoticArchive,
          colorSet,
        ),
      ],
    );
  }

  Widget _buildCraft(
    Map<String, Color> colorSet,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Craft',
          style: TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.bold,
            color: colorSet['textPrimaryColor'],
          ),
        ),
        const SizedBox(height: 20),
        Text(
          'Metal Jewelry Craft Program completed in 2023.',
          style: TextStyle(
            fontSize: 18,
            color: colorSet['textPrimaryColor'],
          ),
        ),
        const SizedBox(height: 12),
        Text(
          'Currently exploring jewelry, objects and future collections.',
          style: TextStyle(
            fontSize: 16,
            color: colorSet['textSecondaryColor'],
          ),
        ),
      ],
    );
  }

  Widget _buildOngoings(
    BuildContext context,
    Map<String, Color> colorSet,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _sectionTitle(
          'The Exotic Boutique',
          colorSet,
        ),
        _linkItem(
          context,
          'Boutique & Warehouse',
          'Actual boutique, custom production and real commerce.',
          DraftUrls.exoticOfficial,
          colorSet,
        ),
        SizedBox(height: 12),
        _linkItem(
          context,
          'The Exotic Voutique™',
          'Virtual boutique, custom production and future commerce.',
          DraftUrls.voutiqueOfficial,
          colorSet,
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
        Text(
          'About',
          style: TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.bold,
            color: colorSet['textPrimaryColor'],
          ),
        ),
        const SizedBox(height: 24),
        Text(
          'Founded in Seoul, 2019',
          style: TextStyle(
            fontSize: 16,
            color: colorSet['textSecondaryColor'],
          ),
        ),
        const SizedBox(height: 8),
        Text(
          'Part of DRAFT House',
          style: TextStyle(
            fontSize: 16,
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
          'Timeline',
          colorSet,
        ),
        const SizedBox(height: 24),
        _timelineItem('2019', 'Exotic Ordinary founded', colorSet),
        _timelineItem(
            '2021', 'Exotic Ordinary Warehouse established', colorSet),
        _timelineItem('2022', 'The Exotic Boutique launched', colorSet),
        _timelineItem(
            '2023', 'Metal Jewelry Craft Program completed', colorSet),
        _timelineItem(
            '2025', 'The Exotic Voutique project initiated', colorSet),
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
    Map<String, Color> colorSet,
  ) {
    return Padding(
      padding: const EdgeInsets.only(
        bottom: 24,
      ),
      child: Text(
        title,
        style: TextStyle(
          fontSize: 28,
          fontWeight: FontWeight.bold,
          color: colorSet['textPrimaryColor'],
        ),
      ),
    );
  }
}
