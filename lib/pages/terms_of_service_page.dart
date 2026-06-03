import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TermsOfServicePage extends StatelessWidget {
  //서비스 약관
  const TermsOfServicePage({super.key});

  Future<String> _loadTermsOfService() async {
    final String response =
        await rootBundle.loadString('lib/contents/TermsOfService.md');
    return response;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '이용 약관 | Terms of Service',
          style: TextStyle(
            color: Colors.black, // Change the title color here
          ),
        ),
        iconTheme: IconThemeData(
          color: Colors.black, // Change the back icon color here
        ),
      ),
      body: FutureBuilder<String>(
        future: _loadTermsOfService(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(snapshot.data!),
            );
          } else if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else {
            return Center(child: Text('Error loading terms of service.'));
          }
        },
      ),
    );
  }
}
