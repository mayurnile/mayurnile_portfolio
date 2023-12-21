import 'package:flutter/material.dart';

import '../../core/core.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    locator.get<NavBarController>().navigateToLandingScreen();

    return Scaffold(
      body: Center(
        child: Image.asset(AnimationAssets.loading),
      ),
    );
  }
}
