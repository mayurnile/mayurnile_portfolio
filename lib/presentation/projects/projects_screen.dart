import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

import '../widgets/widgets.dart';

import '../../core/core.dart';

class ProjectsScreen extends StatelessWidget {
  const ProjectsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // App Bar
          const ProjectsAppBar(),
          // Body
          Expanded(
            child: LayoutBuilder(
                builder: (BuildContext _, BoxConstraints constraints) {
              return CenteredContent(
                builder: (BuildContext ctx, ScrollController controller) {
                  locator
                      .get<NavBarController>()
                      .projectsScreenScrollController = controller;

                  // if (constraints.maxWidth > DeviceBreakpoints.desktopWidth) {
                  //   return SmoothScroll(
                  //     controller: controller,
                  //     child: _buildScreensList(
                  //       context: context,
                  //       controller: controller,
                  //       isNeverScroll: true,
                  //     ),
                  //   );
                  // } else {
                  return _buildScreensList(
                    context: context,
                    controller: controller,
                    isNeverScroll: false,
                  );
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
      AllProjectsScreen(key: navBarController.allProjectsGlobalKey),
      ExperimentsScreen(key: navBarController.experimentsGlobalKey),
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
