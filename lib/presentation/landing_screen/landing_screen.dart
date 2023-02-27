import 'package:dyn_mouse_scroll/dyn_mouse_scroll.dart';
import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

import '../widgets/widgets.dart';

import '../../core/core.dart';

class LandingScreen extends StatelessWidget {
  const LandingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // App Bar
          const MyAppBar(),
          // Body
          Expanded(
            child: LayoutBuilder(builder: (BuildContext _, BoxConstraints constraints) {
              return CenteredContent(
                builder: (BuildContext ctx, ScrollController controller) {
                  locator.get<NavBarController>().landingScreenScrollController = controller;
                  final NavBarController navBarController = locator.get<NavBarController>();

                  final List<Widget> screens = [
                    HomeScreen(key: navBarController.homeGlobalKey),
                    SkillsScreen(key: navBarController.skillsGlobalKey),
                    MyProjectsScreen(key: navBarController.myWorkGlobalKey),
                    ContactScreen(key: navBarController.contactGlobalKey),
                  ];
                  // if (constraints.maxWidth > DeviceBreakpoints.desktopWidth) {
                  // return _buildScreensList(context: context, controller: controller, isNeverScroll: false);
                  return DynMouseScroll(
                      // controller: controller,
                      builder: (context, controller, physics) => ListView(
                            controller: controller,
                            physics: physics,
                            children: screens,
                          )
                      // _buildScreensList(
                      //   context: context,
                      //   controller: controller,
                      //   isNeverScroll: false,
                      // ),
                      );
                  // } else {
                  //   return _buildScreensList(
                  //     context: context,
                  //     controller: controller,
                  //     isNeverScroll: false,
                  //   );
                  // }
                },
              );
            }),
          ),
        ],
      ),
    );
  }

  /// Builder Functions
  ///
  ///
  Widget _buildScreensList({
    required BuildContext context,
    required ScrollController controller,
    required bool isNeverScroll,
  }) {
    final NavBarController navBarController = locator.get<NavBarController>();

    final List<Widget> screens = [
      HomeScreen(key: navBarController.homeGlobalKey),
      SkillsScreen(key: navBarController.skillsGlobalKey),
      MyProjectsScreen(key: navBarController.myWorkGlobalKey),
      ContactScreen(key: navBarController.contactGlobalKey),
    ];

    return ScrollConfiguration(
      behavior: ScrollConfiguration.of(context).copyWith(
        scrollbars: false,
        dragDevices: {
          PointerDeviceKind.touch,
          PointerDeviceKind.mouse,
          PointerDeviceKind.unknown,
        },
      ),
      child: AnimationLimiter(
        child: SingleChildScrollView(
          controller: controller,
          physics: isNeverScroll
              ? const NeverScrollableScrollPhysics()
              : const AlwaysScrollableScrollPhysics(
                  parent: BouncingScrollPhysics(),
                ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: screens,
          ),
        ),
      ),
    );
  }
}
