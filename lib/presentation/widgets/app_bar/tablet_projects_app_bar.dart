import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../core/core.dart';

class TabletProjectsAppBar extends StatelessWidget {
  final bool isMobile;

  const TabletProjectsAppBar({
    super.key,
    required this.isMobile,
  });

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Container(
      width: size.width,
      height: size.height * 0.1,
      padding: isMobile
          ? const EdgeInsets.symmetric(
              horizontal: 32.0,
            )
          : const EdgeInsets.symmetric(
              horizontal: 72.0,
            ),
      child: Row(
        children: [
          // app logo
          GestureDetector(
            onTap: () {
              final NavBarController navBarController = locator.get<NavBarController>();
              final RenderObject? renderObject = navBarController.homeGlobalKey.currentContext?.findRenderObject();
              if (renderObject != null) {
                navBarController.landingScreenScrollController.position.ensureVisible(
                  renderObject,
                  duration: const Duration(seconds: 1),
                  curve: Curves.easeInOutCubic,
                );
              }
            },
            child: SvgPicture.asset(
              IconAssets.appLogo,
              height: 42.0,
              width: 72.0,
            ),
          ),
        ],
      ),
    );
  }
}
