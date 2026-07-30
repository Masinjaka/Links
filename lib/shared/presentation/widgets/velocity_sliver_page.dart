import 'package:flutter/material.dart';

import 'package:linkvault/app/linkvault_theme.dart';

class VelocitySliverPage extends StatelessWidget {
  const VelocitySliverPage({super.key, required this.slivers, this.overlay});

  final List<Widget> slivers;
  final Widget? overlay;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: LinkVaultThemeTokens.background(context),
      body: Stack(
        children: [
          Positioned.fill(
            child: SafeArea(
              bottom: false,
              child: CustomScrollView(slivers: slivers),
            ),
          ),
          ?overlay,
        ],
      ),
    );
  }
}
