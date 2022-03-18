import 'package:flutter/material.dart';

import '../../../core/core.dart';

import './experience_card_desktop.dart';
import './experience_card_tablet.dart';
import './experience_card_mobile.dart';

enum ExperienceCardType { mobile, tablet, desktop }

class ExperienceCard extends StatelessWidget {
  final Experience experience;
  final Color color;
  final bool isLast;
  final ExperienceCardType type;

  const ExperienceCard({
    Key? key,
    required this.experience,
    required this.color,
    required this.type,
    this.isLast = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    switch (type) {
      case ExperienceCardType.mobile:
        return ExperienceCardMobile(
          experience: experience,
          color: color,
          isLast: isLast,
        );
      case ExperienceCardType.tablet:
        return ExperienceCardTablet(
          experience: experience,
          color: color,
          isLast: isLast,
        );
      case ExperienceCardType.desktop:
        return ExperienceCardDesktop(
          experience: experience,
          color: color,
          isLast: isLast,
        );
    }
  }
}
