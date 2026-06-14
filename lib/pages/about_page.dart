import 'package:draft_home/constants/urls.dart';
import 'package:draft_home/utils/url_utils.dart';
import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

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
                  MouseRegion(
                    cursor: SystemMouseCursors.click,
                    child: InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, '/');
                      },
                      child: const Text(
                        'DRAFT House',
                        style: TextStyle(
                          fontSize: 24,
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
                  const SizedBox(height: 12),
                  const Text(
                    'Independent brands, contents and tools.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 15,
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    'New Era, Growing Value.\nHere to Support You.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 13,
                      color: Colors.grey,
                    ),
                  ),
                  const SizedBox(height: 56),
                  _sectionTitle('BRANDS'),
                  const SizedBox(height: 28),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: _brandBlock(
                          'Dusty Draft®',
                          'Projects, archive and experiments.\n'
                              'An ongoing record of ideas and stories.',
                        ),
                      ),
                      const SizedBox(width: 24),
                      Expanded(
                        child: _brandBlock(
                          'Exotic Ordinary®',
                          'Ordinary to Extraordinary.\n'
                              'Jewelry, boutique and creative contents.',
                        ),
                      ),
                      const SizedBox(width: 24),
                    ],
                  ),
                  const SizedBox(height: 56),
                  _sectionTitle('NETWORK'),
                  const SizedBox(height: 28),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: _websiteBlock(
                          context,
                          'Dusty Studio',
                          DraftUrls.fairyRala,
                          'Consulting & Development',
                        ),
                      ),
                      const SizedBox(width: 24),
                      Expanded(
                        child: _websiteBlock(
                          context,
                          'Exotic Archive',
                          DraftUrls.exoticArchive,
                          'YouTube Channel',
                        ),
                      ),
                      const SizedBox(width: 24),
                      Expanded(
                        child: _websiteBlock(
                          context,
                          'ASSETPICKER',
                          DraftUrls.assetPicker,
                          'Research Blog',
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 56),
                  _sectionTitle('WEBSITES'),
                  const SizedBox(height: 28),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: _websiteBlock(
                          context,
                          'draft.best',
                          DraftUrls.draft,
                          'Official Portal',
                        ),
                      ),
                      Expanded(
                        child: _websiteBlock(
                          context,
                          'dustydraft.com',
                          DraftUrls.dustyDraft,
                          'Projects & Archive',
                        ),
                      ),
                      Expanded(
                        child: _websiteBlock(
                          context,
                          'exoticordinary.com',
                          DraftUrls.exoticOrdinary,
                          'Boutique & Contents',
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 56),
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
                  const Text(
                    'soyoung@draft.best',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 24),
                  Text(
                    '© 2019-${DateTime.now().year} DRAFT House All rights reserved.',
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

  static Widget _sectionTitle(String title) {
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

  static Widget _brandBlock(
    String title,
    String description,
  ) {
    return Column(
      children: [
        Text(
          title,
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            letterSpacing: -0.3,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          description,
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontSize: 13,
            color: Colors.grey,
            height: 1.5,
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
              textAlign: TextAlign.center,
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
            textAlign: TextAlign.center,
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
