import 'package:draft_home/constants/urls.dart';
import 'package:draft_home/utils/url_utils.dart';
import 'package:draft_home/widgets/app_bar.dart';
import 'package:draft_home/widgets/common_drawer.dart';
import 'package:draft_home/widgets/footer.dart';
import 'package:flutter/material.dart';
import 'package:draft_home/themes/color_set.dart';

class AssetPickerPage extends StatelessWidget {
  const AssetPickerPage({super.key});
//https://blog.naver.com/assetpicker
  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    final colorSet =
        isDark ? darkModeAssetpickerColorSet : lightModeAssetpickerColorSet;

    final gradientColors =
        isDark ? assetpickerDarkGradient : assetpickerLightGradient;

    return Scaffold(
      endDrawer: const CommonDrawer(
        pageKey: 'assetpicker',
      ),
      appBar: CommonAppBar(
        pageKey: 'assetpicker',
      ),
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
    return SizedBox(
      width: double.infinity,
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
                  _buildHero(colorSet),
                  const SizedBox(height: 100),
                  _buildResearch(
                    context,
                    colorSet,
                  ),
                  const SizedBox(height: 100),
                  _buildAreas(
                    colorSet,
                  ),
                  const SizedBox(height: 100),
                  _buildCityTracer(
                    context,
                    colorSet,
                  ),
                  const SizedBox(height: 100),
                  _buildAbout(
                    colorSet,
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
    Map<String, Color> colorSet,
  ) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'ASSETPICKER™',
          style: TextStyle(
            fontSize: 42,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 12),
        Text(
          'Pick the Best Asset.',
          style: TextStyle(
            fontSize: 20,
            fontStyle: FontStyle.italic,
            color: Colors.grey,
          ),
        ),
        SizedBox(height: 24),
        Text(
          'Real estate, urban research and market intelligence.',
          style: TextStyle(
            fontSize: 18,
            height: 1.8,
          ),
        ),
        SizedBox(height: 12),
        Text(
          'Recording places, analyzing assets and following the flow of cities.',
          style: TextStyle(
            fontSize: 16,
            color: Colors.grey,
            height: 1.6,
          ),
        ),
      ],
    );
  }

  Widget _buildResearch(
    BuildContext context,
    Map<String, Color> colorSet,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _sectionTitle('Research', colorSet),
        _linkItem(
            context,
            'AP Research',
            'Real Estate, Urban Research & Investment Notes',
            DraftUrls.assetPicker,
            colorSet),
      ],
    );
  }

  Widget _buildAreas(
    Map<String, Color> colorSet,
  ) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Areas',
          style: TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 24),
        Text(
          'Real Estate',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
        SizedBox(height: 8),
        Text(
          'Property analysis, transactions and market research.',
        ),
        SizedBox(height: 32),
        Text(
          'Urban Research',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
        SizedBox(height: 8),
        Text(
          'Cities, neighborhoods and local economic activity.',
        ),
        SizedBox(height: 32),
        Text(
          'Asset Intelligence',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
        SizedBox(height: 8),
        Text(
          'Cash flow, investment structure and asset strategy.',
        ),
      ],
    );
  }

  Widget _buildTimeline(Map<String, Color> colorSet) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _sectionTitle(
          'Timeline',
          colorSet,
        ),
        _timelineItem(
          '2024',
          'AssetPicker research archive launched',
        ),
        _timelineItem(
          '2025',
          'AP Research framework introduced',
        ),
        _timelineItem(
          '2026',
          'ASSETPICKER trademark filed',
        ),
      ],
    );
  }

  Widget _timelineItem(
    String year,
    String text,
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
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Expanded(
            child: Text(
              text,
              style: const TextStyle(
                fontSize: 18,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCityTracer(
    BuildContext context,
    Map<String, Color> colorSet,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _sectionTitle(
          'City Tracer',
          colorSet,
        ),
        _linkItem(
          context,
          'Explore City Tracer',
          'Cities, neighborhoods and real estate stories.',
          'https://blog.naver.com/assetpicker/224289835524',
          colorSet,
        ),
        const SizedBox(height: 6),
        Text(
          'An ongoing project documenting places, properties and urban life through research, field notes and storytelling.',
          style: TextStyle(
            height: 1.7,
            color: colorSet['textSecondaryColor'],
          ),
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
          'Commercial Real Estate Agent',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: colorSet['textPrimaryColor'],
          ),
        ),
        const SizedBox(height: 8),
        Text(
          'Specializing in commercial properties, factories,\nwarehouses and land.',
          style: TextStyle(
            color: colorSet['textSecondaryColor'],
            height: 1.6,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          'Providing market research, location analysis\nand real estate intelligence.',
          style: TextStyle(
            color: colorSet['textSecondaryColor'],
            height: 1.6,
          ),
        ),
      ],
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
