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
                      _buildDevelopmentStudio(
                        context,
                        dustyColorSet,
                      ),
                      const SizedBox(height: 80),
                      _buildInnovationLab(
                        context,
                        dustyColorSet,
                      ),
                      const SizedBox(height: 80),
                      _buildAbout(
                        dustyColorSet,
                      ),
                      const SizedBox(height: 80),
                      _buildWebsite(
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

  // Widget _buildBody(BuildContext context) {
  //   return const Center(
  //     child: Text(
  //       'BODY TEST',
  //       style: TextStyle(
  //         fontSize: 40,
  //         color: Colors.red,
  //       ),
  //     ),
  //   );
  // }
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
          'Development Studio & Product Lab',
          style: TextStyle(
            fontSize: 20,
            fontStyle: FontStyle.italic,
            color: colorSet['textSecondaryColor'],
          ),
        ),
        const SizedBox(height: 24),
        Text(
          'An independent studio \nfor AI, software and digital ventures.',
          style: TextStyle(
            fontSize: 18,
            height: 1.8,
            color: colorSet['textPrimaryColor'],
          ),
        ),
      ],
    );
  }

  Widget _buildDevelopmentStudio(
    BuildContext context,
    Map<String, Color> colorSet,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _sectionTitle(
          'Development Studio',
          colorSet,
        ),
        // const SizedBox(height: ),
        Text(
          'Notes, code and stories behind our work.',
          style: TextStyle(
            fontSize: 14,
            height: 1.8,
            color: colorSet['textPrimaryColor'],
          ),
        ),
        const SizedBox(height: 30),
        _linkItem(
          context,
          '랄라선녀의 테크일기',
          'Technical Notes & Build Logs',
          'https://blog.naver.com/ralalife',
          colorSet,
        ),
        _linkItem(
          context,
          'GitHub',
          'Projects, Source Code & Experiments',
          'https://github.com/dusty-agent',
          colorSet,
        ),
        _linkItem(
          context,
          'YouTube',
          'Studio Films & Product Stories',
          DraftUrls.dustyArchive,
          colorSet,
        ),
      ],
    );
  }

  Widget _buildInnovationLab(
    BuildContext context,
    Map<String, Color> colorSet,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _sectionTitle(
          'Innovation Lab',
          colorSet,
        ),
        const SizedBox(height: 5),
        Text(
          'Where ideas are tested before becoming products.',
          style: TextStyle(
            fontSize: 14,
            height: 1.8,
            color: colorSet['textPrimaryColor'],
          ),
        ),
        const SizedBox(height: 30),
        _linkItem(
          context,
          'Dustie',
          'AI Assistant Sandbox',
          DraftUrls.dustyAgent,
          colorSet,
        ),
        _linkItem(
          context,
          'Painter',
          'Creative Generation Sandbox',
          DraftUrls.painter,
          colorSet,
        ),
        _linkItem(
          context,
          'Meemo',
          'Knowledge Workspace Sandbox',
          DraftUrls.meemo,
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
        _sectionTitle(
          'About',
          colorSet,
        ),
        Text(
          'Part of DRAFT House',
          style: TextStyle(
            color: colorSet['textSecondaryColor'],
          ),
        ),
        const SizedBox(height: 8),
        Text(
          'AI Strategy & Product Studio',
          style: TextStyle(
            color: colorSet['textSecondaryColor'],
          ),
        ),
        const SizedBox(height: 8),
        Text(
          'From validation to implementation.',
          style: TextStyle(
            color: colorSet['textSecondaryColor'],
          ),
        ),
        const SizedBox(height: 8),
      ],
    );
  }

  Widget _buildWebsite(
    BuildContext context,
    Map<String, Color> colorSet,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _sectionTitle(
          'Website',
          colorSet,
        ),
        InkWell(
          onTap: () {
            launchURL(
              'https://www.dustydraft.com',
              context,
            );
          },
          child: Text(
            'dustydraft.com →',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: colorSet['textPrimaryColor'],
            ),
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
