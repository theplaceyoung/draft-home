import 'package:draft_home/constants/urls.dart';
import 'package:draft_home/utils/card_button.dart' as cardButton;
import 'package:draft_home/themes/color_set.dart';
import 'package:draft_home/utils/card_button_with_text_over_image.dart'
    as cardButtonWithTextOverImage;
import 'package:draft_home/utils/url_utils.dart';
import 'package:draft_home/widgets/app_bar.dart';
import 'package:draft_home/widgets/common_drawer.dart';
import 'package:draft_home/widgets/footer.dart';
import 'package:flutter/material.dart';

class ExoticOrdinaryPage extends StatelessWidget {
  const ExoticOrdinaryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: const CommonDrawer(
        pageKey: 'exotic',
      ),
      appBar: CommonAppBar(
        pageKey: 'exotic',
      ),
      body: SingleChildScrollView(
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
                  const Text(
                    'EXOTIC ORDINARY',
                    style: TextStyle(
                      fontSize: 42,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 12),
                  const Text(
                    'Beauty in the Mirror.',
                    style: TextStyle(
                      fontSize: 18,
                      fontStyle: FontStyle.italic,
                      color: Colors.grey,
                    ),
                  ),
                  const SizedBox(height: 12),
                  const Text(
                    'Jewelry, boutique and creative contents.',
                    style: TextStyle(
                      fontSize: 18,
                      height: 1.8,
                    ),
                  ),
                  const SizedBox(height: 80),
                  _linkButton(
                    context,
                    'Instagram',
                    DraftUrls.exoticInstagram,
                  ),
                  const SizedBox(height: 16),
                  _linkButton(
                    context,
                    'YouTube',
                    DraftUrls.exoticArchive,
                  ),
                  const SizedBox(height: 16),
                  _linkButton(
                    context,
                    'Official Website',
                    DraftUrls.exoticOrdinary,
                  ),
                  const SizedBox(height: 16),
                  _linkButton(
                    context,
                    'The Exotic Boutique',
                    DraftUrls.theExoticBoutique,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      bottomNavigationBar: buildFooter(context),
    );
  }

  static Widget _linkButton(
    BuildContext context,
    String title,
    String url,
  ) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: InkWell(
        onTap: () {
          launchURL(
            url,
            context,
          );
        },
        child: Text(
          title,
          style: const TextStyle(
            fontSize: 18,
            decoration: TextDecoration.underline,
          ),
        ),
      ),
    );
  }
}
