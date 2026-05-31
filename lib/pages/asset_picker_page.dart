import 'package:draft_home/widgets/app_bar.dart';
import 'package:flutter/material.dart';

class AssetPickerPage extends StatelessWidget {
  const AssetPickerPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBar(
        pageKey: 'assetpicker',
      ),
      body: const Center(
        child: Text('ASSETPICKER'),
      ),
    );
  }
}
