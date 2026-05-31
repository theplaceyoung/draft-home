import 'package:draft_home/widgets/app_bar.dart';
import 'package:flutter/material.dart';

class AssetLabPage extends StatelessWidget {
  const AssetLabPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBar(
        pageKey: 'assetlab',
      ),
      body: const Center(
        child: Text('ASSETlab'),
      ),
    );
  }
}
