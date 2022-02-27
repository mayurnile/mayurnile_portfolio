import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../core/core.dart';

enum BadgeType { mobile, tablet, desktop }

class SkillBadge extends StatelessWidget {
  final String icon;
  final String title;
  final BadgeType type;

  const SkillBadge({
    Key? key,
    required this.icon,
    required this.title,
    required this.type,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double iconSize;
    double padding;
    switch (type) {
      case BadgeType.mobile:
        iconSize = 22.0;
        padding = 12.0;
        break;
      case BadgeType.tablet:
        iconSize = 36.0;
        padding = 18.0;
        break;
      case BadgeType.desktop:
        iconSize = 48.0;
        padding = 24.0;
        break;
    }

    return Container(
      padding: EdgeInsets.all(padding),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          width: 3.0,
          color: AppTheme.secondaryColor,
        ),
      ),
      child: SvgPicture.asset(
        icon,
        height: iconSize,
        width: iconSize,
        fit: BoxFit.fitHeight,
      ),
    );
  }
}
