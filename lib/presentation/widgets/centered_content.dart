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
    final ScrollController controller = ScrollController(keepScrollOffset: true);

    return LayoutBuilder(
      builder: (BuildContext _, BoxConstraints constraints) {
        double horizontalPadding = 42.0;

        if (constraints.maxWidth > DeviceBreakpoints.desktopWidth) {
          horizontalPadding = 120.0;
        } else if (constraints.maxWidth > DeviceBreakpoints.tabletWidth) {
          horizontalPadding = 72.0;
        }

        return Scrollbar(
          controller: controller,
          interactive: true,
          thumbVisibility: true,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
            child: Row(
              children: [
                // left bar
                if (constraints.maxWidth > DeviceBreakpoints.desktopWidth) _buildLeftBar(size),
                // center child
                Expanded(
                  child: builder(context, controller),
                ),
                // right bar
                if (constraints.maxWidth > DeviceBreakpoints.desktopWidth) _buildRightBar(size, textTheme)
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
        children: AnimationConfig.sideBarAnimatedList(
          children: [
            // social icons
            // github
            const SocialLinkButton(icon: IconAssets.github, type: SocialLinkType.github, launchURL: Urls.githubLink),
            // linkedin
            const SocialLinkButton(icon: IconAssets.linkedin, type: SocialLinkType.linkedin, launchURL: Urls.linkedinLink),
            // discord
            const SocialLinkButton(icon: IconAssets.discord, type: SocialLinkType.discord, launchURL: Urls.discordLink),
            // accent line
            Container(
              height: size.height * 0.3,
              width: 2.0,
              color: AppTheme.fontLightColor,
            ),
          ],
        ),
      );

  Widget _buildRightBar(Size size, TextTheme textTheme) => Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.end,
        children: AnimationConfig.sideBarAnimatedList(
          children: [
            // my email
            const _AnimatedEmailLink(),
            // spacing
            const SizedBox(height: 22.0),
            // accent line
            Container(
              height: size.height * 0.15,
              width: 2.0,
              color: AppTheme.fontLightColor,
            ),
          ],
        ),
      );
}

class _AnimatedEmailLink extends StatefulWidget {
  const _AnimatedEmailLink({Key? key}) : super(key: key);

  @override
  State<_AnimatedEmailLink> createState() => __AnimatedEmailLinkState();
}

class __AnimatedEmailLinkState extends State<_AnimatedEmailLink> {
  // state variable
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;

    return GestureDetector(
      onTap: () => Utils.sendEmail(),
      child: MouseRegion(
        onEnter: (_) => setState(() => isHovered = true),
        onExit: (_) => setState(() => isHovered = false),
        child: Transform.translate(
          offset: const Offset(2.0, 0.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // content
              RotatedBox(
                quarterTurns: 1,
                child: AnimatedDefaultTextStyle(
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeInOut,
                  style: textTheme.headline4!.copyWith(color: isHovered ? AppTheme.fontDarkColor : AppTheme.fontLightColor),
                  child: const Text('mayurnile95@gmail.com'),
                ),
              ),
              // sizer container
              AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeInOut,
                height: isHovered ? 18.0 : 0.0,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
