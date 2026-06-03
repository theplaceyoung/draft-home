import 'package:draft_home/pages/about_page.dart';
import 'package:draft_home/pages/private_policy_page.dart';
import 'package:draft_home/pages/terms_of_service_page.dart';
import 'package:flutter/material.dart';

Widget buildFooter(BuildContext context) {
  return Container(
    color: const Color(0xFF111111),
    padding: const EdgeInsets.all(16),
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        TextButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => const AboutPage(),
              ),
            );
          },
          child: const Text(
            'About',
            style: TextStyle(
              color: Color(0xFFE6B800),
            ),
          ),
        ),
        _buildFooterLinks(context),
        const SizedBox(height: 8),
        Text(
          '© 2019-${DateTime.now().year} DRAFT Co.',
          style: const TextStyle(
            fontSize: 12,
            color: Colors.white54,
          ),
        ),
      ],
    ),
  );
}

Widget _buildFooterLinks(BuildContext context) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      TextButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => const PrivacyPolicyPage(),
            ),
          );
        },
        child: const Text(
          'Privacy Policy',
          style: TextStyle(
            color: Color(0xFFE6B800),
          ),
        ),
      ),
      const Text(
        '|',
        style: TextStyle(
          color: Colors.white38,
        ),
      ),
      TextButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => const TermsOfServicePage(),
            ),
          );
        },
        child: const Text(
          'Terms of Service',
          style: TextStyle(
            color: Color(0xFFE6B800),
          ),
        ),
      ),
    ],
  );
}

void _navigateTo(BuildContext context, Widget page) {
  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => page),
  );
}
