import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class PrivacyPolicyPage extends StatelessWidget {
  const PrivacyPolicyPage({super.key});

  Future<String> _loadPrivacyPolicy() async {
    final String response =
        await rootBundle.loadString('lib/contents/PrivacyPolicy.md');
    return response;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Privacy Policy')),
      body: FutureBuilder<String>(
        future: _loadPrivacyPolicy(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(snapshot.data!),
            );
          } else if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else {
            return Center(child: Text('Error loading privacy policy.'));
          }
        },
      ),
    );
  }
}
