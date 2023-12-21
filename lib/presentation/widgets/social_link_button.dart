import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../core/core.dart';

class SocialLinkButton extends StatefulWidget {
  final String icon;
  final Color defaultColor;
  final String launchURL;

  const SocialLinkButton({
    super.key,
    required this.icon,
    required this.launchURL,
    this.defaultColor = AppTheme.fontLightColor,
  });

  @override
  State<SocialLinkButton> createState() => _SocialLinkButtonState();
}

class _SocialLinkButtonState extends State<SocialLinkButton> {
  // state variables
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _launchURL,
      child: MouseRegion(
        onEnter: (_) => setState(() => isHovered = true),
        onExit: (_) => setState(() => isHovered = false),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // actual icon
            Padding(
              padding: const EdgeInsets.only(bottom: 18.0),
              child: SvgPicture.asset(
                widget.icon,
                // colorFilter: ColorFilter.mode(
                //   isHovered ? AppTheme.fontDarkColor : widget.defaultColor,
                //   BlendMode.srcIn,
                // ),
                color: isHovered ? AppTheme.fontDarkColor : widget.defaultColor,
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
    );
  }

  /// Member Functions
  ///
  ///
  Future<void> _launchURL() async => Utils.openURL(widget.launchURL);
}
