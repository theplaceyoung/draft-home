import 'package:draft_co/widgets/common_app_bar.dart';
import 'package:draft_co/widgets/common_drawer.dart';
import 'package:draft_co/widgets/footer.dart';
import 'package:flutter/material.dart';

class ContactPage extends StatelessWidget {
  const ContactPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBar(),
      drawer: Drawer(
        child: CommonDrawer(),
        elevation: 10,
        shadowColor: Colors.black.withOpacity(0.2),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('background_1.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 40),
                Text(
                  '** About Us **',
                  style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
                SizedBox(height: 20),
                Image.asset('assets/symbol_about_us.png', height: 200),
                SizedBox(height: 20),
                Card(
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
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: buildFooter(context),
    );
  }
}
