/* lib/widgets/common_drawer.dart */

import 'package:draft_home/constants/urls.dart';
import 'package:draft_home/utils/url_utils.dart';
import 'package:flutter/material.dart';

class CommonDrawer extends StatelessWidget {
  const CommonDrawer({
    required this.pageKey,
    super.key,
  });

  final String pageKey;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.fromLTRB(
                24,
                24,
                24,
                32,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'DRAFT Co.',
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Independent Brands · Contents · Tools',
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 24,
              ),
              child: Text(
                'Brands & Ventures',
                style: TextStyle(
                  fontSize: 11,
                  letterSpacing: 2,
                  color: Colors.grey,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            const SizedBox(height: 12),
            _drawerItem(
              context,
              'Company',
              '/company',
            ),
            _drawerItem(
              context,
              'Ordinary Life',
              '/ordinary',
            ),
            _drawerItem(
              context,
              'Exotic Ordinary',
              '/exotic',
            ),
            _drawerItem(
              context,
              'Dusty Draft',
              '/dusty',
            ),
            // _drawerItem(
            //   context,
            //   'The Exotic Boutique',
            //   '/boutique',
            // ),
            const SizedBox(height: 24),
            const Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 24,
              ),
              child: Text(
                'Tools',
                style: TextStyle(
                  fontSize: 11,
                  letterSpacing: 2,
                  color: Colors.grey,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            const SizedBox(height: 12),
            _urlItem(
              context,
              'ASSETPICKER',
              DraftUrls.assetPicker,
            ),
            // _drawerItem(
            //   context,
            //   'ASSET Lab',
            //   '/assetlab',
            // ),
            const Spacer(),
            const Padding(
              padding: EdgeInsets.all(24),
              child: Text(
                'draft.best',
                style: TextStyle(
                  color: Colors.grey,
                  letterSpacing: 2,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  static Widget _drawerItem(
    BuildContext context,
    String title,
    String route,
  ) {
    return InkWell(
      onTap: () {
        Navigator.pop(context);
        Navigator.pushNamed(
          context,
          route,
        );
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 24,
          vertical: 14,
        ),
        child: Text(
          title,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }

  static Widget _urlItem(
    BuildContext context,
    String title,
    String url,
  ) {
    return InkWell(
      onTap: () {
        Navigator.pop(context);

        launchURL(
          url,
          context,
        );
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 24,
          vertical: 14,
        ),
        child: Text(
          title,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
