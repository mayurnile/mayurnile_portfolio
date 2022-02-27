import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../core/core.dart';

class SkillBadge extends StatelessWidget {
  final String icon;
  final String title;

  const SkillBadge({
    Key? key,
    required this.icon,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24.0),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          width: 3.0,
          color: AppTheme.secondaryColor,
        ),
      ),
      child: SvgPicture.asset(
        icon,
        height: 48.0,
        width: 48.0,
        fit: BoxFit.fitHeight,
      ),
    );
  }
}
