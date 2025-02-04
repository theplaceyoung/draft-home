import 'package:draft_home/pages/private_policy_page.dart';
import 'package:draft_home/pages/terms_of_service_page.dart';
import 'package:flutter/material.dart';

Widget buildFooter(BuildContext context) {
  return Container(
    color: const Color.fromARGB(255, 238, 230, 230), // Footer background color
    padding: const EdgeInsets.symmetric(vertical: 12.0),
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        _buildFooterLinks(context),
        const SizedBox(height: 8),
        const Text(
          '© 2025 Draft Co. All rights reserved.',
          style: TextStyle(fontSize: 14, color: Colors.black54),
          textAlign: TextAlign.center,
        ),
      ],
    ),
  );
}

Widget _buildFooterLinks(BuildContext context) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      _buildFooterLink(
        context,
        label: 'Privacy Policy',
        onTap: () => _navigateTo(context, const PrivacyPolicyPage()),
      ),
      const SizedBox(width: 8),
      const Text('|', style: TextStyle(fontSize: 14, color: Colors.black54)),
      const SizedBox(width: 8),
      _buildFooterLink(
        context,
        label: 'Terms of Service',
        onTap: () => _navigateTo(context, const TermsOfServicePage()),
      ),
    ],
  );
}

Widget _buildFooterLink(BuildContext context,
    {required String label, required VoidCallback onTap}) {
  return TextButton(
    onPressed: onTap,
    child: Text(
      label,
      style: const TextStyle(
          fontSize: 14, color: Color.fromARGB(255, 235, 191, 16)),
    ),
  );
}

void _navigateTo(BuildContext context, Widget page) {
  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => page),
  );
}
