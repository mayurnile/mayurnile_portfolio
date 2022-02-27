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
                  if (constraints.maxWidth > DeviceBreakpoints.tabletWidth) {
                    return SmoothScroll(
                      controller: controller,
                      child: ScrollConfiguration(
                        behavior: ScrollConfiguration.of(context).copyWith(
                          scrollbars: false,
                          dragDevices: {
                            PointerDeviceKind.touch,
                            PointerDeviceKind.mouse,
                            PointerDeviceKind.unknown,
                          },
                        ),
                        child: _buildScreensList(controller, true),
                      ),
                    );
                  } else {
                    return ScrollConfiguration(
                      behavior: ScrollConfiguration.of(context).copyWith(
                        scrollbars: false,
                        dragDevices: {
                          PointerDeviceKind.touch,
                          PointerDeviceKind.mouse,
                          PointerDeviceKind.unknown,
                        },
                      ),
                      child: _buildScreensList(controller, false),
                    );
                  }
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
  Widget _buildScreensList(ScrollController controller, bool isNeverScroll) => AnimationLimiter(
        child: ListView(
          controller: controller,
          physics: isNeverScroll
              ? const NeverScrollableScrollPhysics()
              : const AlwaysScrollableScrollPhysics(
                  parent: BouncingScrollPhysics(),
                ),
          children: const [
            HomeScreen(),
            SkillsScreen(),
            MyProjectsScreen(),
            ContactScreen(),
          ],
        ),
      );
}
