import 'package:draft_home/widgets/app_bar.dart';
import 'package:flutter/material.dart';

class VirtualBoutiquePage extends StatelessWidget {
  const VirtualBoutiquePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBar(
        pageKey: 'VirtualBoutique',
      ),
      body: const Center(
        child: Text('Coming Soon'),
      ),
    );
  }
}
