import 'package:draft_home/widgets/app_bar.dart';
import 'package:draft_home/widgets/drawer.dart';
import 'package:draft_home/widgets/footer.dart';
import 'package:flutter/material.dart';

class ContactPage extends StatelessWidget {
  const ContactPage({super.key});

  @override
  Widget build(BuildContext context) {
    String logoPath = 'assets/logo_symbol_draft.png';
    return Scaffold(
      drawer: CommonDrawer(),
      appBar: CommonAppBar(logoPath: logoPath),
      // drawer: CommonDrawer(),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 40),
              Text(
                'Core mission of creating ordinary life-style with you.',
                style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.normal,
                    color: const Color.fromARGB(255, 225, 200, 200)),
              ),
              SizedBox(height: 40),
              Image.asset('assets/symbol_about_us.png', height: 200),
              SizedBox(height: 40),
              Card(
                elevation: 0,
                color: Colors.transparent,
                child: Image.asset('assets/about_us.png', width: 700),
                // elevation: 5,
                // color: Color.fromARGB(255, 247, 239, 173),
                // child: Padding(
                //   padding: EdgeInsets.symmetric(vertical: 16, horizontal: 40),
                //   child: Text(
                //     'Visit Offline Shop in Seoul, The Exotic Boutique.',
                //     style: TextStyle(fontSize: 18, color: Colors.black),
                //   ),
                // ),
              ),
              SizedBox(height: 40),
            ],
          ),
        ),
      ),
      bottomNavigationBar: buildFooter(context),
      backgroundColor: Colors.black,
    );
  }
}
