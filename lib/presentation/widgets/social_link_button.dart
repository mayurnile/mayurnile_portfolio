import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

enum SocialLinkType { github, linkedin, discord }

class SocialLinkButton extends StatelessWidget {
  final String icon;
  final SocialLinkType type;
  const SocialLinkButton({
    Key? key,
    required this.icon,
    required this.type,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Padding(
        padding: const EdgeInsets.only(bottom: 18.0),
        child: SvgPicture.asset(icon),
      ),
    );
  }
}
