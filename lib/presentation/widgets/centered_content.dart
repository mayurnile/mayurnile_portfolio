import 'package:flutter/material.dart';

import './widgets.dart';

import '../../core/core.dart';

typedef CenteredContentWidgetBuilder = Widget Function(BuildContext context, ScrollController controller);

class CenteredContent extends StatelessWidget {
  final CenteredContentWidgetBuilder builder;
  const CenteredContent({Key? key, required this.builder}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final TextTheme textTheme = Theme.of(context).textTheme;
    final ScrollController controller = ScrollController();

    return LayoutBuilder(
      builder: (BuildContext _, BoxConstraints constraints) {
        double horizontalPadding = 42.0;

        if (constraints.maxWidth > tabletWidth) {
          horizontalPadding = 120.0;
        } else if (constraints.maxWidth > mobileWidth) {
          horizontalPadding = 72.0;
        }

        return Scrollbar(
          controller: controller,
          interactive: true,
          isAlwaysShown: true,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
            child: Row(
              children: [
                // left bar
                if (constraints.maxWidth > tabletWidth) _buildLeftBar(size),
                // center child
                Expanded(
                  child: builder(context, controller),
                ),
                // right bar
                if (constraints.maxWidth > tabletWidth) _buildRightBar(size, textTheme)
              ],
            ),
          ),
        );
      },
    );
  }

  /// Builder Functions
  ///
  ///
  Widget _buildLeftBar(Size size) => Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          // social icons
          // github
          const SocialLinkButton(icon: IconAssets.github, type: SocialLinkType.github),
          // linkedin
          const SocialLinkButton(icon: IconAssets.linkedin, type: SocialLinkType.linkedin),
          // discord
          const SocialLinkButton(icon: IconAssets.discord, type: SocialLinkType.discord),
          // accent line
          Container(
            height: size.height * 0.3,
            width: 2.0,
            color: AppTheme.fontLightColor,
          ),
        ],
      );

  Widget _buildRightBar(Size size, TextTheme textTheme) => Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          // my email
          Transform.translate(
            offset: const Offset(2.0, 0.0),
            child: RotatedBox(
              quarterTurns: 1,
              child: Text(
                'mayurnile95@gmail.com',
                style: textTheme.headline4!.copyWith(color: AppTheme.fontLightColor),
              ),
            ),
          ),
          // spacing
          const SizedBox(height: 22.0),
          // accent line
          Container(
            height: size.height * 0.15,
            width: 2.0,
            color: AppTheme.fontLightColor,
          ),
        ],
      );
}
