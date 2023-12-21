import 'package:flutter/material.dart';

import '../../core/core.dart';

class AppLogo extends StatefulWidget {
  final bool isHome;

  const AppLogo({super.key, this.isHome = true});

  @override
  State<AppLogo> createState() => _AppLogoState();
}

class _AppLogoState extends State<AppLogo> {
  // data variables
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.isHome ? navigateToTop : navigateToHome,
      child: MouseRegion(
        onEnter: (_) => setState(() => isHovered = true),
        onExit: (_) => setState(() => isHovered = false),
        child: Padding(
          padding: const EdgeInsets.all(22.0),
          child: isHovered ? Image.asset(AnimationAssets.reverseLoading) : Image.asset(AnimationAssets.logo),
        ),
      ),
    );
  }

  /// Member Functions
  ///
  ///
  void navigateToTop() {
    final NavBarController navBarController = locator.get<NavBarController>();
    final RenderObject? renderObject = navBarController.homeGlobalKey.currentContext?.findRenderObject();
    if (renderObject != null) {
      navBarController.landingScreenScrollController.position.ensureVisible(
        renderObject,
        duration: const Duration(seconds: 1),
        curve: Curves.easeInOutCubic,
      );
    }
  }

  void navigateToHome() {
    locator.get<NavigationService>().removeAllAndPush(AppRoutes.landingRoute);
  }
}
